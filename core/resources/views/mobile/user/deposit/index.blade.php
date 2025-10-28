@extends('templates.basic.layouts.mobile-user')

@push('styles')
    <link rel="stylesheet" href="{{ asset('assets/templates/basic/css/main.css') }}">
    <link href="{{ asset('assets/templates/basic/css/color.php') }}?color={{ $general->base_color }}" rel="stylesheet" />

    <style>
        body {
            background-color: black;
        }

        .custom--card,
        .cmn--form--control,
        .custom--card .card-body {
            background-color: unset;
        }
    </style>
@endpush

@section('content')
    <div class="row justify-content-center align-items-center" style="min-height: 80dvh;">
        <div class="col-md-8">
            <div class="card custom--card">
                <div class="card-body">
                    <form action="{{ route('user.deposit.insert') }}" method="post">
                        @csrf
                        <input type="hidden" name="method_code">
                        <input type="hidden" name="currency">

                        <div class="form-group">
                            <label class="form-label">@lang('Select Gateway')</label>
                            <select class="form-control cmn--form--control" name="gateway" required>
                                <option value="" selected disabled>@lang('Select One')</option>
                                @foreach($gatewayCurrency as $data)
                                    <option value="{{ $data->method_code }}"
                                            data-gateway="{{ $data }}"
                                            @selected(old('gateway') == $data->method_code)>
                                        {{ $data->name }}
                                    </option>
                                @endforeach
                            </select>
                        </div>

                        <div class="form-group">
                            <label class="form-label">@lang('Amount')</label>
                            <div class="input-group">
                                <input type="number" step="any" name="amount" class="form-control cmn--form--control"
                                    value="{{ old('amount') }}" autocomplete="off" required>
                                <span class="input-group-text bg--base">{{ $general->cur_text }}</span>
                            </div>
                        </div>

                        <div class="preview-details d-none mt-3">
                            <ul class="list-group text-center">
                                <li class="list-group-item d-flex justify-content-between border-0 bg-transparent text-white">
                                    <span>@lang('Limit')</span>
                                    <span><span class="min fw-bold">0</span> -
                                        <span class="max fw-bold">0</span> {{ __($general->cur_text) }}</span>
                                </li>

                                <li class="list-group-item d-flex justify-content-between border-0 bg-transparent text-white">
                                    <span>@lang('Charge')</span>
                                    <span><span class="charge fw-bold">0</span> {{ __($general->cur_text) }}</span>
                                </li>

                                <li class="list-group-item d-flex justify-content-between border-0 bg-transparent text-white">
                                    <span>@lang('Payable')</span>
                                    <span><span class="payable fw-bold">0</span> {{ __($general->cur_text) }}</span>
                                </li>

                                <li class="list-group-item d-none justify-content-between rate-element border-0 bg-transparent text-white">
                                </li>

                                <li class="list-group-item d-none justify-content-between in-site-cur border-0 bg-transparent text-white">
                                    <span>@lang('In') <span class="method_currency"></span></span>
                                    <strong class="final_amo">0</strong>
                                </li>

                                <li class="list-group-item d-none crypto_currency border-0 bg-transparent text-white">
                                    <span>
                                        @lang('Conversion with') <span class="method_currency"></span>
                                        @lang('and final value will show on next step')
                                    </span>
                                </li>
                            </ul>
                        </div>

                        <div class="form-group mt-3">
                            <button type="submit" class="cmn--btn btn-block">@lang('Submit')</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection


@push('scripts')
    <script>
        (function ($) {
            "use strict";

            const updatePreview = () => {
                const gatewaySelect = $('select[name=gateway]');
                const amountInput = $('input[name=amount]');
                const resource = gatewaySelect.find('option:selected').data('gateway');

                if (!gatewaySelect.val()) {
                    $('.preview-details').addClass('d-none');
                    return;
                }

                const amount = parseFloat(amountInput.val()) || 0;
                if (amount <= 0) {
                    $('.preview-details').addClass('d-none');
                    return;
                }

                $('.preview-details').removeClass('d-none');

                const fixed_charge = parseFloat(resource.fixed_charge);
                const percent_charge = parseFloat(resource.percent_charge);
                const rate = parseFloat(resource.rate);
                const charge = (fixed_charge + (amount * percent_charge / 100)).toFixed(2);
                const payable = (parseFloat(amount) + parseFloat(charge)).toFixed(2);
                const toFixedDigit = resource.method.crypto == 1 ? 8 : 2;
                const final_amo = (payable * rate).toFixed(toFixedDigit);

                $('.min').text(parseFloat(resource.min_amount).toFixed(2));
                $('.max').text(parseFloat(resource.max_amount).toFixed(2));
                $('.charge').text(charge);
                $('.payable').text(payable);
                $('.final_amo').text(final_amo);
                $('.method_currency').text(resource.currency);

                if (resource.method.crypto == 1) {
                    $('.crypto_currency').removeClass('d-none');
                } else {
                    $('.crypto_currency').addClass('d-none');
                }

                if (resource.currency !== '{{ $general->cur_text }}') {
                    const rateElement = `
                        <span>@lang('Conversion Rate')</span>
                        <span><strong>1 {{ __($general->cur_text) }}</strong> =
                        <span class="rate">${rate}</span>
                        <span class="method_currency">${resource.currency}</span></span>
                    `;
                    $('.rate-element').html(rateElement).removeClass('d-none').addClass('d-flex');
                    $('.in-site-cur').removeClass('d-none').addClass('d-flex');
                } else {
                    $('.rate-element, .in-site-cur').addClass('d-none').removeClass('d-flex');
                }

                $('input[name=currency]').val(resource.currency);
                $('input[name=method_code]').val(resource.method_code);
            };

            $('select[name=gateway]').on('change', updatePreview);
            $('input[name=amount]').on('input', updatePreview);
        })(jQuery);
    </script>
@endpush
