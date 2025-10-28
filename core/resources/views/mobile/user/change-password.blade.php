@extends('templates.basic.layouts.mobile-user')

@push('styles')
    <link rel="stylesheet" href="{{asset('assets/templates/basic/css/main.css')}}">
    <link href="{{ asset('assets/templates/basic/css/color.php') }}?color={{$general->base_color}}" rel="stylesheet" />
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
                    <form action="" method="post">
                        @csrf
                        <div class="form-group">
                            <label class="form-label">@lang('Current Password')</label>
                            <input type="password" class="form-control cmn--form--control" name="current_password" required
                                autocomplete="current-password">
                        </div>
                        <div class="form-group">
                            <label class="form-label">@lang('Password')</label>
                            <input type="password" class="form-control cmn--form--control" name="password" required
                                autocomplete="current-password">
                            @if($general->secure_password)
                                <div class="input-popup">
                                    <p class="error lower">@lang('1 small letter minimum')</p>
                                    <p class="error capital">@lang('1 capital letter minimum')</p>
                                    <p class="error number">@lang('1 number minimum')</p>
                                    <p class="error special">@lang('1 special character minimum')</p>
                                    <p class="error minimum">@lang('6 character password')</p>
                                </div>
                            @endif
                        </div>
                        <div class="form-group">
                            <label class="form-label">@lang('Confirm Password')</label>
                            <input type="password" class="form-control cmn--form--control" name="password_confirmation"
                                required autocomplete="current-password">
                        </div>
                        <div class="form-group">
                            <button type="submit" class="cmn--btn btn-block">@lang('Submit')</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@if($general->secure_password)
    @push('scripts')
        <script src="{{ asset('assets/global/js/secure_password.js') }}"></script>
    @endpush
@endif
