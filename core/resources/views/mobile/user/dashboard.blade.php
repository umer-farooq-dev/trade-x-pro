@extends('templates.basic.layouts.mobile-user')

@push('styles')
    <link rel="stylesheet" href="{{ asset('assets/templates/basic/css/owl.min.css') }}">
    <style>
        #banners-carousel .carousel-indicators {
            position: unset;
        }

        .banner-item-carousel {
            height: 220px !important;
            width: 100%;
        }

        .banner-item-carousel img {
            width: 100%;
            height: 100%;
            border-radius: 10px;
        }

        #highlights .card {
            background-color: unset;
        }

        #highlights .card-body {
            border-radius: 10px;
            padding: 10px 0;
        }

        #highlights .currency-price {
            font-size: 15px;
        }

        #highlights .currency-change {
            font-size: 14px;
        }

        #quick-links {
            display: flex;
            flex-wrap: nowrap;
            justify-content: space-between;
            margin-top: 20px;
        }

        #quick-links .card-container {
            width: 20%;
        }

        #quick-links .card,
        #quick-links .card-body {
            background-color: unset;
            width: 100%;
            font-size: 14px;
            padding: 0
        }

        #quick-links .card-body img {
            width: 28px;
            height: 28px;
        }

        #gainers-table .custom-table-head {
            border-radius: 20px;
            font-size: 15px;
            color: var(--var-primary-dark-text-color);
            padding: 8px 0;
            margin-bottom: 10px;
        }

        #gainers-table td {
            width: 33.33% !important;
        }

        #gainers-table tr:not(.header) {
            font-size: 15px;
            font-weight: normal;
            color: var(--var-primary-dark-text-color);
        }

        #gainers-table tr.header td {
            padding: 3px !important;
        }
    </style>
@endpush

@section('content')
    <div id="banners-carousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="3000">
        <div class="carousel-inner">
            <div class="carousel-item active banner-item-carousel">
                <img src="{{ asset('assets/images/frontend/blog/63f34173307941676886387.jpg') }}" alt="Image 1">
            </div>
            <div class="carousel-item banner-item-carousel">
                <img src="{{ asset('assets/images/frontend/blog/63f34273c29a21676886643.jpg') }}" alt="Image 2">
            </div>
            <div class="carousel-item banner-item-carousel">
                <img src="{{ asset('assets/images/crypto_currency/681e5a898712b1746819721.jpg') }}" alt="Image 3">
            </div>
        </div>
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#banners-carousel" data-bs-slide-to="0" class="bg-secondary active"
                aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#banners-carousel" data-bs-slide-to="1" aria-label="Slide 2"
                class="bg-secondary"></button>
            <button type="button" data-bs-target="#banners-carousel" data-bs-slide-to="2" aria-label="Slide 3"
                class="bg-secondary"></button>
        </div>
    </div>

    {{-- Highlights --}}
    <div class="row g-2" id="highlights">
        @foreach($cryptos->take(3) as $crypto)
            @php
                $pair = strtolower($crypto['symbol']) . 'usdt';
            @endphp
            <div class="col-4">
                <div class="card border-0">
                    <div class="card-body text-center bg-custom-primary" id="highlight-{{ $pair }}">
                        <h6 class="text-custom-primary-dark fw-normal currency-symbol">{{ strtoupper($crypto['symbol']) }}/USDT
                        </h6>
                        <p class="text-custom-primary fw-normal mb-0 currency-price" data-symbol="{{ $pair }}">
                            {{ $crypto['price'] }}
                        </p>
                        <p class="text-custom-primary-dark fw-normal mb-0 currency-change" data-symbol="{{ $pair }}">
                            {{ number_format($crypto['twenty_four'], 2, '.', '') }}%
                        </p>
                    </div>
                </div>
            </div>
        @endforeach
    </div>

    {{-- Quick Links --}}
    <div id="quick-links" class="text-center">
        @php
            $links = [
                ['img' => 'finance.png', 'title' => 'Finance', 'route' => 'mobile-user.crypto'],
                ['img' => 'options.png', 'title' => 'Option', 'route' => 'mobile-user.chart'],
                ['img' => 'publication.png', 'title' => 'Publication', 'route' => 'mobile-user.publication'],
                ['img' => 'share.png', 'title' => 'Share', 'route' => 'mobile-user.referral'],
                ['img' => 'chat.png', 'title' => 'Chat', 'route' => 'mobile-user.chat'],
            ];
        @endphp
        @foreach($links as $link)
            <div class="card-container">
                <div class="card bg-none border-0">
                    <div class="card-body bg-none text-center">
                        <a href="{{ route($link['route']) }}" class="d-contents text-decoration-none">
                            <img src="{{ asset('assets/mobile-user/img/' . $link['img']) }}" alt="{{ $link['title'] }}">
                            <p class="fw-normal text-white mt-1">{{ $link['title'] }}</p>
                        </a>
                    </div>
                </div>
            </div>
        @endforeach
    </div>

    {{-- Gainers Table --}}
    <h2 class="text-center text-custom-primary">
        <img src="{{ asset('assets/mobile-user/img/left-title-bar.png') }}" alt="" width="70px">
        <span class="mx-2">Gainers</span>
        <img src="{{ asset('assets/mobile-user/img/right-title-bar.png') }}" alt="" width="70px">
    </h2>

    <table class="table table-borderless align-middle text-center" id="gainers-table">
        <tbody>
            <tr class="header">
                <td><span class="badge bg-custom-primary w-100 fw-normal custom-table-head">Pair</span></td>
                <td><span class="badge bg-custom-primary w-100 fw-normal custom-table-head">Latest Price</span></td>
                <td><span class="badge bg-custom-primary w-100 fw-normal custom-table-head">24H Change</span></td>
            </tr>

            @foreach($cryptos as $crypto)
                @php $pair = strtolower($crypto['symbol']) . 'usdt'; @endphp
                <tr id="row-{{ $pair }}" class="cursor-pointer go-to-chart" data-name="{{ $crypto['name'] }}">
                    <td class="text-start"><span class="text-info">{{ strtoupper($crypto['symbol']) }}</span>/USDT</td>
                    <td class="price" data-symbol="{{ $pair }}">
                        {{ $crypto['price'] }}
                    </td>
                    <td class="text-end">
                        <span
                            class="btn btn-sm px-2 w-75 change {{ $crypto['twenty_four'] == 0 ? 'text-custom-primary-dark' : 'text-white' }} {{ $crypto['twenty_four'] > 0 ? 'bg-info' : ($crypto['twenty_four'] == 0 ? 'gb-white' : 'bg-danger') }}"
                            data-symbol="{{ $pair }}">
                            {{ number_format($crypto['twenty_four'], 2, '.', '') }}%
                        </span>
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
@endsection

