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
            margin-bottom: 15px;
        }

        .form-check-label {
            color: #fff;
        }
    </style>
@endpush

@section('content')
    <div class="row justify-content-center align-items-center" style="min-height: 80dvh;">
        <div class="col-md-8">
            <div class="card custom--card">
                <div class="card-body">

                    <form action="{{ route('user.kyc.submit') }}" method="post" enctype="multipart/form-data">
                        @csrf

                        <x-viser-form identifier="act" identifierValue="kyc" />

                        <div class="form-group mt-4">
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

        window.addEventListener('DOMContentLoaded', () => {
            document.querySelectorAll("input[type=checkbox]").forEach((checkbox, i) => {
                if (checkbox.hasAttribute('id')) {
                    let id = checkbox.getAttribute('id') + '_' + i;
                    checkbox.setAttribute('id', id);
                    if (checkbox.nextSibling?.nextElementSibling) {
                        checkbox.nextSibling.nextElementSibling.setAttribute('for', id);
                    }
                }
            });
        });

        // Replace old class with new class
        (function ($) {
            $('.form-control')
                .addClass("cmn--form--control")
                .removeClass('form--control');
        })(jQuery);
    </script>
@endpush
