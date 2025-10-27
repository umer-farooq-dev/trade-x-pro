@extends('templates.basic.layouts.mobile-user')

@push('styles')
    <script
        src="https://cdn.jsdelivr.net/npm/lightweight-charts@3.8.0/dist/lightweight-charts.standalone.production.js"></script>
    <link rel="stylesheet" href="{{ asset('assets/templates/basic/css/flipclock.css') }}">
    <style>
        #highlights .realtime-price .currency-price {
            font-size: 25px;
        }

        #highlights .realtime-price .currency-change {
            font-size: 14px;
        }

        #highlights .realtime-info p span {
            color: gray;
        }

        .time {
            cursor: pointer;
            padding: 3px 6px;
        }

        .time:hover {
            background: rgba(255, 255, 255, 0.06);
            border-radius: 3px;
        }

        .dropdown-toggle {
            cursor: pointer;
        }

        .indicator-active {
            font-weight: 600;
        }

        /* small transition for color changes */
        .currency-price,
        .currency-change {
            transition: color 120ms ease;
        }

        .highlow-time-duration {
            display: flex;
            gap: 5px;
            padding: 0;
            flex-wrap: wrap;
            justify-content: space-around;
        }

        .highlow-time-duration li {
            list-style: none;
            margin-top: 15px;
        }

        .highlow-time-duration .gameTime {
            transition: all 0.3s ease;
            padding: 8px 16px;
            border-radius: 20px;
            border: 1px solid var(--bs-secondary);
            text-decoration: none;
            color: #fff;
            background-color: var(--var-primary-bg-color);
        }

        .highlow-time-duration .gameTime.active {
            background: #{{ $general->base_color }} !important;
            color: #fff;
            box-shadow: 0 0 10px rgba(0, 255, 255, 0.5);
        }

        #playGame .input-group {
            height: 50px;
            margin: 25px 0 10px 0;
        }

        #playGame button {
            height: 50px
        }

        .w-49 {
            width: 49% !important;
        }

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

        .crypto-trigger {
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
        .clock ul{
            width: 50px;
        }
    </style>
@endpush

@section('navbar')
    <ul>
        <li style="width: 15%;">
            <a href="{{ url()->previous() }}" class="text-custom-primary-dark">
                <i class="las la-arrow-left"></i>
            </a>
        </li>
        <li style="width: 70%;">
            <h5 class="mb-0 text-white" style="letter-spacing: 5px;">{{ $currency->name }}</h5>
        </li>
        <li style="width: 15%;">
            <div class="crypto-trigger justify-content-center" id="openSidebar">
                <div class="menu-lines">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>
        </li>
    </ul>
@endsection
@section('content')
    <div class="row p-2" id="highlights">
        <div class="col-6 realtime-price">
            <strong class="text-info currency-price">$</strong> <strong class="text-info currency-price" id="realtime-currency-price">--</strong>
            <p class="text-info currency-change" id="percent-change">--</p>
        </div>
        <div class="col-6 realtime-info">
            <p class="mb-0 d-flex justify-content-between text-white">
                <span>Highest 24H:</span>
                <strong id="high">-</strong>
            </p>
            <p class="mb-0 d-flex justify-content-between text-white">
                <span>Lowest 24H:</span>
                <strong id="low">-</strong>
            </p>
            <p class="mb-0 d-flex justify-content-between text-white">
                <span>Volume (24H):</span>
                <strong id="vol">-</strong>
            </p>
        </div>
    </div>

    <div class="d-flex time-fram justify-content-between align-items-center mt-3 nowrap">
        <span class="time text-white" data-interval="1m">1 min</span>
        <span class="time text-white" data-interval="5m">5 min</span>
        <span class="time text-white" data-interval="30m">30 min</span>
        <span class="time text-white" data-interval="1h">1 H</span>
        <span class="time text-white" data-interval="1d">1 D</span>

        <!-- More dropdown (only More items here) -->
        <div class="dropdown">
            <span class="text-white dropdown-toggle" data-bs-toggle="dropdown" role="button">
                More
            </span>
            <ul class="dropdown-menu text-white">
                <li><a class="dropdown-item internal-time-fram" href="#" data-interval="1w">1 Week</a></li>
                <li><a class="dropdown-item internal-time-fram" href="#" data-interval="1M">1 Month</a></li>
            </ul>
        </div>

        <!-- Index dropdown (indicators) -->
        <div class="dropdown">
            <span class="text-white dropdown-toggle" data-bs-toggle="dropdown" role="button">
                Index
            </span>
            <ul class="dropdown-menu text-white">
                <li><a class="dropdown-item indicator-option" href="#" data-indicator="none">None</a></li>
                <li class="dropdown-subheader text-muted px-3">Moving Average</li>
                <li><a class="dropdown-item indicator-option" href="#" data-indicator="ma5">MA 5</a></li>
                <li><a class="dropdown-item indicator-option" href="#" data-indicator="ma10">MA 10</a></li>
                <li><a class="dropdown-item indicator-option" href="#" data-indicator="ma30">MA 30</a></li>
                <li class="dropdown-divider"></li>
                <li><a class="dropdown-item indicator-option" href="#" data-indicator="bb">Bollinger Bands</a>
                </li>
            </ul>
        </div>
    </div>

    <div class="row mt-2">
        <div class="col-12">
            <div id="chart-container" style="height: 300px"></div>
        </div>
    </div>

    <!-- NEW: Sidebar + game UI + trade history (added from second file) -->
    <div class="row">
        <div class="col-12">
            <div class="crypto-sidebar" id="cryptoSidebar">
                <div class="card bg-transparent crypto-list">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="card-title text-white mb-0">@lang('Cryptocurrencies')</h5>
                        <button class="btn btn-outline-light btn-sm" id="closeSidebar">
                            <i class="las la-times"></i>
                        </button>
                    </div>
                    <div class="card-body crypto-scroll">
                        <ul class="list-group">
                            @foreach($cryptos as $crypto)
                                <li class="list-group-item {{ $currency->symbol == $crypto->symbol ? 'active' : '' }}">
                                    <a href="{{ route('mobile-user.chart', ['name' => $crypto->name]) }}" class="crypto-link" data-symbol="{{ $crypto->symbol }}"
                                        data-id="{{ $crypto->id }}" data-name="{{ $crypto->name }}">
                                        {{ __($crypto->name) }} ({{ $crypto->symbol }})
                                    </a>
                                </li>
                            @endforeach
                        </ul>
                    </div>
                </div>
            </div>

            <div class="card bg-transparent mt-3 p-0">
                <div class="card-body p-0">
                    <div class="d-flex align-items-center justify-content-between mb-3">
                        <h5 class=" mb-0 text-white">@lang('Current') {{ __($currency->name) }} @lang('Price') : <span
                                id="cryptoPrice"></span> @lang("USD")</h5>
                    </div>

                    <div class="trade-user-price mb-2 text-info"></div>

                    <ul class="highlow-time-duration"> @foreach($tradeSettings as $tradeSetting) <li class="highlight">
                            <a href="javascript:void(0)" class="gameTime"
                                data-setting='@json($tradeSetting->only('id', 'time', 'unit'))'
                                onclick="document.querySelectorAll('.gameTime').forEach((element) => element.classList.remove('active'));this.classList.toggle('active');">
                                <i class="las la-clock text-info"></i> {{$tradeSetting->time}} {{__($tradeSetting->unit)}}
                            </a>
                        </li>
                    @endforeach </ul>

                    <!-- keep the original playGame form (already present in your first file) -->
                    <form id="playGame">
                        <div class="predict-group">
                            <div class="input-group">
                                <input type="number" step="any" placeholder="@lang('Enter Amount')" class="form-control "
                                    required name="amount">
                                <span class="input-group-text bg-primary-light text-white"> {{ __($general->cur_text) }}
                                </span>
                            </div>
                            <div class="highlow-predict d-flex nowrap justify-content-between mt-3">
                                <button class="btn bg-secondary text-white w-49 highlowButton" type="submit" name="highlow"
                                    value="1">
                                    <i class="las la-arrow-up"></i>@lang('Buy Up')
                                </button>
                                <button class="btn bg-danger text-white w-49 highlowButton" type="submit" name="highlow"
                                    value="2">
                                    <i class="las la-arrow-down"></i>@lang('Buy down')
                                </button>
                            </div>
                            <div class="clock w-100 mt-4"></div>
                        </div>
                    </form>

                    <div class="mt-4">
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
@endsection

@push('scripts')
    <script>
        $(document).ready(function () {
            // ---------- CONFIG ----------
            const SYMBOL = "{{ $currency->symbol . 'USDT' }}";
            console.log('Symbol:', SYMBOL);
            let INTERVAL = '1m';      // current timeframe
            // ----------------------------

            if (typeof LightweightCharts === 'undefined') {
                console.error('LightweightCharts not loaded.');
                $('#realtime-currency-price').text('Chart Not Loaded');
                return;
            }

            // Chart setup
            const container = document.getElementById('chart-container');
            const chart = LightweightCharts.createChart(container, {
                layout: { background: { color: '#0e0e0e' }, textColor: '#d1d4dc' },
                grid: { vertLines: { color: '#1a1a1a' }, horzLines: { color: '#1a1a1a' } },
                crosshair: { mode: LightweightCharts.CrosshairMode.Normal },
                timeScale: { borderColor: '#485c7b' },
                rightPriceScale: { borderColor: '#485c7b' },
                width: container.clientWidth, height: container.clientHeight
            });
            const candleSeries = chart.addCandlestickSeries({
                upColor: '#26a69a', borderUpColor: '#26a69a', wickUpColor: '#26a69a',
                downColor: '#ef5350', borderDownColor: '#ef5350', wickDownColor: '#ef5350'
            });

            window.addEventListener('resize', () => chart.applyOptions({ width: container.clientWidth }));

            // local candles buffer (most recent at end)
            let candles = [];

            // indicator holders (only one active at a time)
            let indicator = {
                active: 'none', // 'none' | 'ma5' | 'ma10' | 'ma30' | 'bb'
                series: []      // chart series objects for the active indicator (line(s))
            };

            // WebSocket handlers
            let klineWs = null;
            let tickerWs = null;

            // 24h ticker state (from Binance ticker stream)
            let ticker24 = {
                open: null,   // 24h open price (string/number)
                high: null,
                low: null,
                volume: null
            };

            // previous price to determine up/down tick
            let prevPrice = null;

            // ---------- HELPERS ----------
            function unixMsToSec(u) { return Math.floor(u / 1000); }
            function makeCandleFromKlineArray(d) {
                // d is [ openTime, open, high, low, close, volume, ... ]
                return {
                    time: Math.floor(d[0] / 1000),
                    open: parseFloat(d[1]),
                    high: parseFloat(d[2]),
                    low: parseFloat(d[3]),
                    close: parseFloat(d[4]),
                    volume: parseFloat(d[5])
                };
            }

            async function fetchHistorical(interval = INTERVAL, limit = 500) {
                // binance max limit is 1000; we keep 500 safe
                const url = `https://api.binance.com/api/v3/klines?symbol=${SYMBOL}&interval=${interval}&limit=${limit}`;
                const res = await fetch(url);
                if (!res.ok) throw new Error('Failed to fetch historical candles');
                const raw = await res.json();
                $(`[data-interval="${interval}"]`).addClass('text-info').removeClass('text-white');
                $(`.time-fram span:not([data-interval="${interval}"])`).removeClass('text-info').addClass('text-white');
                $(`time-fram a.internal-time-fram:not([data-interval="${interval}"])`).removeClass('text-info');
                return raw.map(d => makeCandleFromKlineArray(d));
            }

            function setCandlesToChart(arr) {
                candles = arr.slice(); // shallow copy
                candleSeries.setData(candles.map(c => ({
                    time: c.time, open: c.open, high: c.high, low: c.low, close: c.close
                })));
            }

            function upsertCandleToBuffer(newCandle) {
                const last = candles[candles.length - 1];
                if (!last) {
                    candles.push(newCandle);
                    return;
                }
                if (last.time === newCandle.time) {
                    // replace last
                    candles[candles.length - 1] = newCandle;
                } else if (newCandle.time > last.time) {
                    candles.push(newCandle);
                    // keep buffer size reasonable (optional)
                    if (candles.length > 2000) candles.shift();
                } else {
                    // older candle — ignore (shouldn't happen normally)
                }
            }

            // ---------- INDICATORS ----------
            function removeActiveIndicatorSeries() {
                if (!indicator.series || indicator.series.length === 0) return;
                indicator.series.forEach(s => chart.removeSeries(s));
                indicator.series = [];
            }

            function calcSMA(data, period) {
                const res = [];
                let sum = 0;
                for (let i = 0; i < data.length; i++) {
                    sum += data[i].close;
                    if (i >= period) {
                        sum -= data[i - period].close;
                    }
                    if (i >= period - 1) {
                        const avg = sum / period;
                        res.push({ time: data[i].time, value: avg });
                    }
                }
                return res;
            }

            function calcBBands(data, period = 20, mult = 2) {
                // return arrays: upper[], lower[] of {time, value}
                const upper = [], lower = [];
                for (let i = 0; i < data.length; i++) {
                    if (i < period - 1) continue;
                    let sum = 0;
                    for (let j = i - (period - 1); j <= i; j++) sum += data[j].close;
                    const mean = sum / period;
                    let variance = 0;
                    for (let j = i - (period - 1); j <= i; j++) variance += Math.pow(data[j].close - mean, 2);
                    variance /= period;
                    const sd = Math.sqrt(variance);
                    upper.push({ time: data[i].time, value: mean + mult * sd });
                    lower.push({ time: data[i].time, value: mean - mult * sd });
                }
                return { upper, lower };
            }

            async function applyIndicator(type) {
                // clear previous indicator
                removeActiveIndicatorSeries();
                indicator.active = type;

                if (type === 'none') {
                    // done
                    return;
                }

                // Ensure we have enough candles; if not, fetch more
                if (!candles || candles.length < 30) {
                    const hist = await fetchHistorical(INTERVAL, 500);
                    setCandlesToChart(hist);
                }

                // compute based on current candles buffer
                if (type.startsWith('ma')) {
                    const period = parseInt(type.replace('ma', ''), 10);
                    const sma = calcSMA(candles, period);
                    const s = chart.addLineSeries({ color: '#FFD700', lineWidth: 2 });
                    s.setData(sma);
                    indicator.series = [s];
                } else if (type === 'bb') {
                    const bands = calcBBands(candles, 20, 2);
                    const up = chart.addLineSeries({ color: '#00BFFF', lineWidth: 1 });
                    const low = chart.addLineSeries({ color: '#00BFFF', lineWidth: 1 });
                    up.setData(bands.upper);
                    low.setData(bands.lower);
                    indicator.series = [up, low];
                }
            }

            // When a new candle arrives (update or new), update indicator series incrementally
            function refreshIndicatorOnUpdate() {
                if (indicator.active === 'none') return;
                // recompute and set data (simple but reliable). For big perf, optimize later.
                applyIndicator(indicator.active).catch(e => console.error('Indicator refresh failed', e));
            }

            // ---------- 24h TICKER WS (for open/high/low/volume & percent base) ----------
            async function startTickerWs() {
                // Properly close existing connection
                if (tickerWs) {
                    tickerWs.onclose = null;
                    tickerWs.onerror = null;
                    tickerWs.close();
                    tickerWs = null;
                }

                // ticker gives 24h statistics
                const { ws } = await fetch(`/ws-proxy/ticker/${SYMBOL.toLowerCase()}`).then(r => r.json());
                tickerWs = new WebSocket(ws);

                tickerWs.onopen = () => console.info('Ticker WS open');
                tickerWs.onclose = (event) => {
                    console.warn('Ticker WS closed — reconnecting in 1s', event.code, event.reason);
                    if (event.code !== 1000) {
                        setTimeout(startTickerWs, 1000);
                    }
                };

                tickerWs.onerror = (err) => {
                    console.error('Ticker WS error', err);
                    tickerWs.close();
                };
                tickerWs.onmessage = (evt) => {
                    try {
                        const data = JSON.parse(evt.data);
                        // relevant fields: o=openPrice, h=highPrice, l=lowPrice, v=totalTradedBaseAssetVolume, c=lastPrice
                        ticker24.open = parseFloat(data.o);
                        ticker24.high = parseFloat(data.h);
                        ticker24.low = parseFloat(data.l);
                        ticker24.volume = parseFloat(data.v);
                        const last = parseFloat(data.c);

                        // update 24h UI (these should not depend on timeframe)
                        $('#high').text(ticker24.high.toFixed(8).replace(/\.?0+$/, ""));
                        $('#low').text(ticker24.low.toFixed(8).replace(/\.?0+$/, ""));
                        $('#vol').text(ticker24.volume.toFixed(4).replace(/\.?0+$/, ""));

                        // update percent based on 24h open price
                        if (ticker24.open && !isNaN(last)) {
                            const pct = ((last - ticker24.open) / ticker24.open) * 100;
                            $('#percent-change').text((pct >= 0 ? '+' : '') + pct.toFixed(2) + '%')
                                .removeClass('text-danger text-info')
                                .addClass(pct >= 0 ? 'text-info' : 'text-danger');
                        }

                        // Also update price color / value live (we also update from kline but ticker gives quick last price)
                        updatePriceDisplay(last);

                    } catch (e) {
                        console.error('Ticker WS parse error', e);
                    }
                };
            }

            // ---------- KLINE WS (candles) ----------
            async function startKlineWs() {
                if (klineWs) {
                    klineWs.onclose = null; // Remove close handler to prevent auto-reconnect
                    klineWs.onerror = null; // Remove error handler
                    klineWs.close();
                    klineWs = null;
                }
                const { ws } = await fetch(`/ws-proxy/kline/${SYMBOL.toLowerCase()}/${INTERVAL}`).then(r => r.json());
                klineWs = new WebSocket(ws);

                klineWs.onopen = () => console.info('Kline WS open:');
                klineWs.onclose = (event) => {
                    console.warn('Kline WS closed — reconnecting in 1s', event.code, event.reason);
                    // Only reconnect if this wasn't an intentional closure
                    if (event.code !== 1000) {
                        setTimeout(startKlineWs, 1000);
                    }
                };

                klineWs.onerror = (err) => {
                    console.error('Kline WS error', err);
                    // Close will trigger onclose which handles reconnection
                    klineWs.close();
                };

                klineWs.onmessage = (evt) => {
                    try {
                        const msg = JSON.parse(evt.data);
                        const k = msg.k;
                        if (!k) return;
                        const candle = {
                            time: Math.floor(k.t / 1000),
                            open: parseFloat(k.o),
                            high: parseFloat(k.h),
                            low: parseFloat(k.l),
                            close: parseFloat(k.c),
                            volume: parseFloat(k.v)
                        };

                        // update chart series
                        candleSeries.update({
                            time: candle.time, open: candle.open, high: candle.high, low: candle.low, close: candle.close
                        });

                        // update local buffer
                        upsertCandleToBuffer(candle);

                        // live price quick update
                        updatePriceDisplay(candle.close);

                        // If candle closed (k.x === true), recalculations (e.g., indicator) may be needed
                        if (k.x) {
                            // refresh indicator series on closed candle for accurate SMA/BB
                            refreshIndicatorOnUpdate();
                        } else {
                            // for open/in-progress candle we can also update a lightweight indicator if necessary, but we'll refresh on close to keep it accurate
                        }

                    } catch (e) {
                        console.error('Kline WS parse error', e);
                    }
                };
            }

            // Update the price element and color based on prevPrice and ticker24.open (for percent)
            function updatePriceDisplay(currentPrice) {
                if (typeof currentPrice !== 'number' || isNaN(currentPrice)) return;
                const $priceEl = $('#realtime-currency-price, #cryptoPrice');
                const $pctEl = $('#percent-change');

                // previous to determine tick direction
                if (prevPrice === null) prevPrice = currentPrice;

                // set text
                $priceEl.text(currentPrice.toFixed(8).replace(/\.?0+$/, ""));

                // tick color (fast up/down)
                if (currentPrice > prevPrice) {
                    $priceEl.removeClass('text-danger text-white').addClass('text-info');
                } else if (currentPrice < prevPrice) {
                    $priceEl.removeClass('text-info text-white').addClass('text-danger');
                } else {
                    // no change
                    $priceEl.removeClass('text-danger text-info').addClass('text-white');
                }

                // percent (based on 24h open if available)
                if (ticker24.open) {
                    const pct = ((currentPrice - ticker24.open) / ticker24.open) * 100;
                    $pctEl.text((pct >= 0 ? '+' : '') + pct.toFixed(2) + '%')
                        .removeClass('text-danger text-info text-white')
                        .addClass(pct >= 0 ? 'text-info' : 'text-danger');
                }

                prevPrice = currentPrice;
            }

            // ---------- LOAD / INIT ----------
            async function initialLoad() {
                try {
                    // historical candles to seed chart & indicators
                    const hist = await fetchHistorical(INTERVAL, 500);
                    setCandlesToChart(hist);

                    // start websockets
                    startTickerWs();
                    startKlineWs();

                    // if an indicator is pre-selected (none by default), apply it
                    if (indicator.active && indicator.active !== 'none') {
                        await applyIndicator(indicator.active);
                    }
                } catch (e) {
                    console.error('initialLoad error', e);
                }
            }

            // ---------- UI Events ----------
            // timeframe click (inline) — keep design original
            $(document).on('click', '.time', async function (e) {
                e.preventDefault();
                const newInterval = $(this).data('interval');
                if (!newInterval) return;

                // update UI active state
                $('.time').removeClass('indicator-active');
                $(this).addClass('indicator-active');

                if (newInterval === INTERVAL) return;

                INTERVAL = newInterval;
                // reload historical candles, restart kline websocket for new interval
                try {
                    const hist = await fetchHistorical(INTERVAL, 500);
                    setCandlesToChart(hist);
                    // restart Kline WS for new interval
                    startKlineWs();
                    // refresh indicator if active
                    if (indicator.active && indicator.active !== 'none') await applyIndicator(indicator.active);
                } catch (err) {
                    console.error('Timeframe change failed', err);
                }
            });

            // More dropdown (also contains timeframe items)
            $(document).on('click', '.dropdown-menu .dropdown-item[data-interval]', async function (e) {
                e.preventDefault();
                const newInterval = $(this).data('interval');
                if (!newInterval) return;
                INTERVAL = newInterval;
                // reload candles & restart kline ws
                try {
                    const hist = await fetchHistorical(INTERVAL, 500);
                    setCandlesToChart(hist);
                    startKlineWs();
                    if (indicator.active && indicator.active !== 'none') await applyIndicator(indicator.active);
                } catch (err) {
                    console.error('More interval change failed', err);
                }
            });

            // Indicator selection (Index dropdown)
            $(document).on('click', '.indicator-option', async function (e) {
                e.preventDefault();
                const type = $(this).data('indicator'); // 'none', 'ma5', 'ma10', 'ma30', 'bb'
                // ui mark
                $('.indicator-option').removeClass('indicator-active');
                $(this).addClass('indicator-active');

                try {
                    await applyIndicator(type);
                } catch (err) {
                    console.error('Apply indicator failed', err);
                }
            });

            // Initial UI highlight for 1m (default)
            $(`.time[data-interval="${INTERVAL}"]`).addClass('indicator-active');

            // Kick things off
            initialLoad();
        });
    </script>

    <!-- FlipClock lib (kept) -->
    <script src="{{ asset('assets/templates/basic/js/flipclock.min.js') }}"></script>

    <!-- *** GAME + TRADE-HISTORY SCRIPT (integrated) *** -->
    <script>
        $(document).ready(function () {
            // State (single source of truth — do not re-declare anywhere else)
            let coinSymbol = "{{ $currency->symbol }}";
            let coinId = "{{ $currency->id }}";
            let gameLogId = null;
            let tradeSettingId = null;
            let playTime = null;
            let playTimeUnit = null;
            let highlowType = null;
            const highLowArray = [1, 2];
            const userBalance = {{ auth()->user()->balance }};

            // Sidebar open/close
            $('#openSidebar').on('click', function () {
                $('#cryptoSidebar').addClass('active');
            });
            $('#closeSidebar').on('click', function () {
                $('#cryptoSidebar').removeClass('active');
            });

            // Crypto selection in sidebar
            $('.crypto-link').on('click', function () {
                const symbol = $(this).data('symbol');
                const id = $(this).data('id');
                const name = $(this).data('name');
                switchCrypto(symbol, id, name);
                $('#cryptoSidebar').removeClass('active');
            });

            // Trade time selection (gameTime buttons)
            $(document).on('click', '.gameTime', function () {
                $('.gameTime').removeClass('active');
                $(this).addClass('active');
                let setting = $(this).data('setting');
                tradeSettingId = setting.id;
                playTime = setting.time;
                playTimeUnit = setting.unit;
                console.log('Selected tradeSettingId:', tradeSettingId, 'time:', playTime, 'unit:', playTimeUnit);
            });

            // High/Low selection buttons
            $('.highlowButton').on('click', function () {
                highlowType = $(this).val();
                console.log('Selected highlowType:', highlowType);
            });

            // Fetch live price from your route and update UI + chart

            // Fetch trade history and populate table
            function fetchTradeHistory() {
                $.get("{{ route('user.trade.history') }}", { crypto_currency_id: coinId }, function (data) {
                    const tbody = $('#tradeHistory');
                    tbody.empty();
                    if (data && Array.isArray(data)) {
                        data.forEach(trade => {
                            const directionClass = (trade.direction || '').toLowerCase() === 'buy' ? 'buy' : 'sell';
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

            // Initialize fetchers
            fetchTradeHistory();

            // Form submission: place trade
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
                                if (response.errors && Array.isArray(response.errors)) {
                                    notify('error', response.errors.join(', '));
                                } else {
                                    notify('error', response.message || 'Failed to place trade');
                                }
                            }
                        },
                        error: function (xhr) {
                            console.error('Store error:', xhr);
                            notify('error', 'Failed to place trade');
                        }
                    });
                }
            });

            // Convert playTime + unit into seconds
            function secondCount() {
                if (!playTimeUnit || !playTime) return NaN;
                if (playTimeUnit === 'seconds') return playTime;
                if (playTimeUnit === 'minutes') return playTime * 60;
                if (playTimeUnit === 'hours') return playTime * 3600;
                return NaN;
            }

            // Countdown using FlipClock and call gameResult when done
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

            // Call server to fetch final result
            function gameResult(gameLogId) {
                if (!gameLogId) return;
                $.ajax({
                    headers: { 'X-CSRF-TOKEN': '{{ csrf_token() }}' },
                    url: '{{ route('user.trade.result') }}',
                    method: 'POST',
                    data: { game_log_id: gameLogId },
                    success: function (response) {
                        if (response.success) {
                            notify('success', response.message || '');
                        } else {
                            notify('error', response.errors || response.message || '');
                        }
                        setTimeout(() => location.reload(), 5000);
                    },
                    error: function (xhr) {
                        console.error('gameResult error', xhr);
                        notify('error', 'Failed to fetch game result');
                        setTimeout(() => location.reload(), 5000);
                    }
                });
            }

            // Switch active crypto (called when clicking sidebar item)
            function switchCrypto(symbol, id, name) {
                coinSymbol = symbol;
                coinId = id;
                $('.crypto-symbol').text(symbol);
                $('#cryptoPrice').text('');
                $('.list-group-item').removeClass('active');
                $(`.crypto-link[data-symbol="${symbol}"]`).parent().addClass('active');

                fetchTradeHistory();
            }
        });
    </script>
@endpush
