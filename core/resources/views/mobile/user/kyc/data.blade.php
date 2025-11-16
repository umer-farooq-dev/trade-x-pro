@extends('templates.basic.layouts.mobile-user')

@push('styles')
<link rel="stylesheet" href="{{ asset('assets/templates/basic/css/main.css') }}">
<link href="{{ asset('assets/templates/basic/css/color.php') }}?color={{ $general->base_color }}" rel="stylesheet" />

<style>
    body {
        background-color: black;
    }
    .custom--card,
    .custom--card .card-body {
        background-color: unset;
    }
    .list-group-item {
        background-color: transparent !important;
        border-color: rgba(255,255,255,0.1);
        padding: 14px 10px;
    }
    .list-group-item p {
        margin: 0;
        color: #fff;
    }
</style>
@endpush

@section('content')
<div class="row justify-content-center align-items-center" style="min-height: 80dvh;">
    <div class="col-md-10">
        <div class="card custom--card">
            <div class="card-body p-0">

                @if($user->kyc_data)

                    <ul class="list-group">
                        @foreach($user->kyc_data as $val)
                            @continue(!$val->value)

                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <span class="text-white">{{ __($val->name) }}</span>

                                <span class="text-end">

                                    @if($val->type == 'checkbox')
                                        <span class="text-white">{{ implode(',', $val->value) }}</span>

                                    @elseif($val->type == 'file')
                                        <a href="{{ route('user.attachment.download', encrypt(getFilePath('verify').'/'.$val->value)) }}"
                                           class="text-white">
                                            <i class="fa fa-file"></i> @lang('Attachment')
                                        </a>

                                    @else
                                        <p class="text-white">{{ __($val->value) }}</p>
                                    @endif

                                </span>
                            </li>
                        @endforeach
                    </ul>

                @else
                    <h5 class="text-center text-white py-4">@lang('KYC data not found')</h5>
                @endif

            </div>
        </div>
    </div>
</div>
@endsection
