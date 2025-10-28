@extends('templates.basic.layouts.mobile-user')

@push('styles')
    <link rel="stylesheet" href="{{ asset('assets/templates/basic/css/main.css') }}">
    <link href="{{ asset('assets/templates/basic/css/color.php') }}?color={{ $general->base_color }}" rel="stylesheet" />

    <style>
        .cmn--table {
            background-color: unset;
        }

        .cmn--table thead {
            color: #fff;
        }

        body,
        .bg-black {
            background-color: black;
        }

        /* Mobile responsive table */
        @media (max-width: 768px) {
            .cmn--table thead {
                display: none;
            }

            .cmn--table tbody tr {
                display: block;
                margin-bottom: 15px;
                border: 1px solid rgba(255, 255, 255, 0.2);
                border-radius: 8px;
                background: rgba(255, 255, 255, 0.05);
            }

            .cmn--table tbody tr td {
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 10px 15px;
                border: none;
                border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            }

            .cmn--table tbody tr td::before {
                content: attr(data-label);
                font-weight: 600;
                text-align: left;
                color: #ddd;
            }

            .cmn--table tbody tr td:last-child {
                border-bottom: none;
            }
        }

        .custom--card,
        .cmn--form--control,
        .custom--card .card-body {
            background-color: unset;
        }

        .bg-light-black {
            background: rgb(13, 13, 13);
        }
    </style>
@endpush

@section('content')
    <div class="row justify-content-end g-3 mb-3">
        <div class="col-12 col-md-4">
            <form action="" method="get">
                <div class="input-group">
                    <input type="text" name="search" class="form-control cmn--form--control"
                        value="{{ request()->search }}" placeholder="@lang('Search By Transactions')">
                    <button class="input-group-text bg--base text-white border-0">
                        <i class="las la-search"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>

    <div class="table-responsive">
        <table class="table cmn--table text-white text-end">
            <thead>
                <tr>
                    <th>@lang('Gateway | Transaction')</th>
                    <th>@lang('Initiated')</th>
                    <th>@lang('Amount')</th>
                    <th>@lang('Conversion')</th>
                    <th>@lang('Status')</th>
                    <th>@lang('Action')</th>
                </tr>
            </thead>
            <tbody class="border-0">
                @forelse($deposits as $deposit)
                    <tr>
                        <td data-label="@lang('Gateway | Transaction')">
                            <div>
                                <span class="fw-bold d-block text-primary">
                                    {{ __($deposit->gateway?->name) }}
                                </span>
                                <small>{{ $deposit->trx }}</small>
                            </div>
                        </td>

                        <td data-label="@lang('Initiated')">
                            {{ showDateTime($deposit->created_at) }} <br>
                            {{ diffForHumans($deposit->created_at) }}
                        </td>

                        <td data-label="@lang('Amount')">
                            <div>
                                {{ __($general->cur_sym) }}{{ showAmount($deposit->amount) }}
                                + <span class="text--danger" title="@lang('charge')">
                                    {{ showAmount($deposit->charge) }}
                                </span>
                                <br>
                                <strong title="@lang('Amount with charge')">
                                    {{ showAmount($deposit->amount + $deposit->charge) }}
                                    {{ __($general->cur_text) }}
                                </strong>
                            </div>
                        </td>

                        <td data-label="@lang('Conversion')">
                            <div>
                                1 {{ __($general->cur_text) }} =
                                {{ showAmount($deposit->rate) }}
                                {{ __($deposit->method_currency) }}
                                <br>
                                <strong>
                                    {{ showAmount($deposit->final_amo) }}
                                    {{ __($deposit->method_currency) }}
                                </strong>
                            </div>
                        </td>

                        <td data-label="@lang('Status')">
                            @php echo $deposit->statusBadge @endphp
                        </td>

                        @php $details = ($deposit->detail != null) ? json_encode($deposit->detail) : null; @endphp
                        <td data-label="@lang('Action')">
                            <button class="btn btn--base-outline btn-sm detailBtn
                                @if($deposit->method_code < 1000) disabled @endif"
                                @if($deposit->method_code >= 1000) data-info="{{ $details }}" @endif
                                @if ($deposit->status == Status::PAYMENT_REJECT)
                                    data-admin_feedback="{{ $deposit->admin_feedback }}"
                                @endif>
                                <i class="las la-desktop"></i> @lang('Details')
                            </button>
                        </td>
                    </tr>
                @empty
                    <tr>
                        <td class="text-muted text-center" colspan="100%">
                            {{ __($emptyMessage) }}
                        </td>
                    </tr>
                @endforelse
            </tbody>
        </table>
    </div>

    @if ($deposits->hasPages())
        {{ paginateLinks($deposits) }}
    @endif

    <!-- Detail Modal -->
    <div class="modal fade border-1 border-white" id="detailModal" tabindex="-1"
        aria-labelledby="detailModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content shadow bg-light-black border-1 border-white">
                <div class="modal-header text-white bg-light-black">
                    <h5 class="modal-title" id="detailModalLabel">@lang('Details')</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                        aria-label="Close"></button>
                </div>
                <div class="modal-body bg-light-black border-1 border-white">
                    <ul class="list-group userData list-group-flush mb-3"></ul>
                    <div class="feedback"></div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
<script>
"use strict";
(function ($) {
    $('.detailBtn').on('click', function () {
        const modal = $('#detailModal');
        const userData = $(this).data('info');
        let html = ``;

        if (userData) {
            userData.forEach(element => {
                if (element.type !== 'file') {
                    html += `
                        <li class="list-group-item d-flex justify-content-between align-items-center bg-light-black text-white">
                            <span>${element.name}</span>
                            <span>${element.value}</span>
                        </li>`;
                }
            });
        }

        modal.find('.userData').html(html);

        if ($(this).data('admin_feedback') !== undefined) {
            modal.find('.feedback').html(`
                <div class="alert alert-warning mt-3">
                    <strong>@lang('Admin Feedback')</strong>
                    <p class="mb-0 mt-1">${$(this).data('admin_feedback')}</p>
                </div>
            `);
        } else {
            modal.find('.feedback').html('');
        }

        modal.modal('show');
    });
})(jQuery);
</script>
@endpush
