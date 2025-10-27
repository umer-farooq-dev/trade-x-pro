<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    {{-- Default Css For All Pages --}}
    <link href="{{ asset('assets/global/css/bootstrap.min.css') }}" rel="stylesheet">
    <link href="{{ asset('assets/global/css/all.min.css') }}" rel="stylesheet">
    <link rel="stylesheet" href="{{asset('assets/global/css/line-awesome.min.css')}}" />
    <style>
        :root {
            --bs-primary: #047D5E;
            --bs-secondary: #00D39C;
            --bs-danger: #FF125D;
            --bs-info: #00F0B3;
            --bs-light: #FFFFFF;
            --bs-dark: #032E23;

            --bs-primary-rgb: 4, 125, 94;
            --bs-secondary-rgb: 0, 211, 156;
            --bs-danger-rgb: 255, 18, 93;
            --bs-info-rgb: 0, 240, 179;
            --bs-light-rgb: 255, 255, 255;
            --bs-dark-rgb: 3, 46, 35;

            --bs-blue: var(--bs-info);
            --bs-green: var(--bs-primary);
            --bs-teal: var(--bs-secondary);
            --bs-cyan: var(--bs-info);
            --bs-white: var(--bs-light);
            --bs-gray: #6c757d;
            --bs-gray-dark: #343a40;

            --bs-body-color: var(--bs-dark);
            --bs-body-bg: var(--bs-light);

            --bs-body-font-family: system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif;
            --bs-body-font-size: 1rem;
            --bs-body-font-weight: 400;
            --bs-body-line-height: 1.5;

            --var-primary-text-color: #00FEBB;
            --var-primary-bg-color: #353535;
            --var-primary-dark-text-color: #768da9;

            --sidebar-trasition-time: 0.5s;
            --menu-height: 50px;
        }

        .bg-custom-primary {
            background-color: var(--var-primary-bg-color);
        }

        .bg-primary-light {
            background-color: #72c825 !important;
        }

        .text-custom-primary {
            color: var(--var-primary-text-color);
        }

        .text-custom-primary-dark {
            color: var(--var-primary-dark-text-color);
        }

        .cursor-pointer {
            cursor: pointer;
        }


        .btn--base,
        .badge--base,
        .bg--base {
            background-color: #2e86de !important;
        }

        .btn--primary,
        .badge--primary,
        .bg--primary {
            background-color: #7367f0 !important;
        }

        .btn--secondary .badge--secondary .bg--secondary {
            background-color: #868e96 !important;
        }

        .btn--success,
        .badge--success,
        .bg--success {
            background-color: #28c76f !important;
        }

        .btn--danger,
        .badge--danger,
        .bg--danger {
            background-color: #EA2027 !important;
        }

        .btn--warning,
        .badge--warning,
        .bg--warning {
            background-color: #f99f0b !important;
        }

        .btn--info,
        .badge--info,
        .bg--info {
            background-color: #1e9ff2 !important;
        }

        .btn--dark,
        .badge--dark,
        .bg--dark {
            background-color: #fff !important;
        }

        .btn--white,
        .badge--white,
        .bg--white {
            background-color: #fff !important;
        }

        .badge--dark {
            background-color: #000 !important;
        }

        body {
            background-color: black;
            overflow-x: hidden;
        }

        #navbar {
            position: sticky;
            top: 0;
            height: 44px;
            background-color: var(--var-primary-bg-color);
            width: 100%;
            z-index: 100;
        }

        #navbar ul {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0;
            height: 100%;
        }

        #navbar ul li {
            list-style: none;
            text-align: center
        }

        .hover-bg:hover {
            background-color: rgba(255, 255, 255, 0.1);
            transition: 0.2s;
        }

        #sidebar {
            transition: var(--sidebar-trasition-time);
        }

        #sidebar a {
            text-decoration: none;
        }

        #sidebar ul.links {
            max-height: 70%;
            overflow-y: auto
        }

        #sidebar ul.links li {
            padding: 10px;
        }

        #sidebar ul.links li.active {
            background-color: rgba(255, 255, 255, 0.1);
        }

        #sidebar ul.links a .icon {
            width: 20px;
            margin-right: 10px;
        }

        #menu {
            position: fixed;
            bottom: 0;
            width: 100%;
            height: var(--menu-height);
            background-color: var(--var-primary-bg-color);
            padding: 0;
            padding-top: 10px;
            z-index: 99999999;
        }

        #menu ul {
            display: flex;
            justify-content: space-between;
            align-items: center;
            height: 100%;
            padding: 0
        }

        #menu ul li {
            width: 20%;
            text-align: center;
            list-style: none;
        }

        #menu ul li a {
            text-decoration: none;
            color: white;
            font-size: 12px;
        }

        #menu ul li a img {
            width: 20px;
        }
    </style>
    @stack('styles')
</head>

