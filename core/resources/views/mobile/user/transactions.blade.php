@extends('templates.basic.layouts.mobile-user')

@push('styles')
    <link rel="stylesheet" href="{{asset('assets/templates/basic/css/main.css')}}">
    <link href="{{ asset('assets/templates/basic/css/color.php') }}?color={{$general->base_color}}" rel="stylesheet" />

    <style>
        .cmn--table {
            background-color: unset;
        }
        .cmn--table thead {
            color: #fff;
        }

        body{
            background-color: black;
        }
        /* For mobile view: stack rows */
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
                display: flex;td:last-child
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
    </style>
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
    <div class="container">
        <div class="row justify-content-center gy-4">

            {{-- FILTER TOGGLE BUTTON --}}
            <div class="col-12">
                <div class="show-filter text-end mb-3">
                    <button type="button" class="cmn--btn btn-block showFilterBtn btn-sm">
                        <i class="las la-filter"></i> @lang('Filter')
                    </button>
                </div>

                {{-- FILTER CARD --}}
                <div class="card responsive-filter-card custom--card" style="display: none;">
                    <div class="card-body">
                        <form action="">
                            <div class="d-flex flex-wrap gap-4">
                                <div class="flex-grow-1">
                                    <label>@lang('Transaction Number')</label>
                                    <input type="text" name="search" value="{{ request()->search }}"
                                        class="form-control cmn--form--control">
                                </div>
                                <div class="flex-grow-1">
                                    <label>@lang('Type')</label>
                                    <select name="trx_type" class="form-control cmn--form--control">
                                        <option value="">@lang('All')</option>
                                        <option value="+" @selected(request()->trx_type == '+')>@lang('Plus')</option>
                                        <option value="-" @selected(request()->trx_type == '-')>@lang('Minus')</option>
                                    </select>
                                </div>
                                <div class="flex-grow-1">
                                    <label>@lang('Remark')</label>
                                    <select class="form-control cmn--form--control" name="remark">
                                        <option value="">@lang('Any')</option>
                                        @foreach($remarks as $remark)
                                            <option value="{{ $remark->remark }}" @selected(request()->remark == $remark->remark)>
                                                {{ __(keyToTitle($remark->remark)) }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="flex-grow-1 align-self-end">
                                    <button class="cmn--btn btn-block h-100">
                                        <i class="las la-filter"></i> @lang('Filter')
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            {{-- TRANSACTIONS TABLE --}}
            <div class="col-12">
                <div class="table-responsive">
                    <table class="table cmn--table text-white text-end">
                        <thead>
                            <tr>
                                <th>@lang('Trx')</th>
                                <th>@lang('Transacted')</th>
                                <th>@lang('Amount')</th>
                                <th>@lang('Post Balance')</th>
                                <th>@lang('Detail')</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($transactions as $trx)
                                <tr>
                                    <td data-label="@lang('Trx')">
                                        <strong>{{ $trx->trx }}</strong>
                                    </td>

                                    <td data-label="@lang('Transacted')">
                                        {{ showDateTime($trx->created_at) }}<br>
                                        {{ diffForHumans($trx->created_at) }}
                                    </td>

                                    <td data-label="@lang('Amount')">
                                        <span
                                            class="fw-bold @if($trx->trx_type == '+')text--success @else text--danger @endif">
                                            {{ $trx->trx_type }} {{ showAmount($trx->amount) }} {{ $general->cur_text }}
                                        </span>
                                    </td>

                                    <td data-label="@lang('Post Balance')">
                                        {{ showAmount($trx->post_balance) }} {{ __($general->cur_text) }}
                                    </td>

                                    <td data-label="@lang('Detail')">
                                        {{ __($trx->details) }}
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="100%" class="text-center text-muted">
                                        {{ __($emptyMessage) }}
                                    </td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>

                @if ($transactions->hasPages())
                    {{ $transactions->links() }}
                @endif
            </div>
        </div>
    </div>
@endsection

@push('scripts')
    <script>
        (function($) {
            "use strict";
            $('.showFilterBtn').on('click', function() {
                $('.responsive-filter-card').slideToggle();
            });
        })(jQuery);
    </script>
@endpush