@push('scripts')
    <script src="{{ asset('assets/templates/basic/js/owl.min.js') }}"></script>
    <script>
        $(document).ready(function () {
            // Carousel swipe
            var myCarousel = $('#banners-carousel');
            var startX, endX;
            myCarousel.on('mousedown touchstart', function (e) {
                startX = e.pageX || e.originalEvent.touches[0].pageX;
            });
            myCarousel.on('mouseup touchend', function (e) {
                endX = e.pageX || e.originalEvent.changedTouches[0].pageX;
                var diff = startX - endX;
                if (Math.abs(diff) > 50) {
                    if (diff > 0) $(this).carousel('next');
                    else $(this).carousel('prev');
                }
            });

            // Realtime price updates from Binance
            let pairs = @json($cryptos->pluck('symbol')->map(fn($s) => strtolower($s) . 'usdt'));

            pairs.forEach(symbol => {
                let ws = new WebSocket(`wss://stream.binance.com:9443/ws/${symbol}@ticker`);
                ws.onmessage = function (event) {
                    let data = JSON.parse(event.data);
                    let price = parseFloat(data.c).toFixed(4);
                    let change = parseFloat(data.P).toFixed(2);

                    $(`[data-symbol="${symbol}"].price`).text(price);
                    $(`[data-symbol="${symbol}"].currency-price`).text(price);
                    $(`[data-symbol="${symbol}"].change`)
                        .text(`${change > 0 ? '+' : ''}${change}%`)
                        .toggleClass('bg-danger', change < 0)
                        .toggleClass('bg-info', change > 0)
                        .toggleClass('bg-white', change == 0)
                        .toggleClass('text-custom-primary-dark', change == 0)
                        .css('color', change >= 0 ? 'limegreen' : 'red');
                    $(`[data-symbol="${symbol}"].currency-change`)
                        .text(`${change > 0 ? '+' : ''}${change}%`);
                };
            });

            $(document).on('click', '.go-to-chart', function () {
                let name = $(this).data('name');
                window.location.href = "{{ route('mobile-user.chart') }}/" + name;
            });
        });
    </script>
@endpush
