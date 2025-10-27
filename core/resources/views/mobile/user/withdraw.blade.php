@extends('templates.basic.layouts.mobile-user')

@section('content')
    <div class="row justify-content-center align-items-center" style="height: 80dvh;">
        <div class="col-lg-6 col-md-8">
            <div class="card shadow-sm">
                <div class="card-header bg-primary text-white">
                    <h5 class="mb-0">@lang('Withdraw')</h5>
                </div>
                <div class="card-body bg-light">
                    <form action="{{ route('user.withdraw.money') }}" method="post">
                        @csrf

                        <div class="mb-3">
                            <label class="form-label">@lang('Method')</label>
                            <select class="form-select" name="method_code" required>
                                <option value="">@lang('Select Type')</option>
                                @foreach($withdrawMethod as $data)
                                    <option value="{{ $data->id }}" data-resource="{{ $data }}">
                                        {{ __($data->name) }}
                                    </option>
                                @endforeach
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">@lang('Amount')</label>
                            <div class="input-group">
                                <input type="number" step="any" name="amount" value="{{ old('amount') }}"
                                    class="form-control" required>
                                <span class="input-group-text">{{ __($general->cur_text) }}</span>
                            </div>
                        </div>

                        <div class="mt-3 preview-details d-none">
                            <ul class="list-group text-center">
                                <li class="list-group-item d-flex justify-content-between">
                                    <span>@lang('Limit')</span>
                                    <span><span class="min fw-bold">0</span> -
                                        <span class="max fw-bold">0</span> {{ __($general->cur_text) }}</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between">
                                    <span>@lang('Charge')</span>
                                    <span><span class="charge fw-bold">0</span> {{ __($general->cur_text) }}</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between">
                                    <span>@lang('Receivable')</span>
                                    <span><span class="receivable fw-bold">0</span> {{ __($general->cur_text) }}</span>
                                </li>
                                <li class="list-group-item d-none justify-content-between rate-element"></li>
                                <li class="list-group-item d-none justify-content-between in-site-cur">
                                    <span>@lang('In') <span class="base-currency"></span></span>
                                    <strong class="final_amo">0</strong>
                                </li>
                            </ul>
                        </div>

                        <button type="submit" class="btn btn-primary w-100 mt-3">@lang('Next')</button>
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
                const methodSelect = $('select[name=method_code]');
                const amountInput = $('input[name=amount]');
                const resource = methodSelect.find('option:selected').data('resource');

                if (!methodSelect.val()) {
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
                const receivable = (amount - charge).toFixed(2);
                const final_amo = (receivable * rate).toFixed(2);

                $('.min').text(parseFloat(resource.min_limit).toFixed(2));
                $('.max').text(parseFloat(resource.max_limit).toFixed(2));
                $('.charge').text(charge);
                $('.receivable').text(receivable);
                $('.final_amo').text(final_amo);
                $('.base-currency').text(resource.currency);

                if (resource.currency !== '{{ $general->cur_text }}') {
                    const rateElement = `
                    <span>@lang('Conversion Rate')</span>
                    <span><strong>1 {{ __($general->cur_text) }}</strong> =
                    <span class="rate">${rate}</span>
                    <span class="base-currency">${resource.currency}</span></span>
                `;
                    $('.rate-element').html(rateElement).removeClass('d-none').addClass('d-flex');
                    $('.in-site-cur').removeClass('d-none').addClass('d-flex');
                } else {
                    $('.rate-element, .in-site-cur').addClass('d-none').removeClass('d-flex');
                }
            };

            $('select[name=method_code]').on('change', updatePreview);
            $('input[name=amount]').on('input', updatePreview);

        })(jQuery);
    </script>
@endpush
