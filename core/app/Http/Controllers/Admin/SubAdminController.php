<?php

namespace App\Http\Controllers\Admin;

use App\Models\Admin;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class SubAdminController extends Controller
{
    public function __construct()
    {
        $this->middleware('admin');
    }

    public function index()
    {
        if (auth()->guard('admin')->user()->isSubAdmin != 0) {
            abort(403, 'Unauthorized action.');
        }

        $pageTitle = "SubAdmins";
        $subAdmins = Admin::where('isSubAdmin', 1)->get();
        return view('admin.subadmin.index', compact('pageTitle', 'subAdmins'));
    }

    public function create()
    {
        if (auth()->guard('admin')->user()->isSubAdmin != 0) {
            abort(403, 'Unauthorized action.');
        }

        $pageTitle = "Create SubAdmin";
        return view('admin.subadmin.create', compact('pageTitle'));
    }

    public function store(Request $request)
    {
        if (auth()->guard('admin')->user()->isSubAdmin != 0) {
            abort(403, 'Unauthorized action.');
        }

        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:admins,email',
            'username' => 'required|string|unique:admins,username|min:6',
            'password' => 'required|string|min:6|confirmed',
        ]);

        $subAdmin = new Admin();
        $subAdmin->name = $request->name;
        $subAdmin->email = $request->email;
        $subAdmin->username = $request->username;
        $subAdmin->password = Hash::make($request->password);
        $subAdmin->isSubAdmin = 1;
        $subAdmin->invitation_code = Str::random(10);
        $subAdmin->save();

        $notify[] = ['success', 'SubAdmin created successfully'];
        return redirect()->route('admin.subadmin.index')->withNotify($notify);
    }
}
