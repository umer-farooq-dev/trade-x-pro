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
    </style>
@endpush

@section('content')
    <div class="row justify-content-center align-items-center" style="min-height: 80dvh;">
        <div class="col-lg-10">
            <div class="card custom--card">
                <div class="card-body">
                    <div class="row gy-4 justify-content-center flex-wrap-reverse">
                        <div class="col-md-7 col-lg-8">
                            <form id="collectionInfoForm" class="register py-3 pe-3 ps-3 ps-md-0" method="post">
                                @csrf
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label class="form-label">@lang('Full Name')</label>
                                            <input type="text" class="form-control cmn--form--control" id="fullName"
                                                name="full_name" required>
                                        </div>
                                    </div>

                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label class="form-label">@lang('Bank Name')</label>
                                            <input type="text" class="form-control cmn--form--control" id="bankName"
                                                name="bank_name" required>
                                        </div>
                                    </div>

                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label class="form-label">@lang('Account Number')</label>
                                            <input type="text" class="form-control cmn--form--control" id="accountNumber"
                                                name="account_number" required>
                                        </div>
                                    </div>

                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label class="form-label">@lang('IFSC')</label>
                                            <input type="text" class="form-control cmn--form--control" id="ifsc" name="ifsc"
                                                required>
                                        </div>
                                    </div>
                                </div>

                                <button type="submit" class="cmn--btn btn-block mt-3">@lang('Submit')</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
    <script>
        $('#collectionInfoForm').submit(function (e) {
            e.preventDefault();

            var formData = $(this).serialize();

            $.ajax({
                url: '{{ route("user.collection.info.submit") }}',
                type: 'POST',
                data: formData,
                success: function (response) {
                    if (response.success) {
                        notify('success', response.message);
                        $('#collectionInfoForm')[0].reset();
                    } else {
                        notify('info', response.message)
                    }
                },
                error: function (xhr) {
                    var errors = xhr.responseJSON.errors;
                    if (errors) {
                        var errorMsg = Object.values(errors).flat().join('\n');
                        notify('error', errorMsg);
                    } else {
                        notify('error', 'An error occurred while submitting the form.');
                    }
                }
            });
        });
    </script>
@endpush
