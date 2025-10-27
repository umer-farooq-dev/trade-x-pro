@extends($activeTemplate.'layouts.master')
@section('content')
<div class="container">
    <section class="games-section bg--section">
        <div class="container">
            <div class="crypto-sidebar" id="cryptoSidebar">
                <div class="card custom--card crypto-list">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="card-title">@lang('Cryptocurrencies')</h5>
                        <button class="btn btn-outline-light btn-sm" id="closeSidebar">
                            <i class="las la-times"></i>
                        </button>
                    </div>
                    <div class="card-body crypto-scroll">
                        <ul class="list-group">
                            @foreach($cryptos as $crypto)
                                <li class="list-group-item {{ $currency->symbol == $crypto->symbol ? 'active' : '' }}">
                                    <a href="{{ route('user.trade.now', ['name' => $crypto->name]) }}" class="crypto-link">
                                        {{ __($crypto->name) }} ({{ $crypto->symbol }})
                                    </a>
                                </li>
                            @endforeach
                        </ul>
                    </div>
                </div>
            </div>


            <div class="row gy-2">
                <div class="col-12">
                    <ul class="highlow-time-duration">
                        @foreach($tradeSettings as $tradeSetting)
                            <li class="highlight">
                                <a href="javascript:void(0)" class="gameTime " data-setting='@json($tradeSetting->only('id','time','unit'))'>
                                    <i class="las la-clock"></i>
                                    {{$tradeSetting->time}} {{__($tradeSetting->unit)}}
                                </a>
                            </li>
                        @endforeach
                    </ul>
                </div>
                <div class="col-lg-6">
                    <div class="card custom--card">
                        <div class="card-body position-relative">
                            <div class="crypto-trigger" id="openSidebar">
                                <span class="crypto-symbol">{{ $currency->symbol }}</span>
                                <div class="menu-lines">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                </div>
                            </div>
                            <div id="graph"></div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="card custom--card">
                        <div class="card-header">
                            <h5 class="card-title">@lang('Current') {{__($currency->name)}} @lang('Price') : <span id="cryptoPrice"></span>  @lang("USD")</h5>
                        </div>
                        <div class="card-body text-center">
                            <span class="trade-user-price"></span>
                            <form id="playGame">
                                <div class="predict-group">
                                    <div class="input-group">
                                        <input type="number" step="any" placeholder="@lang('Enter Amount')" class="form-control cmn--form--control only-number" required name="amount">
                                        <span class="input-group-text bg--info cmn--form--control"> {{ __($general->cur_text) }} </span>
                                    </div>
                                    <div class="highlow-predict">
                                        <button class="cmn--btn border-0 btn--success highlowButton" type="submit" name="highlow" value="1">
                                            <i class="las la-arrow-up"></i>@lang('Buy Up')
                                        </button>
                                        <button class="cmn--btn border-0 btn--danger highlowButton" type="submit" name="highlow" value="2">
                                            <i class="las la-arrow-down"></i>@lang('Buy down')
                                        </button>
                                    </div>
                                    <div class="clock w-100 mt-5"></div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-12">
                    <div class="card custom--card">
                        <div class="card-body">
                            <table class="table trade-history-table">
                                <thead>
                                    <tr>
                                        <th>@lang('Time')</th>
                                        <th>@lang('Direction')</th>
                                        <th>@lang('Price')</th>
                                    </tr>
                                </thead>
                                <tbody id="tradeHistory"></tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
