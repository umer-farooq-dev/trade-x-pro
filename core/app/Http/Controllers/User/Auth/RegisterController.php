<?php

namespace App\Http\Controllers\User\Auth;

use App\Constants\Status;
use App\Http\Controllers\Controller;
use App\Models\Admin;
use App\Models\AdminNotification;
use App\Models\User;
use App\Models\UserLogin;
use Illuminate\Auth\Events\Registered;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rules\Password;

class RegisterController extends Controller
{
    use RegistersUsers;
    public function __construct()
    {
        parent::__construct();
        $this->middleware('guest');
        $this->middleware('registration.status')->except('registrationNotAllowed');
    }

    public function showRegistrationForm(Request $request)
    {
        if (auth()->check()) {
            return redirect()->route('user.home');
        }

        if (!$request->query('ref') && !session()->has('reference')) {
            $notify[] = ['error', 'No referral code provided'];
            return redirect()->route('user.home')->withNotify($notify);
        }

        $pageTitle = "Register";

        $info = json_decode(json_encode(getIpInfo()), true);
        $mobileCode = @implode(',', $info['code']);
        $countries = json_decode(file_get_contents(resource_path('views/partials/country.json')));
        if (!$request->query('ref')) {
            session()->forget(['reference', 'referrer_name']);
        }

        return view($this->activeTemplate . 'user.auth.register', compact('pageTitle', 'mobileCode', 'countries'));
    }
    public function showRegistrationFormWithReferral(Request $request, $referralCode)
    {
        $pageTitle = "Register";
        $info = json_decode(json_encode(getIpInfo()), true);
        $mobileCode = @implode(',', $info['code']);
        $countries = json_decode(file_get_contents(resource_path('views/partials/country.json')));
        $referrer = Admin::where('invitation_code', $referralCode)->first();

        if (!$referrer) {
            $notify[] = ['error', 'Invalid referral code provided'];
            return redirect()->route('user.register')->withNotify($notify);
        }
        session()->put('reference', $referralCode);
        session()->put('referrer_name', $referrer->name);

        return view($this->activeTemplate . 'user.auth.register', compact('pageTitle', 'mobileCode', 'countries'));
    }
    protected function validator(array $data)
    {
        $general = gs();
        $passwordValidation = Password::min(6);
        if ($general->secure_password) {
            $passwordValidation = $passwordValidation->mixedCase()->numbers()->symbols()->uncompromised();
        }
        $agree = 'nullable';
        if ($general->agree) {
            $agree = 'required';
        }

        return Validator::make($data, [
            'email' => 'required|string|email|unique:users',
            'password' => ['required', 'confirmed', $passwordValidation],
            'username' => 'required|unique:users|min:6',
            'captcha' => 'sometimes|required',
            'agree' => $agree
        ]);
    }

    public function register(Request $request)
    {
        $this->validator(data: $request->all())->validate();
        $request->session()->regenerateToken();
        if (preg_match("/[^a-z0-9_]/", trim($request->username))) {
            $notify[] = ['info', 'Username can contain only small letters, numbers and underscore.'];
            $notify[] = ['error', 'No special character, space or capital letters in username.'];
            return back()->withNotify($notify)->withInput($request->all());
        }
        if (!verifyCaptcha()) {
            $notify[] = ['error', 'Invalid captcha provided'];
            return back()->withNotify($notify);
        }

        // $exist = User::where('mobile', $request->mobile_code . $request->mobile)->first();
        // if ($exist) {
        //     $notify[] = ['error', 'The mobile number already exists'];
        //     return back()->withNotify($notify)->withInput();
        // }

        event(new Registered($user = $this->create($request->all())));

        $this->guard()->login($user);

        session()->forget(['reference', 'referrer_name']);

        return $this->registered($request, $user)
            ?: redirect($this->redirectPath());
    }

    protected function create(array $data)
    {
        $general = gs();

        $referBy = session()->get('reference');
        $referrerId = 0;

        if ($referBy) {
            $referrer = Admin::where('invitation_code', $referBy)->first();
            if ($referrer) {
                $referrerId = $referrer->id;
            }
        }

        // User Create
        $user = new User();
        $user->email = strtolower($data['email']);
        $user->password = Hash::make($data['password']);
        $user->username = $data['username'];
        $user->ref_by = $referrerId;
        // $user->country_code = $data['country_code'];
        // $user->mobile = $data['mobile_code'] . $data['mobile'];
        $user->address = [
            'address' => '',
            'state' => '',
            'zip' => '',
            'country' => isset($data['country']) ? $data['country'] : null,
            'city' => ''
        ];
        $user->kv = $general->kv ? Status::NO : Status::YES;
        $user->ev = $general->ev ? Status::NO : Status::YES;
        $user->sv = $general->sv ? Status::NO : Status::YES;
        $user->ts = 0;
        $user->tv = 1;
        $user->save();

        $adminNotification = new AdminNotification();
        $adminNotification->user_id = $user->id;
        $adminNotification->title = 'New member registered';
        $adminNotification->click_url = urlPath('admin.users.detail', $user->id);
        $adminNotification->save();

        // Login Log Create
        $ip = getRealIP();
        $exist = UserLogin::where('user_ip', $ip)->first();
        $userLogin = new UserLogin();

        if ($exist) {
            $userLogin->longitude = $exist->longitude;
            $userLogin->latitude = $exist->latitude;
            $userLogin->city = $exist->city;
            $userLogin->country_code = $exist->country_code;
            $userLogin->country = $exist->country;
        } else {
            $info = json_decode(json_encode(getIpInfo()), true);
            $userLogin->longitude = @implode(',', $info['long']);
            $userLogin->latitude = @implode(',', $info['lat']);
            $userLogin->city = @implode(',', $info['city']);
            $userLogin->country_code = @implode(',', $info['code']);
            $userLogin->country = @implode(',', $info['country']);
        }

        $userAgent = osBrowser();
        $userLogin->user_id = $user->id;
        $userLogin->user_ip = $ip;
        $userLogin->browser = @$userAgent['browser'];
        $userLogin->os = @$userAgent['os_platform'];
        $userLogin->save();

        return $user;
    }

    public function checkUser(Request $request)
    {
        $exist['data'] = false;
        $exist['type'] = null;
        if ($request->email) {
            $exist['data'] = User::where('email', $request->email)->exists();
            $exist['type'] = 'email';
        }
     
        if ($request->username) {
            $exist['data'] = User::where('username', $request->username)->exists();
            $exist['type'] = 'username';
        }
        return response($exist);
    }

    public function registered()
    {
        return to_route('user.home');
    }
}
