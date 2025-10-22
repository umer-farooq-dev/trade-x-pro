@extends('admin.layouts.app')

@section('panel')
    <div class="row">
        <div class="col-12">
            <div class="row gy-4">
                <div class="col-xxl-3 col-sm-6">
                    <div class="widget-two style--two box--shadow2 b-radius--5 bg--19">
                        <div class="widget-two__icon b-radius--5 bg--primary">
                            <i class="las la-money-bill-wave-alt"></i>
                        </div>
                        <div class="widget-two__content">
                            <h3 class="text-white">{{ $general->cur_sym }}{{ showAmount($user->balance) }}</h3>
                            <p class="text-white">@lang('Balance')</p>
                        </div>
                        <a href="{{ route('admin.report.transaction') }}?search={{ $user->username }}" class="widget-two__btn">@lang('View All')</a>
                    </div>
                </div>
                <div class="col-xxl-3 col-sm-6">
                    <div class="widget-two style--two box--shadow2 b-radius--5 bg--primary">
                        <div class="widget-two__icon b-radius--5 bg--primary">
                            <i class="las la-wallet"></i>
                        </div>
                        <div class="widget-two__content">
                            <h3 class="text-white">{{ $general->cur_sym }}{{ showAmount($widget['total_deposit']) }}</h3>
                            <p class="text-white">@lang('Deposits')</p>
                        </div>
                        <a href="{{ route('admin.deposit.list') }}?search={{ $user->username }}" class="widget-two__btn">@lang('View All')</a>
                    </div>
                </div>
                <div class="col-xxl-3 col-sm-6">
                    <div class="widget-two style--two box--shadow2 b-radius--5 bg--1">
                        <div class="widget-two__icon b-radius--5 bg--primary">
                            <i class="fas fa-wallet"></i>
                        </div>
                        <div class="widget-two__content">
                            <h3 class="text-white">{{ $general->cur_sym }}{{ showAmount($widget['total_withdrawals']) }}</h3>
                            <p class="text-white">@lang('Withdrawals')</p>
                        </div>
                        <a href="{{ route('admin.withdraw.log') }}?search={{ $user->username }}" class="widget-two__btn">@lang('View All')</a>
                    </div>
                </div>
                <div class="col-xxl-3 col-sm-6">
                    <div class="widget-two style--two box--shadow2 b-radius--5 bg--17">
                        <div class="widget-two__icon b-radius--5 bg--primary">
                            <i class="las la-exchange-alt"></i>
                        </div>
                        <div class="widget-two__content">
                            <h3 class="text-white">{{ $widget['total_transaction'] }}</h3>
                            <p class="text-white">@lang('Transactions')</p>
                        </div>
                        <a href="{{ route('admin.report.transaction') }}?search={{ $user->username }}" class="widget-two__btn">@lang('View All')</a>
                    </div>
                </div>
            </div>
            <div class="row gy-4 mt-2">
                <div class="col-xxl-3 col-sm-6">
                    <x-widget style="3" link="{{route('admin.trade.log.index')}}?user_id={{ $user->id }}" icon="las la-gamepad" title="Total Trades" value="{{getAmount($widget['total_trade']) }}" bg="15" />
                </div>
                <div class="col-xxl-3 col-sm-6">
                    <x-widget style="3" link="{{route('admin.trade.log.wining')}}?user_id={{ $user->id }}" icon="las la-trophy" title="Win Trades" value="{{getAmount($widget['total_wining_trade']) }}" bg="success-2" />
                </div>
                <div class="col-xxl-3 col-sm-6">
                    <x-widget style="3" link="{{ route('admin.trade.log.losing') }}?user_id={{ $user->id }}" icon="las la-slash" title="Loss Trades" value="{{getAmount($widget['total_losing_trade']) }}" bg="danger-2" />
                </div>
                <div class="col-xxl-3 col-sm-6">
                    <x-widget style="3" link="{{ route('admin.trade.log.draw') }}?user_id={{ $user->id }}" icon="las la-draw-polygon" title="Draw Trades" value="{{getAmount($widget['total_draw_trade']) }}" bg="3" />
                </div>
                @if(auth('admin')->user()->isSubAdmin == 1)
                <div class="col-xxl-3 col-sm-6">
                    <div class="widget-two style--two box--shadow2 b-radius--5 bg--purple">
                        <div class="widget-two__icon b-radius--5 bg--primary">
                            <i class="las la-star"></i>
                        </div>
                        <div class="widget-two__content">
                            <h3 class="text-white">{{ $widget['score'] }}</h3>
                            <p class="text-white">@lang('Score')</p>
                        </div>
                        <a href="#" class="widget-two__btn" data-bs-toggle="modal" data-bs-target="#updateScoreModal">@lang('Update')</a>
                    </div>
                </div>
                @endif
            </div>
            <div class="d-flex flex-wrap gap-3 mt-4">
                @if(auth('admin')->user()->isSubAdmin == 1)
                <div class="flex-fill">
                    <button data-bs-toggle="modal" data-bs-target="#updateScoreModal" class="btn btn--purple btn--shadow w-100 btn-lg">
                        <i class="las la-star"></i> @lang('Update Score')
                    </button>
                </div>
                @endif
                <div class="flex-fill">
                    <button data-bs-toggle="modal" data-bs-target="#addSubModal" class="btn btn--success btn--shadow w-100 btn-lg bal-btn" data-act="add">
                        <i class="las la-plus-circle"></i> @lang('Balance')
                    </button>
                </div>
                <div class="flex-fill">
                    <button data-bs-toggle="modal" data-bs-target="#addSubModal" class="btn btn--danger btn--shadow w-100 btn-lg bal-btn" data-act="sub">
                        <i class="las la-minus-circle"></i> @lang('Balance')
                    </button>
                </div>
                <div class="flex-fill">
                    <a href="{{route('admin.report.login.history')}}?search={{ $user->username }}" class="btn btn--primary btn--shadow w-100 btn-lg">
                        <i class="las la-list-alt"></i>@lang('Logins')
                    </a>
                </div>
                <div class="flex-fill">
                    <a href="{{ route('admin.users.notification.log',$user->id) }}" class="btn btn--secondary btn--shadow w-100 btn-lg">
                        <i class="las la-bell"></i>@lang('Notifications')
                    </a>
                </div>
                <div class="flex-fill">
                    <a href="{{route('admin.users.login',$user->id)}}" target="_blank" class="btn btn--primary btn--gradi btn--shadow w-100 btn-lg">
                        <i class="las la-sign-in-alt"></i>@lang('Login as User')
                    </a>
                </div>
                @if($user->kyc_data)
                <div class="flex-fill">
                    <a href="{{ route('admin.users.kyc.details', $user->id) }}" target="_blank" class="btn btn--dark btn--shadow w-100 btn-lg">
                        <i class="las la-user-check"></i>@lang('KYC Data')
                    </a>
                </div>
                @endif
                <div class="flex-fill">
                    @if($user->status == Status::USER_ACTIVE)
                    <button type="button" class="btn btn--warning btn--gradi btn--shadow w-100 btn-lg userStatus" data-bs-toggle="modal" data-bs-target="#userStatusModal">
                        <i class="las la-ban"></i>@lang('Ban User')
                    </button>
                    @else
                    <button type="button" class="btn btn--success btn--gradi btn--shadow w-100 btn-lg userStatus" data-bs-toggle="modal" data-bs-target="#userStatusModal">
                        <i class="las la-undo"></i>@lang('Unban User')
                    </button>
                    @endif
                </div>
            </div>

            <!-- Tabs Section -->
            <div class="mt-4">
                <ul class="nav nav-tabs" id="userDetailTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="info-tab" data-bs-toggle="tab" data-bs-target="#info" type="button" role="tab" aria-controls="info" aria-selected="true">@lang('User Information')</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="collection-tab" data-bs-toggle="tab" data-bs-target="#collection" type="button" role="tab" aria-controls="collection" aria-selected="false">@lang('Collection Information')</button>
                    </li>
                </ul>
                <div class="tab-content mt-3" id="userDetailTabsContent">
                    <!-- User Information Tab -->
                    <div class="tab-pane fade show active" id="info" role="tabpanel" aria-labelledby="info-tab">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title mb-0">@lang('Information of') {{$user->fullname}}</h5>
                            </div>
                            <div class="card-body">
                                <form action="{{route('admin.users.update',[$user->id])}}" method="POST" enctype="multipart/form-data">
                                    @csrf
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>@lang('First Name')</label>
                                                <input class="form-control" type="text" name="firstname" required value="{{$user->firstname}}">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="form-control-label">@lang('Last Name')</label>
                                                <input class="form-control" type="text" name="lastname" required value="{{$user->lastname}}">
                                            </div>
                                        </div>
                                    </div>
                                    <!-- ... other fields ... -->
                                    <div class="row mt-4">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <button type="submit" class="btn btn--primary w-100 h-45">@lang('Submit')</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <!-- Collection Information Tab -->
                    <div class="tab-pane fade" id="collection" role="tabpanel" aria-labelledby="collection-tab">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title mb-0">@lang('Collection Information')</h5>
                            </div>
                            <div class="card-body p-0">
                                <div class="table-responsive--sm table-responsive">
                                    <table class="table table--light">
                                        <thead>
                                            <tr>
                                                <th>@lang('Full Name')</th>
                                                <th>@lang('Bank Name')</th>
                                                <th>@lang('Account Number')</th>
                                                <th>@lang('IFSC')</th>
                                                <th>@lang('Submitted At')</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @forelse($collectionInfos as $info)
                                            <tr>
                                                <td>{{ $info->data['full_name'] ?? 'N/A' }}</td>
                                                <td>{{ $info->data['bank_name'] ?? 'N/A' }}</td>
                                                <td>{{ $info->data['account_number'] ?? 'N/A' }}</td>
                                                <td>{{ $info->data['ifsc'] ?? 'N/A' }}</td>
                                                <td>{{ $info->created_at->format('d M Y, H:i') }}</td>
                                            </tr>
                                            @empty
                                            <tr>
                                                <td colspan="5" class="text-center">@lang('No collection information found')</td>
                                            </tr>
                                            @endforelse
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Add/Subtract Balance Modal -->
    <div id="addSubModal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"><span class="type"></span> <span>@lang('Balance')</span></h5>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="las la-times"></i>
                    </button>
                </div>
                <form action="{{route('admin.users.add.sub.balance',$user->id)}}" method="POST">
                    @csrf
                    <input type="hidden" name="act">
                    <div class="modal-body">
                        <div class="form-group">
                            <label>@lang('Amount')</label>
                            <div class="input-group">
                                <input type="number" step="any" name="amount" class="form-control" placeholder="@lang('Please provide positive amount')" required>
                                <div class="input-group-text">{{ __($general->cur_text) }}</div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>@lang('Remark')</label>
                            <textarea class="form-control" placeholder="@lang('Remark')" name="remark" rows="4" required></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn--primary h-45 w-100" id="addSubSubmitBtn">
                            <span class="submit-text">@lang('Submit')</span>
                            <span class="spinner-border spinner-border-sm d-none" role="status" aria-hidden="true" id="addSubSpinner"></span>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Update Score Modal for Sub-Admins -->
    @if(auth('admin')->user()->isSubAdmin == 1)
    <div id="updateScoreModal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">@lang('Update Score')</h5>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="las la-times"></i>
                    </button>
                </div>
                <form action="{{route('admin.users.update.score',$user->id)}}" method="POST" id="updateScoreForm">
                    @csrf
                    <div class="modal-body">
                        <div class="form-group">
                            <label>@lang('Score')</label>
                            <input type="number" name="score" class="form-control" placeholder="@lang('Enter new score')" value="{{ $user->score }}" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn--success h-45 w-100" id="updateScoreSubmitBtn">
                            <span class="submit-text">@lang('Submit')</span>
                            <span class="spinner-border spinner-border-sm d-none" role="status" aria-hidden="true" id="updateScoreSpinner"></span>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    @endif

    <!-- User Status Modal -->
    <div id="userStatusModal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">
                        @if($user->status == Status::USER_ACTIVE)
                        <span>@lang('Ban User')</span>
                        @else
                        <span>@lang('Unban User')</span>
                        @endif
                    </h5>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="las la-times"></i>
                    </button>
                </div>
                <form action="{{route('admin.users.status',$user->id)}}" method="POST" id="userStatusForm">
                    @csrf
                    <div class="modal-body">
                        @if($user->status == Status::USER_ACTIVE)
                        <h6 class="mb-2">@lang('If you ban this user he/she won\'t able to access his/her dashboard.')</h6>
                        <div class="form-group">
                            <label>@lang('Reason')</label>
                            <textarea class="form-control" name="reason" rows="4" required></textarea>
                        </div>
                        @else
                        <p><span>@lang('Ban reason was'):</span></p>
                        <p>{{ $user->ban_reason }}</p>
                        <h4 class="text-center mt-3">@lang('Are you sure to unban this user?')</h4>
                        @endif
                    </div>
                    <div class="modal-footer">
                        @if($user->status == Status::USER_ACTIVE)
                        <button type="submit" class="btn btn--primary h-45 w-100" id="userStatusSubmitBtn">
                            <span class="submit-text">@lang('Submit')</span>
                            <span class="spinner-border spinner-border-sm d-none" role="status" aria-hidden="true" id="userStatusSpinner"></span>
                        </button>
                        @else
                        <button type="button" class="btn btn--dark" data-bs-dismiss="modal">@lang('No')</button>
                        <button type="submit" class="btn btn--primary" id="userStatusConfirmBtn">
                            <span class="submit-text">@lang('Yes')</span>
                            <span class="spinner-border spinner-border-sm d-none" role="status" aria-hidden="true" id="userStatusConfirmSpinner"></span>
                        </button>
                        @endif
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection

