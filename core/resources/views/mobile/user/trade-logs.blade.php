@extends('templates.basic.layouts.mobile-user')

@push('styles')
    <style>
        /* Keep thead visible */
        .cmn--table thead {
            /* background-color: #0d6efd; */
            color: #fff;
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
@endpush


@section('content')
    <div class="row">
        <div class="col-12">
            <div class="table-responsive">
                <table class="table cmn--table text-white text-end">
                    <thead>
                        <tr>
                            <th>@lang('S.N.')</th>
                            <th>@lang('Crypto Currency')</th>
                            <th>@lang('Amount')</th>
                            <th>@lang('High/Low')</th>
                            <th>@lang('Result')</th>
                            <th>@lang('Status')</th>
                            <th>@lang('Date')</th>
                        </tr>
                    </thead>
                    <tbody class="border-0">
                        @forelse($tradeLogs as $tradeLog)
                            <tr>
                                <td data-label="@lang('S.N.')">{{$loop->index + $tradeLogs->firstItem()}}</td>
                                <td data-label="@lang('Crypto Currency')">
                                    <div>
                                        <span class="d-block">{{__(@$tradeLog->crypto->symbol)}}</span>
                                        <small>{{__(@$tradeLog->crypto->name)}}</small>
                                    </div>
                                </td>
                                <td data-label="@lang('Amount')">{{showAmount($tradeLog->amount)}} {{__($general->cur_text)}}
                                </td>
                                <td data-label="@lang('High/Low')">@php echo $tradeLog->highLowBadge; @endphp</td>
                                <td data-label="@lang('Result')">@php echo $tradeLog->resultStatus; @endphp</td>
                                <td data-label="@lang('Status')">@php echo $tradeLog->statusBadge; @endphp</td>
                                <td data-label="@lang('Date')">{{showDateTime($tradeLog->created_at)}}</td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="100%" class="text-center text-muted">{{ __($emptyMessage) }}</td>
                            </tr>
                        @endforelse
                    </tbody>

                </table>
            </div>
            @if ($tradeLogs->hasPages())
                {{ paginateLinks($tradeLogs) }}
            @endif
        </div>
    </div>
@endsection
