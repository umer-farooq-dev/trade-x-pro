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

        .form-group {
            margin-bottom: 12px;
        }

        label.form-label {
            color: #fff;
            font-weight: 500;
        }
    </style>
@endpush

@section('content')
    <div class="row justify-content-center align-items-center" style="min-height: 80dvh;">
        <div class="col-md-8">
            <div class="card custom--card">
                <div class="card-body">
                    <form action="{{ route('user.withdraw.submit') }}" method="post" enctype="multipart/form-data">
                        @csrf

                        <div class="mb-3 text-white">
                            @php echo $withdraw->method->description; @endphp
                        </div>

                        <x-viser-form identifier="id" identifierValue="{{ $withdraw->method->form_id }}" />

                        @if(auth()->user()->ts)
                            <div class="form-group">
                                <label class="form-label">@lang('Google Authenticator Code')</label>
                                <input type="text" name="authenticator_code"
                                    class="form-control cmn--form--control" required>
                            </div>
                        @endif

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
        "use strict";
        (function ($) {
            $('.form-control').addClass('cmn--form--control');
        })(jQuery);
    </script>
@endpush