@push('script')
<script>
    (function($){
        "use strict";
        $('.bal-btn').click(function(){
            var act = $(this).data('act');
            $('#addSubModal').find('input[name=act]').val(act);
            if (act == 'add') {
                $('.type').text('Add');
            } else {
                $('.type').text('Subtract');
            }
        });

        let mobileElement = $('.mobile-code');
        $('select[name=country]').change(function(){
            mobileElement.text(`+${$('select[name=country] :selected').data('mobile_code')}`);
        });

        $('select[name=country]').val('{{@$user->country_code}}');
        let dialCode = $('select[name=country] :selected').data('mobile_code');
        let mobileNumber = `{{ $user->mobile }}`;
        mobileNumber = mobileNumber.replace(dialCode,'');
        $('input[name=mobile]').val(mobileNumber);
        mobileElement.text(`+${dialCode}`);

        // Handle form submissions with loader
        function handleFormSubmit(formId, submitBtnId, spinnerId) {
            $(formId).submit(function(e) {
                e.preventDefault();
                console.log(`${formId} submitted`);

                // Show loader and disable button
                $(submitBtnId).prop('disabled', true);
                $(spinnerId).removeClass('d-none');
                $(`${submitBtnId} .submit-text`).addClass('d-none');
                console.log(`Showing loader for ${formId}`);

                $.ajax({
                    url: $(this).attr('action'),
                    type: 'POST',
                    data: $(this).serialize(),
                    success: function(response) {
                        console.log(`AJAX success for ${formId}:`, response);
                        if (response.success) {
                            alert(response.message);
                            location.reload(); // Reload the page to reflect updated data
                        } else {
                            alert(response.message);
                        }
                    },
                    error: function(xhr) {
                        console.log(`AJAX error for ${formId}:`, xhr);
                        var errors = xhr.responseJSON.errors;
                        if (errors) {
                            var errorMsg = Object.values(errors).flat().join('\n');
                            alert(errorMsg);
                        } else {
                            alert('An error occurred while submitting the form.');
                        }
                    },
                    complete: function() {
                        console.log(`AJAX complete for ${formId}, closing modal`);
                        // Hide loader and re-enable button
                        $(submitBtnId).prop('disabled', false);
                        $(spinnerId).addClass('d-none');
                        $(`${submitBtnId} .submit-text`).removeClass('d-none');
                        console.log(`Hiding loader for ${formId}`);

                        // Close the modal
                        $(formId).closest('.modal').modal('hide');
                        $('body').removeClass('modal-open');
                        $('.modal-backdrop').remove();
                        $('body').css('padding-right', '');
                    }
                });
            });
        }

    
        $('.modal').on('hidden.bs.modal', function () {
            console.log("Modal hidden event triggered");
            $('body').removeClass('modal-open');
            $('.modal-backdrop').remove();
            $('body').css('padding-right', '');
            $(this).removeData('bs.modal');
            $(this).css('display', 'none');
        });

        $('.modal').on('show.bs.modal', function () {
            console.log("Modal show event triggered");
            $(this).css('display', 'block');
        });

        $(document).on('click', function() {
            if ($('.modal-backdrop').length > 0 && !$('.modal').hasClass('show')) {
                console.log("Backdrop found but modal not visible, removing backdrop");
                $('.modal-backdrop').remove();
                $('body').removeClass('modal-open');
                $('body').css('padding-right', '');
            }
        });
    })(jQuery);
</script>
@endpush

@push('style')
    <style>
        .bg--success-2 { background-color: #0d5e31; }
        .bg--danger-2 { background: #a9271e; }
        .bg--purple { background-color: #6f42c1; color: black; }
        .btn--purple { background-color: #6f42c1; border-color: #6f42c1; }
        .btn--purple:hover { background-color: #403b47; border-color: #563d7c; }
        .copyLink { cursor: pointer; }

        .modal-content .form-control {
            background-color: #fff;
            color: #333;
        }
        .modal-content .form-control:focus {
            background-color: #fff;
            color: #333;
        }
    </style>
@endpush
