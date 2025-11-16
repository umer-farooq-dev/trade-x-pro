<!-- Sidebar -->
<div id="sidebar" class="bg-custom-primary position-fixed top-0 p-0 pt-3 d-flex justify-content-between flex-column"
    style="width: 80%;left:-100%; z-index:1050;">
    @if (Auth::check())
        <div class="user-details text-center mt-2" style="height: {{ Auth::check() ? '25%' : 'unset' }}; overflow-y: auto;">
            <img src="https://ui-avatars.com/api/?name={{ Auth::user()?->firstname . ' ' . Auth::user()?->lastname }}"
                alt="Avatar" class="rounded-circle mb-2" width="100" height="100">
            <h5 class="fw-bold mb-0 text-custom-primary-dark">Hello, <span
                    class="name">{{ Str::limit(Auth::user()?->firstname . ' ' . Auth::user()?->lastname, 30)}}</span></h5>
            <h6 class="text-secondary mt-2">@lang('UID'): <span class="uuid">{{ auth()->user()?->id }}</span>
                <img src="{{ asset('assets/mobile-user/img/copy.png') }}" alt="Copy" width="15" id="copyUUIDbutton">
            </h6>
        </div>
    @endif

    <ul class="list-unstyled links" style="height:60%">
        <li class="mb-2 hover-bg {{ $currentRoute == 'mobile-user.trade-logs' ? 'active' : '' }}">
            <a href="{{ route('mobile-user.trade-logs') }}" class="text-white d-block py-2 px-3">
                {{-- <img src="{{ asset('assets/mobile-user/img/sidebar/.png') }}" alt="" class="icon"> --}}
                Trading Logs
            </a>
        </li>
        <li class="mb-2 hover-bg {{ $currentRoute == 'mobile-user.transactions' ? 'active' : '' }}">
            <a href="{{ route('mobile-user.transactions') }}" class="text-white d-block py-2 px-3">
                {{-- <img src="{{ asset('assets/mobile-user/img/sidebar/deposite.png') }}" alt="" class="icon"> --}}
                Transactions History
            </a>
        </li>

        <li class="mb-2 hover-bg">
            <a href="#kycDropdown" data-bs-toggle="collapse" class="text-white d-block py-2 px-3"
                data-expended="{{ in_array($currentRoute, ['mobile-user.kyc.form', 'mobile-user.kyc.data']) ? 'true' : 'false' }}">
                KYC
                <i class="las la-angle-down float-end"></i>
            </a>
            <ul class="collapse list-unstyled ps-3 {{ in_array($currentRoute, ['mobile-user.kyc.form', 'mobile-user.kyc.data']) ? 'show' : '' }}"
                id="kycDropdown">
       
                    <li class="{{ $currentRoute == 'mobile-user.kyc.form' ? 'active' : '' }}">
                        <a href="{{ route('mobile-user.kyc.form') }}" class="text-white-50 d-block py-1">
                            Complete KYC
                        </a>
                    </li>
                
                    <li class="{{ $currentRoute == 'mobile-user.kyc.data' ? 'active' : '' }}">
                        <a href="{{ route('mobile-user.kyc.data') }}" class="text-white-50 d-block py-1">
                            KYC Info
                        </a>
                    </li>
                
            </ul>
        </li>

        <li class="mb-2 hover-bg">
            <a href="#withdrawDropdown" data-bs-toggle="collapse" class="text-white d-block py-2 px-3"
                data-expended="{{ in_array($currentRoute, ['mobile-user.withdraw', 'mobile-user.withdraw.history']) ? 'true' : 'false' }}">
                Withdraw
                <i class="las la-angle-down float-end"></i>
            </a>
            <ul class="collapse list-unstyled ps-3 {{ in_array($currentRoute, ['mobile-user.withdraw', 'mobile-user.withdraw.history']) ? 'show' : '' }}"
                id="withdrawDropdown">
                <li class="{{ $currentRoute == 'mobile-user.withdraw' ? 'active' : '' }}">
                    <a href="{{ route('mobile-user.withdraw') }}" class="text-white-50 d-block py-1">
                        Withdraw Now
                    </a>
                </li>
                <li class="{{ $currentRoute == 'mobile-user.withdraw.history' ? 'active' : '' }}">
                    <a href="{{ route('mobile-user.withdraw.history') }}" class="text-white-50 d-block py-1">
                        Withdraw History
                    </a>
                </li>
            </ul>
        </li>

        <li class="mb-2 hover-bg">
            <a href="#depsitDropdown" data-bs-toggle="collapse" class="text-white d-block py-2 px-3"
                data-expended="{{ in_array($currentRoute, ['mobile-user.deposit.index', 'mobile-user.deposit.history']) ? 'true' : 'false' }}">
                Depsit
                <i class="las la-angle-down float-end"></i>
            </a>
            <ul class="collapse list-unstyled ps-3 {{ in_array($currentRoute, ['mobile-user.deposit.index', 'mobile-user.deposit.history']) ? 'show' : '' }}"
                id="depsitDropdown">
                <li class="{{ $currentRoute == 'mobile-user.deposit.index' ? 'active' : '' }}">
                    <a href="{{ route('mobile-user.deposit.index') }}" class="text-white-50 d-block py-1">
                        Despite Now
                    </a>
                </li>
                <li class="{{ $currentRoute == 'mobile-user.deposit.history' ? 'active' : '' }}">
                    <a href="{{ route('mobile-user.deposit.history') }}" class="text-white-50 d-block py-1">
                        Despite History
                    </a>
                </li>
            </ul>
        </li>

        <li class="mb-2 hover-bg">
            <a href="#settingDropdown" data-bs-toggle="collapse" class="text-white d-block py-2 px-3"
                data-expended="{{ in_array($currentRoute, ['mobile-user.profile.setting', 'mobile-user.change.password', 'mobile-user.twofactor']) ? 'true' : 'false' }}">
                Settings
                <i class="las la-angle-down float-end"></i>
            </a>
            <ul class="collapse list-unstyled ps-3 {{ in_array($currentRoute, ['mobile-user.profile.setting', 'mobile-user.change.password', 'mobile-user.twofactor']) ? 'show' : '' }}"
                id="settingDropdown">
                <li class="{{ $currentRoute == 'mobile-user.profile.setting' ? 'active' : '' }}">
                    <a href="{{ route('mobile-user.profile.setting') }}" class="text-white-50 d-block py-1">Profile
                        Settings</a>
                </li>
                <li class="{{ $currentRoute == 'mobile-user.change.password' ? 'active' : '' }}">
                    <a href="{{ route('mobile-user.change.password') }}" class="text-white-50 d-block py-1">Change
                        Password</a>
                </li>
                <li class="{{ $currentRoute == 'mobile-user.twofactor' ? 'active' : '' }}">
                    <a href="{{ route('mobile-user.twofactor') }}" class="text-white-50 d-block py-1">2FA
                        Security</a>
                </li>
            </ul>
        </li>

        <li class="mb-2 hover-bg">
            <a href="#referralSubmenu" data-bs-toggle="collapse" class="text-white d-block py-2 px-3"
                data-expended="{{ in_array($currentRoute, ['mobile-user.referral', 'mobile-user.referral.commissions']) ? 'true' : 'false' }}">
                Referral
                <i class="las la-angle-down float-end"></i>
            </a>
            <ul class="collapse list-unstyled ps-3 {{ in_array($currentRoute, ['mobile-user.referral', 'mobile-user.referral.commissions']) ? 'show' : '' }}"
                id="referralSubmenu">
                <li class="{{ $currentRoute == 'mobile-user.referral' ? 'active' : '' }}">
                    <a href="{{ route('mobile-user.referral') }}" class="text-white-50 d-block py-1"> Referrals
                        Logs</a>
                </li>
                <li class="{{ $currentRoute == 'mobile-user.referral.commissions' ? 'active' : '' }}">
                    <a href="{{ route('mobile-user.referral.commissions') }}"
                        class="text-white-50 d-block py-1">Referrals Commission</a>
                </li>
            </ul>
        </li>

        <li class="mb-2 hover-bg {{ $currentRoute == 'mobile-user.collection-information' ? 'active' : '' }}">
            <a href="{{ route('mobile-user.collection-information') }}" class="text-white d-block py-2 px-3">
                {{-- <img src="{{ asset('assets/mobile-user/img/sidebar/deposite.png') }}" alt="" class="icon"> --}}
                Collection Information
            </a>
        </li>
    </ul>

    <ul class="list-unstyled links" style="height:10%;">
        <li class="mb-2 hover-bg">
            @if (Auth::check())
                <a href="{{ route('user.logout') }}" class="text-white d-block py-2 px-3">
                    <i class="las la-sign-out-alt icon text-custom-primary"></i>
                    Logout
                </a>
            @else
                <a href="{{ route('user.login') }}" class="text-white d-block py-2 px-3">
                    <i class="las la-sign-in-alt icon text-custom-primary"></i>
                    Login
                </a>
            @endif
        </li>
    </ul>
</div>

<!-- Overlay -->
<div id="sidebar-overlay" style=" position:fixed; top:0; left:-100%; width:100%; height:100%;
         background:rgba(0,0,0,.5); z-index:1049; transition: var(--sidebar-transition-time);">
</div>

@push('scripts')
    <script>
        $(document).ready(function () {
            $('#toggleSidebar').on('click', function () {
                $('#sidebar, #sidebar-overlay').css('left', 0);
            });
            $('#sidebar-overlay').on('click', function () {
                $('#sidebar, #sidebar-overlay').css('left', '-100%');
            });
            $("#copyUUIDbutton").on('click', function () {
                let textArea = document.createElement('textarea');
                let uuidSpan = $(this).closest('.user-details').find('.uuid');
                let uuid = uuidSpan.text();
                textArea.value = uuid;
                document.body.appendChild(textArea);
                textArea.select();
                document.execCommand('copy');
                document.body.removeChild(textArea);
                uuidSpan.text('Copied!');
                setTimeout(() => {
                    uuidSpan.text(uuid);
                }, 3000);
            });
        });
    </script>
@endpush
