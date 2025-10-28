@extends('templates.basic.layouts.mobile-user')

@push('styles')
    <link rel="stylesheet" href="{{ asset('assets/templates/basic/css/main.css') }}">
    <link href="{{ asset('assets/templates/basic/css/color.php') }}?color={{ $general->base_color }}" rel="stylesheet" />
    <style>
        body,
        .bg-black {
            background-color: black;
        }

        p {
            margin-top: 0;
        }
    </style>
@endpush
@section('content')
    <div class="row">
        <div class="col-12 p-1">
            <div class="card bg-transparent border-1 border-white">
                <div class="card-body">
                    <div class="row">
                        <div class="col-8">
                            <p>Total Assets [{{ $general->cur_sym }}]</p>
                            <h4 class="text-white currency" id="total-asset"
                                data-currency="{{ number_format($user->balance, 5) }}">
                                {{ number_format($user->balance, 5) }}
                            </h4>
                            <p class="text-muted">&approx; <span class="currency"
                                    data-currency="{{ number_format($user->balance, 5) }}">{{ number_format($user->balance, 5) }}</span>
                                USD</p>
                            <p>UUID: {{ $user->id }}</p>
                        </div>
                        <div class="col-4">
                            <div class="d-flex align-items-center justify-content-end">
                                <span class="show-assets-info" id="show-assets-info">
                                    <i class="fas fa-eye"></i>
                                </span>
                                <span class="hide-assets-info d-none" id="hide-assets-info">
                                    <i class="fas fa-eye-slash"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="row mt-0">
                        <div class="col-4 text-start">
                            <a href="{{ route('user.deposit.index') }}" class="text-decoration-none text-info">Deposit</a>
                        </div>
                        <div class="col-4 text-center">
                            <a class="text-decoration-none text-info"
                                href="{{ route('mobile-user.withdraw') }}">Withdraw</a>
                        </div>
                        <div class="col-4 text-end">
                            <a href="#" class="text-decoration-none text-info">Transfer</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card bg-transparent border-1 border-white mt-3">
                <div class="card-header m-0">
                    <h4 class="card-title m-0">Your Info</h4>
                </div>
                <div class="card-body pt-0">
                    <div class="d-flex justify-content-between align-items-center">
                        <p class="m-0">First Name</p>
                        <p class="m-0 text-end">{{ $user->firstname }}</p>
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <p class="m-0">Last Name</p>
                        <p class="m-0 text-end">{{ $user->lastname }}</p>
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <p class="m-0">Username</p>
                        <p class="m-0 text-end">{{ $user->username }}</p>
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <p class="m-0">Email</p>
                        <p class="m-0 text-end">{{ $user->email }}</p>
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <p class="m-0">Phone</p>
                        <p class="m-0 text-end">{{ $user->mobile }}</p>
                    </div>
                    @foreach ($user->address as $key => $address)
                        @if (!empty($address))
                            <div class="d-flex justify-content-between align-items-center">
                                <p class="m-0">{{ ucfirst($key) }}</p>
                                <p class="m-0 text-end">{{ ucfirst($address) }}</p>
                            </div>
                        @endif
                    @endforeach
                    <div class="d-flex justify-content-between align-items-center">
                        <p class="m-0">Score</p>
                        <p class="m-0 text-end">{{ $user->score ?? 0 }}</p>
                    </div>
                    <hr>
                    <div class="row mt-0">
                        <div class="col-4 text-start">
                            <a href="{{ route('mobile-user.profile.setting') }}" class="text-decoration-none text-info">
                                Edit Profile
                            </a>
                        </div>
                        <div class="col-4 text-center">
                            <a class="text-decoration-none text-info" href="{{ route('mobile-user.change.password') }}">
                                <i class="las la-edit me-1"></i>Passowrd
                            </a>
                        </div>
                        <div class="col-4 text-end">
                            <a href="{{ route('mobile-user.twofactor') }}" class="text-decoration-none text-info">
                                2FA Security
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        {{-- <div class="col-12 mt-3 p-0">
            <table class="table table-borderless align-middle text-custom-primary-dark" id="list-crypto-table">
                <tbody id="crypto-list">
                    @foreach ($cryptos as $coin)
                    <tr data-symbol="{{ strtolower($coin['symbol']) }}usdt"
                        style="{{ !$loop->last ? 'border-bottom: 1px solid #3A495C;' : '' }}"
                        data-name="{{ $coin['name'] }}" class="cursor-pointer go-to-chart">
                        <td style="padding: 20px 0 20px 10px;">
                            <div class="d-flex align-items-center">
                                <img src="{{ asset('assets/images/crypto_currency/' . $coin['image']) }}"
                                    alt="{{ $coin['symbol'] }}" width="40px" height="40px"
                                    style="border: 2px solid #2B2B2B; padding: 5px; border-radius: 50%;">
                                <div class="ms-2">
                                    <p class="m-0">
                                        <span style="font-size: 20px;" class="text-info">{{ $coin['symbol'] }}</span>
                                        <span>/USDT</span>
                                    </p>
                                    <p class="m-0" style="font-size: 15px;">
                                        24H VOL <span>{{ number_format_short($coin['volume_24h'], 2) }}</span>
                                    </p>
                                </div>
                            </div>
                        </td>
                        <td class="text-end">
                            <p class="m-0 price" style="font-size: 17px;">{{ number_format($coin['price'], decimals: 6) }}
                            </p>
                        </td>
                        <td class="text-end" style="padding: 20px 10px 20px 0">
                            <span class="btn change px-2"
                                style="width: 100px; background: {{ $coin['twenty_four'] >= 0 ? '#198754' : '#dc3545' }}; color:white;">
                                {{ number_format($coin['twenty_four'], 2, '.', '') }}%
                            </span>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div> --}}
    </div>
