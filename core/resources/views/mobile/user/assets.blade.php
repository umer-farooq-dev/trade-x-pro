@extends('templates.basic.layouts.mobile-user')

@push('styles')
    <link rel="stylesheet" href="{{ asset('assets/templates/basic/css/main.css') }}">
    <link href="{{ asset('assets/templates/basic/css/color.php') }}?color={{ $general->base_color }}" rel="stylesheet" />
    <style>
        body {
            background-color: black;
            color: #EAECEF;
        }

        .card {
            /* background-color: #1A2025 !important; */
            background-color: transparent !important;
            border: none !important;
            border-radius: 8px;
        }

        .text-muted {
            color: #8E9297 !important;
        }

        .text-info {
            color: #F0B90B !important;
        }

        .btn-secondary-custom {
            background-color: #2B3137;
            color: #EAECEF;
            font-weight: bold;
            border-radius: 5px;
            padding: 12px 15px;
            font-size: 16px;
            text-decoration: none;
            display: block;
            text-align: center;
        }

        .nav-icons i {
            font-size: 24px;
            color: #8E9297;
        }

        hr {
            border-top: 1px solid #3A495C;
            margin: 1rem 0;
        }

        .total-value-wrapper h4 {
            font-size: 2.5em;
            /* Larger font for total value */
            margin-bottom: 0;
        }

        .total-value-wrapper p {
            font-size: 1.1em;
            margin-top: 5px;
        }

        .info-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 8px 0;
        }

        .info-item p {
            margin: 0;
            font-size: 1em;
        }

        .info-item p:first-child {
            color: #8E9297;
        }

        .info-item p:last-child {
            color: #EAECEF;
            font-weight: 500;
        }

        .info-footer-links .col-4 {
            text-align: center;
        }

        .info-footer-links .col-4:first-child {
            text-align: left;
        }

        .info-footer-links .col-4:last-child {
            text-align: right;
        }

        .info-footer-links a {
            font-size: 0.9em;
        }
    </style>
@endpush
@section('content')
    <div class="row">
        <div class="col-12 p-0">
            <div class="d-flex justify-content-between align-items-center px-3 py-3">
                <h4 class="m-0 text-white">Overview</h4>
                <div class="nav-icons d-flex align-items-center">
                    <span class="show-assets-info me-3" id="show-assets-info">
                        <i class="fas fa-eye text-white"></i>
                    </span>
                    <span class="hide-assets-info me-3 d-none" id="hide-assets-info">
                        <i class="fas fa-eye-slash text-white"></i>
                    </span>
                </div>
            </div>

            <div class="card p-3 mx-2 mt-2">
                <div class="card-body p-0">
                    <p class="text-muted m-0 mb-3">Est. Total Value [{{ $general->cur_sym }}]</p>
                    <div class="total-value-wrapper d-flex align-items-end justify-content-between">
                        <h4 class="text-white currency" id="total-asset"
                            data-currency="{{ number_format($user->balance, 5) }}">
                            {{ number_format($user->balance, 5) }} USDT
                        </h4>
                    </div>
                    <p class="text-muted m-0 mt-2">&approx; <span class="currency"
                            data-currency="{{ number_format($user->balance, 5) }}">{{ number_format($user->balance, 5) }}</span>
                        USD</p>

                    <div class="row mt-4 gx-2">
                        <div class="col-4">
                            <a href="{{ route('user.deposit.index') }}" class="btn-secondary-custom">Deposit</a>
                        </div>
                        <div class="col-4">
                            <a class="btn-secondary-custom" href="{{ route('mobile-user.withdraw') }}">Withdraw</a>
                        </div>
                        <div class="col-4">
                            <a href="#" class="btn-secondary-custom">Transfer</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card p-3 mx-2 mt-3">
                <div class="card-header m-0 p-0 mb-3">
                    <h5 class="card-title m-0 text-white">Your Info</h5>
                </div>
                <div class="card-body p-0">
                    <div class="info-item">
                        <p>First Name</p>
                        <p>{{ $user->firstname }}</p>
                    </div>
                    <div class="info-item">
                        <p>Last Name</p>
                        <p>{{ $user->lastname }}</p>
                    </div>
                    <div class="info-item">
                        <p>Username</p>
                        <p>{{ $user->username }}</p>
                    </div>
                    <div class="info-item">
                        <p>Email</p>
                        <p>{{ $user->email }}</p>
                    </div>
                    <div class="info-item">
                        <p>Phone</p>
                        <p>{{ $user->mobile }}</p>
                    </div>
                    @foreach ($user->address as $key => $address)
                        @if (!empty($address))
                            <div class="info-item">
                                <p>{{ ucfirst(str_replace('_', ' ', $key)) }}</p> {{-- Format key for display --}}
                                <p>{{ ucfirst($address) }}</p>
                            </div>
                        @endif
                    @endforeach
                    <div class="info-item">
                        <p>Score</p>
                        <p>{{ $user->score ?? 0 }}</p>
                    </div>
                    <hr>
                    <div class="row mt-3 info-footer-links">
                        <div class="col-4">
                            <a href="{{ route('mobile-user.profile.setting') }}" class="text-decoration-none btn-secondary-custom">
                                Edit Profile
                            </a>
                        </div>
                        <div class="col-4">
                            <a class="text-decoration-none btn-secondary-custom" href="{{ route('mobile-user.change.password') }}">
                                <i class="las la-edit me-1"></i>Password
                            </a>
                        </div>
                        <div class="col-4">
                            <a href="{{ route('mobile-user.twofactor') }}" class="text-decoration-none btn-secondary-custom">
                                2FA Security
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
    <script>
        "use strict";
        (function ($) {
            function toggleAssetVisibility(show) {
                if (show) {
                    $('.hide-assets-info').addClass('d-none');
                    $('.show-assets-info').removeClass('d-none');
                    $('.currency').each((_, element) => $(element).text($(element).data('currency')));
                } else {
                    $('.hide-assets-info').removeClass('d-none');
                    $('.show-assets-info').addClass('d-none');
                    $('.currency').text('**********');
                }
            }

            // Initial state: hide assets if 'hide_assets' is true in localStorage
            // Check if 'hide_assets' is explicitly 'true' (as localStorage stores strings)
            const hideAssets = localStorage.getItem('hide_assets') === 'true';
            toggleAssetVisibility(!hideAssets); // Pass true to show, false to hide

            // Click handlers
            $('.show-assets-info').on('click', function () {
                toggleAssetVisibility(false);
                localStorage.setItem('hide_assets', 'true'); // Store as string 'true'
            });
            $('.hide-assets-info').on('click', function () {
                toggleAssetVisibility(true);
                localStorage.setItem('hide_assets', 'false'); // Store as string 'false'
            });
        })(jQuery);
    </script>
@endpush
