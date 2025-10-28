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
            height: calc(100% - var(--menu-height));
        }

        #sidebar a {
            text-decoration: none;
        }

        #sidebar ul.links {
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
    <div id="navbar" style="">
        @hasSection('navbar')
            @yield('navbar')
        @else
            @include('templates.basic.partials.mobile_header')
        @endif
    </div>

    @include('templates.basic.partials.mobile_sidebar')

    <div class="container @yield('container-class', 'p-3')">
        @yield('content')
    </div>
    @include('partials.notify')

    @include('templates.basic.partials.mobile_menu')

    {{-- Default Js for all pages --}}
    <script src="{{asset('assets/global/js/jquery-3.6.0.min.js')}}"></script>
    <script src="{{asset('assets/global/js/bootstrap.bundle.min.js')}}"></script>
    @stack('scripts')
</body>

</html>
