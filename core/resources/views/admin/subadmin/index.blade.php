@extends('admin.layouts.app')

@section('panel')
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between mb-3">
                        <h4 class="card-title">@lang('SubAdmins')</h4>
                        <a href="{{ route('admin.subadmin.create') }}" class="btn btn-sm btn--primary">
                            <i class="las la-plus"></i> @lang('Add New')
                        </a>
                    </div>
                    <div class="table-responsive--md">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>@lang('Name')</th>
                                    <th>@lang('Email')</th>
                                    <th>@lang('Username')</th>
                                    <th>@lang('Invitation Code')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($subAdmins as $subAdmin)
                                    <tr>
                                        <td>{{ $subAdmin->name }}</td>
                                        <td>{{ $subAdmin->email }}</td>
                                        <td>{{ $subAdmin->username }}</td>
                                        <td>{{ $subAdmin->invitation_code }}</td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="5" class="text-center">@lang('No sub-admins found')</td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