<body>
    @php
        $currentRoute = Route::currentRouteName();
    @endphp
    <div id="navbar">
        @hasSection('navbar')
            @yield('navbar')
        @else
            <ul>
                <li style="width: 15%;">
                    <img src="{{ asset('assets/mobile-user/img/topbar/user.png') }}" alt="User Icon" width="30px"
                        id="toggleSidebar" />
                </li>
                <li style="width: 70%;">
                    <h4 class="mb-0 text-white" style="letter-spacing: 5px;">
                        TradeExpro
                    </h4>
                </li>
                <li style="width: 15%;">
                    <img src="{{ asset('assets/mobile-user/img/topbar/bell.png') }}" alt="Menu Icon" width="25px" />
                </li>
            </ul>
        @endif
    </div>
    <!-- Sidebar -->
    <div id="sidebar" class="bg-custom-primary vh-100 position-fixed top-0 p-0 pt-3"
        style="width: 80%;left:-100%; z-index:1050;">
        <div class="user-details text-center mb-4 mt-2">
            <img src="{{ asset('assets/images/default.png') }}" alt="Avatar" class="rounded-circle mb-2" width="100"
                height="100">
            <h5 class="fw-bold mb-0 text-custom-primary-dark">Hello, <span class="name">Mudassir Ameen</span></h5>
            <h6 class="text-secondary mt-2">UUID: <span class="uuid">675395</span>
                <img src="{{ asset('assets/mobile-user/img/copy.png') }}" alt="Copy" width="15" id="copyUUIDbutton">
            </h6>
        </div>

        <ul class="list-unstyled links">
            <li class="mb-2 hover-bg {{ $currentRoute == 'mobile-user.trade-logs' ? 'active' : '' }}">
                <a href="{{ route('mobile-user.trade-logs') }}" class="text-white d-block py-2 px-3">
                    {{-- <img src="{{ asset('assets/mobile-user/img/sidebar/.png') }}" alt="" class="icon"> --}}
                    Trading Logs
                </a>
            </li>
            <li class="mb-2 hover-bg {{ $currentRoute == 'mobile-user.withdraw' ? 'active' : '' }}">
                <a href="{{ route('mobile-user.withdraw') }}" class="text-white d-block py-2 px-3">
                    {{-- <img src="{{ asset('assets/mobile-user/img/sidebar/deposite.png') }}" alt="" class="icon"> --}}
                    Withdraw
                </a>
            </li>

            <!-- Dropdown Example -->
            <li class="mb-2 hover-bg">
                <a href="#referralSubmenu" data-bs-toggle="collapse" class="text-white d-block py-2 px-3">
                    <img src="{{ asset('assets/mobile-user/img/sidebar/deposite.png') }}" alt="" class="icon">
                    Referral
                    <i class="las la-angle-down float-end"></i>
                </a>
                <ul class="collapse list-unstyled ps-3" id="referralSubmenu">
                    <li><a href="#" class="text-white-50 d-block py-1">My Referrals</a></li>
                    <li><a href="#" class="text-white-50 d-block py-1">Referral Rewards</a></li>
                </ul>
            </li>
        </ul>
    </div>

    <!-- Overlay -->
    <div id="sidebar-overlay" style=" position:fixed; top:0; left:-100%; width:100%; height:100%;
         background:rgba(0,0,0,.5); z-index:1049; transition: var(--sidebar-transition-time);">
    </div>

    <div id="menu">
        <ul>
            <li>
                <a href="{{ route('mobile-user.dashboard') }}" class="d-flex flex-column align-items-center">
                    <img src="{{  asset('assets/mobile-user/img/menu/home' . ($currentRoute == 'mobile-user.dashboard' ? '-a' : '') . '.png') }}"
                        alt="Home Image" />
                    <span>Home</span>
                </a>
            </li>
            <li>
                <a href="{{ route('mobile-user.crypto') }}" class="d-flex flex-column align-items-center">
                    <img src="{{  asset('assets/mobile-user/img/menu/trade' . ($currentRoute == 'mobile-user.crypto' ? '-a' : '') . '.png') }}"
                        alt="Trade Image" />
                    <span>Trade</span>
                </a>
            </li>
            <li>
                <a href="{{ route('mobile-user.chart') }}"
                    class="d-flex flex-column align-items-center {{ $currentRoute == 'mobile-user.chart' ? 'text-info' : '' }}">
                    <img src="{{  asset('assets/mobile-user/img/menu/option.png') }}" alt="Option Image" />
                    <span>Option</span>
                </a>
            </li>
            <li>
                <a href="" class="d-flex flex-column align-items-center">
                    <img src="{{  asset('assets/mobile-user/img/menu/trust.png') }}" alt="Trust Image" />
                    <span>Trust</span>
                </a>
            </li>
            <li>
                <a href="" class="d-flex flex-column align-items-center">
                    <img src="{{  asset('assets/mobile-user/img/menu/assets.png') }}" alt="Assets Image" />
                    <span>Assets</span>
                </a>
            </li>
        </ul>
    </div>

    <div class="container @yield('container-class', 'p-3')">
        @yield('content')
    </div>
    @include('partials.notify')

    <div style="height: var(--menu-height)"></div>
    {{-- Default Js for all pages --}}
    <script src="{{asset('assets/global/js/jquery-3.6.0.min.js')}}"></script>
    <script src="{{asset('assets/global/js/bootstrap.bundle.min.js')}}"></script>
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
    @stack('scripts')
</body>

</html>
