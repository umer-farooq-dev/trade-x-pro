@extends('admin.layouts.app')
@section('panel')
<div class="row">
    <div class="col-lg-12">
        <div class="card b-radius--10">
            <div class="card-body p-0">
                <div class="table-responsive--md table-responsive">
                    <table class="table table--light style--two">
                        <thead>
                            <tr>
                                <th>@lang('S.N.')</th>
                                <th>@lang('User')</th>
                                <th>@lang('Crypto')</th>
                                <th>@lang('Amount')</th>
                                <th>@lang('In Time')</th>
                                <th>@lang('HighLow')</th>
                                <th>@lang('Result')</th>
                                <th>@lang('Status')</th>
                                <th>@lang('Date')</th>
                                <th>@lang('Action')</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($tradeLogs as $tradeLog)
                            <tr>
                                <td>{{ $loop->index + $tradeLogs->firstItem() }}</td>
                                <td>
                                    <span class="d-block">{{ @$tradeLog->user->full_name }}</span>
                                    <span>
                                        <a href="{{ route('admin.users.detail', $tradeLog->user_id) }}" class="text--small">{{ @$tradeLog->user->username }}</a>
                                    </span>
                                </td>
                                <td>
                                    <span>{{__(@$tradeLog->crypto->symbol)}}</span> <br>
                                    <span class="text--small">{{__(@$tradeLog->crypto->name)}}</span>
                                </td>
                                <td>{{ showAmount($tradeLog->amount) }} {{ __($general->cur_text) }}</td>
                                <td>{{ showDateTime($tradeLog->in_time) }}</td>
                                <td>@php echo $tradeLog->highLowBadge; @endphp</td>
                                <td>@php echo $tradeLog->resultStatus; @endphp</td>
                                <td>@php echo $tradeLog->statusBadge; @endphp</td>
                                <td>{{ showDateTime($tradeLog->created_at) }}</td>
                                <td>
                                    <button type="button" class="btn btn-sm btn--primary editTradeResult" data-id="{{ $tradeLog->id }}" data-result="{{ $tradeLog->result }}">
                                        <i class="la la-pencil"></i> @lang('Edit')
                                    </button>
                                </td>
                            </tr>
                            @empty
                            <tr>
                                <td class="text-muted text-center" colspan="100%">{{ __($emptyMessage) }}</td>
                            </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
            @if ($tradeLogs->hasPages())
            <div class="card-footer py-4">
                {{ paginateLinks($tradeLogs) }}
            </div>
            @endif
        </div>
    </div>
</div>

<!-- Modal for Editing Trade Result -->
<div class="modal fade" id="editTradeResultModal" tabindex="-1" role="dialog" aria-labelledby="editTradeResultModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <form method="POST" action="">
                @csrf
                @method('PATCH')
                <input type="hidden" name="trade_id" id="tradeId">
                <div class="modal-header">
                    <h5 class="modal-title" id="editTradeResultModalLabel">@lang('Edit Trade Result')</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="result">@lang('Result')</label>
                        <select name="result" id="result" class="form-control">
                            <option value="1" @selected(old('result', '') == 1)>@lang('Win')</option>
                            <option value="2" @selected(old('result', '') == 2)>@lang('Loss')</option>
                            <option value="3" @selected(old('result', '') == 3)>@lang('Draw')</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn--secondary" data-dismiss="modal">@lang('Close')</button>
                    <button type="submit" class="btn btn--success">@lang('Update')</button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection

@push('breadcrumb-plugins')
<x-search-form placeholder="Username,Crypto..." dateSearch="yes"/>
@endpush

@push('script')
<script>
    (function ($) {
        "use strict";

        $('.editTradeResult').on('click', function () {
            var modal = $('#editTradeResultModal');
            var tradeId = $(this).data('id');
            var result = $(this).data('result');

            modal.find('#tradeId').val(tradeId);
            modal.find('#result').val(result);
            var updateUrl = '{{ route("admin.trade.log.update", ":id") }}';
            updateUrl = updateUrl.replace(':id', tradeId);
            modal.find('form').attr('action', updateUrl);
            modal.modal('show');
        });
    })(jQuery);
</script>
@endpush
