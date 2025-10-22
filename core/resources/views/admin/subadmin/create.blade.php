@extends('admin.layouts.app')

@section('panel')
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title mb-4">@lang('Create SubAdmin')</h4>
                    <form action="{{ route('admin.subadmin.store') }}" method="POST">
                        @csrf
                        <div class="form-group">
                            <label>@lang('Name')</label>
                            <input type="text" name="name" class="form-control" value="{{ old('name') }}" required>
                        </div>
                        <div class="form-group">
                            <label>@lang('Email')</label>
                            <input type="email" name="email" class="form-control" value="{{ old('email') }}" required>
                        </div>
                        <div class="form-group">
                            <label>@lang('Username')</label>
                            <input type="text" name="username" class="form-control" value="{{ old('username') }}" required>
                        </div>
                        <div class="form-group">
                            <label>@lang('Password')</label>
                            <input type="password" name="password" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>@lang('Confirm Password')</label>
                            <input type="password" name="password_confirmation" class="form-control" required>
                        </div>
                        <button type="submit" class="btn btn--primary w-100">@lang('Create SubAdmin')</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