@endsection
@push('style-lib')
<link rel="stylesheet" href="{{ asset($activeTemplateTrue . '/css/flipclock.css') }}">
<style>
    .crypto-sidebar {
        position: fixed;
        top: 0;
        left: -300px;
        width: 300px;
        height: 100%;
        background: #141c24;
        z-index: 1000;
        transition: left 0.3s ease;
    }
    .crypto-sidebar.active {
        left: 0;
    }
    .crypto-list {
        height: 100%;
        margin: 0;
        border-radius: 0;
    }
    .crypto-list .crypto-scroll {
        max-height: calc(100vh - 100px);
        overflow-y: auto;
        padding-right: 10px;
    }
    .crypto-list .list-group-item {
        background: #1a1a1a;
        border: none;
        margin-bottom: 5px;
        border-radius: 5px;
    }
    .crypto-list .list-group-item.active {
        background: #{{ $general->base_color }} !important;
        color: #fff;
    }
    .crypto-list .crypto-link {
        color: #8f93a2;
        text-decoration: none;
        display: block;
        padding: 10px;
    }
    .crypto-list .list-group-item.active .crypto-link {
        color: #fff;
    }
    .crypto-list .crypto-link:hover {
        color: #fff;
    }
    .crypto-scroll::-webkit-scrollbar {
        width: 8px;
    }
    .crypto-scroll::-webkit-scrollbar-track {
        background: #2d2f3e;
        border-radius: 10px;
    }
    .crypto-scroll::-webkit-scrollbar-thumb {
        background: #{{ $general->base_color }};
        border-radius: 10px;
    }

    /* Chart Trigger */
    .crypto-trigger {
        position: absolute;
        top: 10px;
        left: 10px;
        display: flex;
        align-items: center;
        cursor: pointer;
        z-index: 10;
    }
    .crypto-symbol {
        font-size: 0.9rem;
        color: #8f93a2;
        margin-right: 8px;
    }
    .menu-lines {
        display: flex;
        flex-direction: column;
        gap: 3px;
    }
    .menu-lines span {
        width: 20px;
        height: 2px;
        background: #{{ $general->base_color }};
        border-radius: 2px;
    }

    .js-plotly-plot .plotly .main-svg {
        border-radius: 10px;
        border: 1px solid #2d2f3e;
    }
    .js-plotly-plot .gridlayer path {
        stroke: #2d2f3e !important;
    }
    .js-plotly-plot .hovertext {
        background: #1a1a1a !important;
        border: 2px solid #{{ $general->base_color }} !important;
        border-radius: 5px;
        font-family: monospace !important;
    }
    .js-plotly-plot .plotly .cursor-crosshair {
        cursor: crosshair !important;
    }
    .highlow-time-duration .gameTime {
        transition: all 0.3s ease;
        padding: 8px 16px;
        border-radius: 20px;
    }
    .highlow-time-duration .gameTime.active {
        background: #{{ $general->base_color }} !important;
        color: #fff;
        box-shadow: 0 0 10px rgba(0, 255, 255, 0.5);
    }
    .interval-selector .interval-btn {
        margin-right: 5px;
        transition: all 0.3s ease;
    }
    .interval-selector .interval-btn.active {
        background: #{{ $general->base_color }} !important;
        color: #fff;
    }
    .price-stats {
        color: #8f93a2;
        font-size: 0.9rem;
    }
    .price-stats span {
        margin-right: 10px;
    }
    .gradient-btn {
        background: linear-gradient(45deg, #28a745, #218838);
        border: none !important;
        padding: 10px 20px;
        font-weight: 600;
        transition: all 0.3s ease;
        border-radius: 20px;
    }
    .gradient-btn.btn--danger {
        background: linear-gradient(45deg, #dc3545, #c82333);
    }
    .gradient-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
    }
    .price-marker {
        position: absolute;
        right: 10px;
        top: 10px;
        background: #{{ $general->base_color }};
        color: #fff;
        padding: 5px 10px;
        border-radius: 5px;
        font-weight: bold;
        box-shadow: 0 0 10px rgba(0, 255, 255, 0.7);
        z-index: 5;
    }
    .trade-history-table {
        width: 100%;
        color: #fff;
    }
    .trade-history-table th {
        background: #1a1a1a;
        padding: 10px;
        text-align: center;
    }
    .trade-history-table td {
        padding: 8px;
        text-align: center;
        border-bottom: 1px solid #2d2f3e;
    }
    .trade-history-table .buy {
        color: #00ff00;
    }
    .trade-history-table .sell {
        color: #ff0000;
    }


</style>
@endpush

@push('script-lib')
<script src="{{ asset($activeTemplateTrue . 'js/flipclock.min.js') }}"></script>
<script src="{{ asset($activeTemplateTrue . 'js/plot/plotly-latest.min.js') }}"></script>
@endpush

@push('script')
<script>
    "use strict";
    $(document).ready(function () {
        $('#openSidebar').on('click', function () {
            $('#cryptoSidebar').addClass('active');
        });
        $('#closeSidebar').on('click', function () {
            $('#cryptoSidebar').removeClass('active');
        });
    });

    const chartConfig = {
        candles: [],
        maxCandles: 100,
        intervalMs: 5000,
        currentCandle: null,
        colors: {
            bullish: "#00ff00",
            bearish: "#ff0000",
            grid: "#2d2f3e",
            background: "#141c24",
            text: "#8f93a2"
        },
        layout: {
            xaxis: {
                type: 'date',
                tickformat: '%H:%M:%S',
                gridcolor: '#2d2f3e',
                linecolor: '#444',
                tickfont: { color: '#8f93a2', size: 12, family: 'Arial' },
                title: { text: 'Time', font: { color: '#8f93a2', size: 14 } },
                rangeslider: { visible: false }
            },
            yaxis: {
                gridcolor: '#2d2f3e',
                linecolor: '#444',
                tickfont: { color: '#8f93a2', size: 12, family: 'Arial' },
                title: { text: 'Price (USD)', font: { color: '#8f93a2', size: 14 } },
                autorange: true
            },
            paper_bgcolor: '#141c24',
            plot_bgcolor: '#141c24',
            margin: { t: 40, b: 60, l: 70, r: 50 },
            showlegend: false,
            hovermode: 'x unified',
            hoverlabel: {
                bgcolor: '#1a1a1a',
                bordercolor: '#{{ $general->base_color }}',
                font: { color: '#fff', size: 12 }
            }
        }
    };
 function initCandlestickChart() {
        const data = [{
            type: 'candlestick',
            x: [],
            open: [],
            high: [],
            low: [],
            close: [],
            increasing: { line: { color: chartConfig.colors.bullish, width: 1 } },
            decreasing: { line: { color: chartConfig.colors.bearish, width: 1 } },
            line: { color: '#fff', width: 1 },
            name: 'Price'
        }];

        Plotly.newPlot('graph', data, chartConfig.layout, {
            displayModeBar: true,
            responsive: true,
            scrollZoom: true,
            modeBarButtonsToRemove: ['lasso2d', 'select2d', 'autoScale2d'],
            displaylogo: false
        });
    }

    function updateCandlestickChart(price, symbol) {
        const now = new Date();
        const numericPrice = parseFloat(price);
        if (isNaN(numericPrice)) return;

        const intervalStart = Math.floor(now.getTime() / chartConfig.intervalMs) * chartConfig.intervalMs;
        const intervalEnd = intervalStart + chartConfig.intervalMs;

        if (!chartConfig.currentCandle || chartConfig.currentCandle.endTime <= now.getTime()) {
            if (chartConfig.currentCandle) {
                chartConfig.candles.push(chartConfig.currentCandle);
                if (chartConfig.candles.length > chartConfig.maxCandles) {
                    chartConfig.candles.shift();
                }
            }
            chartConfig.currentCandle = {
                startTime: intervalStart,
                endTime: intervalEnd,
                open: numericPrice,
                high: numericPrice,
                low: numericPrice,
                close: numericPrice,
                time: new Date(intervalStart)
            };
        } else {
            chartConfig.currentCandle.high = Math.max(chartConfig.currentCandle.high, numericPrice);
            chartConfig.currentCandle.low = Math.min(chartConfig.currentCandle.low, numericPrice);
            chartConfig.currentCandle.close = numericPrice;
        }

        const x = chartConfig.candles.map(c => c.time).concat(chartConfig.currentCandle.time);
        const open = chartConfig.candles.map(c => c.open).concat(chartConfig.currentCandle.open);
        const high = chartConfig.candles.map(c => c.high).concat(chartConfig.currentCandle.high);
        const low = chartConfig.candles.map(c => c.low).concat(chartConfig.currentCandle.low);
        const close = chartConfig.candles.map(c => c.close).concat(chartConfig.currentCandle.close);

        Plotly.update('graph', {
            x: [x],
            open: [open],
            high: [high],
            low: [low],
            close: [close]
        }, {});
    }

    function switchCrypto(symbol, id, name) {
        coinSymbol = symbol;
        coinId = id;
        chartConfig.candles = [];
        chartConfig.currentCandle = null;
        $('.crypto-symbol').text(symbol);
        $('#cryptoName').text(name);
        $('#cryptoPrice').text('');
        $('.list-group-item').removeClass('active');
        $(`.crypto-link[data-symbol="${symbol}"]`).parent().addClass('active');

        Plotly.update('graph', {
            x: [[]],
            open: [[]],
            high: [[]],
            low: [[]],
            close: [[]]
        }, {});
        fetchTradeHistory();

    }
    function fetchTradeHistory() {
        $.get("{{ route('user.trade.history') }}", { crypto_currency_id: coinId }, function (data) {
            const tbody = $('#tradeHistory');
            tbody.empty();
            if (data && Array.isArray(data)) {
                data.forEach(trade => {
                    const directionClass = trade.direction.toLowerCase() === 'buy' ? 'buy' : 'sell';
                    const row = `
                        <tr>
                            <td>${trade.time}</td>
                            <td class="${directionClass}">${trade.direction}</td>
                            <td>${parseFloat(trade.price).toFixed(4)}</td>
                        </tr>
                    `;
                    tbody.append(row);
                });
            }
        }).fail(function () {
            console.warn('Failed to fetch trade history');
        });
    }
    let coinSymbol = "{{ $currency->symbol }}";
    let coinId = "{{ $currency->id }}";
    let gameLogId;
    let tradeSettingId = null;
    let playTime;
    let playTimeUnit;
    let highlowType;
    const highLowArray = [1, 2];
    const userBalance = {{ auth()->user()->balance }};
    $(document).ready(function () {
        initCandlestickChart();
        $('.crypto-link').on('click', function () {
            const symbol = $(this).data('symbol');
            const id = $(this).data('id');
            const name = $(this).data('name');
            switchCrypto(symbol, id, name);
            $('#cryptoSidebar').removeClass('active');
        });
        $(document).on('click', '.gameTime', function () {
            $('.gameTime').removeClass('active');
            $(this).addClass('active');
            let setting = $(this).data('setting');
            tradeSettingId = setting.id;
            playTime = setting.time;
            playTimeUnit = setting.unit;
            console.log('Selected tradeSettingId:', tradeSettingId, 'time:', playTime, 'unit:', playTimeUnit);
        });
        $('.highlowButton').on('click', function () {
            highlowType = $(this).val();
            console.log('Selected highlowType:', highlowType);
        });

        function fetchPrice() {
            $.get("{{ route('user.crypto.rate') }}", { coinSymbol }, function (data) {
                $('#cryptoPrice').text(data);
                updateCandlestickChart(data, coinSymbol);
            }).fail(function () {
                console.warn('Price fetch failed, retrying...');
                setTimeout(fetchPrice, 2000);
            });
        }
        fetchPrice();
        fetchTradeHistory();
        setInterval(fetchPrice, 1000);
        setInterval(fetchTradeHistory, 1000);

        $('#playGame').on('submit', function (event) {
            event.preventDefault();
            var amount = $('input[name="amount"]').val();
            var timeCount = secondCount();
            console.log('Form submitted: amount=', amount, 'tradeSettingId=', tradeSettingId, 'highlowType=', highlowType);

            if (!highLowArray.includes(parseInt(highlowType))) {
                notify('error', "@lang('Invalid trade type')");
            } else if (userBalance < amount) {
                notify('error', 'Your account balance {{ showAmount(auth()->user()->balance) }} {{$general->cur_text}} not enough! please deposit money');
            } else if (isNaN(amount) || amount <= 0) {
                notify('error', 'Please insert valid amount');
            } else if (!tradeSettingId || isNaN(timeCount) || timeCount <= 0) {
                notify('error', 'Please select a valid trade duration');
            } else {
                $('input[name="amount"]').val('');
                $.ajax({
                    headers: { 'X-CSRF-TOKEN': '{{ csrf_token() }}' },
                    url: '{{ route('user.trade.store') }}',
                    method: 'POST',
                    data: {
                        amount: amount,
                        coin_id: coinId,
                        high_low_type: highlowType,
                        trade_setting_id: tradeSettingId
                    },
                    success: function (response) {
                        console.log('Store response:', response);
                        if (response.success) {
                            gameLogId = response.game_log_id;
                            countDown(timeCount, gameLogId);
                            if (highlowType == 1) {
                                $('.trade-user-price').text('Your trade high. price was ' + response.trade + ' USD');
                                notify('success', 'Trade High');
                            } else {
                                $('.trade-user-price').text('Your trade low. price was ' + response.trade + ' USD');
                                notify('success', 'Trade Low');
                            }
                        } else {
                            notify('error', response.errors.join(', '));
                        }
                    },
                    error: function (xhr) {
                        console.error('Store error:', xhr);
                        notify('error', 'Failed to place trade');
                    }
                });
            }
        });

        function secondCount() {
            if (playTimeUnit == 'seconds') return playTime;
            if (playTimeUnit == 'minutes') return playTime * 60;
            if (playTimeUnit == 'hours') return playTime * 3600;
        }





        function countDown(timeCount, gameLogId) {
            var clock = $('.clock').FlipClock({
                defaultClockFace: 'HourlyCounter',
                autoStart: false,
                callbacks: { stop: () => gameResult(gameLogId) }
            });
            clock.setTime(timeCount - 1);
            clock.setCountdown(true);
            clock.start();
        }

        function gameResult(gameLogId) {
            $.ajax({
                headers: {'X-CSRF-TOKEN': '{{ csrf_token() }}'},
                url: '{{ route('user.trade.result') }}',
                method: 'POST',
                data: {game_log_id: gameLogId},
                success: function (response) {
                    if (response.success) {
                        notify('success', response.message || '');
                    } else {
                        notify('error', response.errors || '');
                    }
                    setTimeout(() => location.reload(), 5000);
                }
            });
        }
    });
</script>
@endpush
