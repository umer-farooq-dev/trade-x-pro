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

        body,
        .bg-black {
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
                display: flex;
                td: last-child align-items: center;
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
    <div class="row justify-content-center align-items-center" style="min-height=" 80dvh">
        <div class="col-12">
            <div class="table-responsive">
                <table class="table cmn--table">
                    <thead>
                        <tr>
                            <th>@lang('S.N.')</th>
                            <th>@lang('User')</th>
                            <th>@lang('TRX')</th>
                            <th>@lang('Amount')</th>
                            <th>@lang('Post Balance')</th>
                            <th>@lang('Detail')</th>
                            <th>@lang('Date')</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($commissions as $commission)
                            <tr>
                                <td data-label="@lang('S.N.')">{{$loop->index + $commissions->firstItem()}}</td>
                                <td data-label="@lang('User')">{{$commission->fromUser->username}}</td>
                                <td data-label="@lang('TRX')">{{$commission->trx }}</td>
                                <td data-label="@lang('Amount')">{{showAmount($commission->amount)}}
                                    {{__($general->cur_text)}}
                                </td>
                                <td data-label="@lang('Post Balance')">{{showAmount($commission->post_balance) }}
                                    {{__($general->cur_text)}}
                                </td>
                                <td data-label="@lang('Detail')">{{$commission->details}}</td>
                                <td data-label="@lang('Date')">{{showDateTime($commission->created_at) }}</td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="100%" class="text-center text-muted">{{ __($emptyMessage) }}</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
            @if ($commissions->hasPages())
                {{paginateLinks($commissions)}}
            @endif
        </div>
    </div>
@endsection