@endsection

@push('scripts')
    <script>
        "use strict";
        (function ($) {
            $('.show-assets-info').on('click', function () {
                $('.hide-assets-info').removeClass('d-none');
                $('.show-assets-info').addClass('d-none');
                $('.currency').text('**********');
            });
            $('.hide-assets-info').on('click', function () {
                $('.hide-assets-info').addClass('d-none');
                $('.show-assets-info').removeClass('d-none');
                $('.currency').each((_, element) => $(element).text($(element).data('currency')));
            });
        })(jQuery);
    </script>
    {{--
    <script>
        // Get all rows and subscribe to their pairs
        const rows = document.querySelectorAll('#crypto-list tr');
        const symbols = Array.from(rows).map(row => row.dataset.symbol);

        // Create one WebSocket per symbol (Binance API supports this)
        symbols.forEach(symbol => {
            const ws = new WebSocket(`wss://stream.binance.com:9443/ws/${symbol}@ticker`);

            ws.onmessage = (event) => {
                const data = JSON.parse(event.data);
                const price = parseFloat(data.c).toFixed(6);
                const change = parseFloat(data.P).toFixed(2);

                const row = document.querySelector(`tr[data-symbol="${symbol}"]`);
                if (row) {
                    // Update price
                    const priceEl = row.querySelector('.price');
                    const oldPrice = parseFloat(priceEl.innerText.replace(/,/g, '')) || 0;
                    priceEl.innerText = price;

                    // Change color animation on update
                    if (price > oldPrice) priceEl.style.color = '#00ff00';
                    else if (price < oldPrice) priceEl.style.color = '#ff0000';
                    setTimeout(() => priceEl.style.color = '', 500);

                    // Update change %
                    const changeEl = row.querySelector('.change');
                    changeEl.innerText = `${change}%`;
                    changeEl.style.background = change >= 0 ? '#198754' : '#dc3545';
                }
            };
        });

        $(document).on('click', '.go-to-chart', function () {
            let name = $(this).data('name');
            window.location.href = "{{ route('mobile-user.chart') }}/" + name;
        });
    </script> --}}
@endpush
