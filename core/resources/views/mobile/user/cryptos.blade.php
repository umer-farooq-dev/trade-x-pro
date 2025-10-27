@extends('templates.basic.layouts.mobile-user')

@section('container-class', 'p-0')
@section('content')
    <table class="table table-borderless align-middle text-custom-primary-dark" id="list-crypto-table">
        <thead>
            <tr>
                <th style="padding-left: 10px ">Pair/VOL</th>
                <th class="text-end">Last Price</th>
                <th class="text-end" style="padding-right: 10px">Change</th>
            </tr>
        </thead>
        <tbody id="crypto-list">
            @foreach ($cryptos as $coin)
                <tr data-symbol="{{ strtolower($coin['symbol']) }}usdt"
                    style="{{ !$loop->last ? 'border-bottom: 1px solid #3A495C;' : '' }}" data-name="{{ $coin['name'] }}"
                    class="cursor-pointer go-to-chart">
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
                        <p class="m-0 price" style="font-size: 17px;">{{ number_format($coin['price'], decimals: 6) }}</p>
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
@endsection

@push('scripts')
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
    </script>
@endpush
