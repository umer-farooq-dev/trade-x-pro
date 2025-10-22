<header class="header-section">
    <div class="header-top bg--section">
        <div class="container">
            <ul class="header-top-area">
                <li class="me-auto">
                    @if($general->multi_language)
                    <div class="select-bar">
                        <select class="langSel">
                            @foreach($language as $item)
                            <option value="{{$item->code}}" @selected(session('lang')==$item->code)>
                                {{__($item->name) }}
                            </option>
                            @endforeach
                        </select>
                    </div>
                    @endif
                </li>
                <li class="dashboard-dashboard-icon">
                    <div class="avatar" id="floatingBtn">
                        <span>{{ strtoupper(substr(auth()->user()->username, 0, 2)) }}</span>
                    </div>
                    <!-- Floating Card -->
                    <div class="floating-card" id="floatingCard">
                        <div class="card-content">
                            <div class="user-info">
                                <div class="avatar">
                                    <span>{{ strtoupper(substr(auth()->user()->username, 0, 2)) }}</span>
                                </div>
                                <div class="info-details">
                                    <p class="email">{{ auth()->user()->email }}</p>
                                    <p class="uid">@lang('UID'): {{ auth()->user()->id }}</p>
                                    <p class="credit-score">@lang('Credit Score'): {{ auth()->user()->score }}</p>
                                    <p class="balance">@lang('Available Balance'): {{ showAmount(auth()->user()->balance) }} {{ $general->cur_text }}</p>
                                </div>
                            </div>
                            <ul class="nav-links">
                                <li>
                                    <a href="{{ route('ticket.index') }}">@lang('Support Ticket')</a>
                                </li>
                                <li>
                                    <a href="{{ route('user.profile.setting') }}">@lang('Profile Setting')</a>
                                </li>
                                <li>
                                    <a href="{{ route('user.change.password') }}">@lang('Change Password')</a>
                                </li>
                                <li>
                                    <a href="{{ route('user.twofactor') }}">@lang('2FA Security')</a>
                                </li>
                                <li>
                                    <a href="#" id="collectionInfoBtn">@lang('Collection Information')</a>
                                </li>
                                <li>
                                    <a href="{{ route('user.logout') }}">@lang('Logout')</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <div class="header-bottom">
        <div class="container">
            <div class="header-wrapper">
                <div class="logo">
                    <a href="{{ route('home') }}">
                        <img src="{{getImage(getFilePath('logoIcon') .'/logo.png')}}">
                    </a>
                </div>
                <ul class="menu">
                    <li>
                        <a href="{{route('user.home')}}" class="{{ request()->routeIs('user.home') ? 'active' : '' }}">@lang('Dashboard')</a>
                    </li>
                    <li>
                        <a href="javascript:void(0)" class="{{ request()->routeIs('user.trade*') ? 'active' : '' }}">@lang('Trade')</a>
                        <ul class="submenu">
                            <li>
                                <a href="{{ route('user.trade.now', ['name' => 'Bitcoin']) }}">@lang('Trade Now')</a>
                            </li>
                            <li>
                                <a href="{{route('user.trade.log')}}">@lang('Trade Log')</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:void(0)" class="{{ menuActive('user.deposit*') }}">@lang('Deposit')</a>
                        <ul class="submenu">
                            <li>
                                <a href="{{route('user.deposit.index')}}">@lang('Deposit Money')</a>
                            </li>
                            <li>
                                <a href="{{route('user.deposit.history')}}">@lang('Deposit History')</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="{{route('user.withdraw')}}" class="{{ request()->routeIs('user.withdraw*') ? 'active' : '' }}">@lang('Withdraw')</a>
                    </li>
                    <li>
                        <a href="#" id="collectionInfoMenuBtn" class="{{ request()->routeIs(['user.referral.log', 'user.commissions.log']) ? 'active' : '' }}">@lang('Collection Information')</a>
                    </li>
                    <li>
                        <a href="{{route('user.transactions')}}" class="{{ request()->routeIs('user.transactions') ? 'active' : '' }}">@lang('Transaction Log')</a>
                    </li>
                </ul>
                <div class="header-bar m-0">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>
        </div>
    </div>

    <!-- Collection Information Popup -->
    <div class="modal fade" id="collectionInfoModal" tabindex="-1" role="dialog" aria-labelledby="collectionInfoModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="collectionInfoModalLabel">@lang('Submit Collection Information')</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="collectionInfoForm">
                        @csrf
                        <div class="form-group mb-3">
                            <label for="fullName" class="form-label">@lang('Name (Full)')</label>
                            <input type="text" class="form-control" id="fullName" name="full_name" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="bankName" class="form-label">@lang('Bank Name')</label>
                            <input type="text" class="form-control" id="bankName" name="bank_name" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="accountNumber" class="form-label">@lang('Account Number')</label>
                            <input type="text" class="form-control" id="accountNumber" name="account_number" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="ifsc" class="form-label">@lang('IFSC')</label>
                            <input type="text" class="form-control" id="ifsc" name="ifsc" required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">@lang('Submit')</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</header>

@push('style')
<style>
    .dashboard-dashboard-icon {
        position: relative;
    }

    .floating-card {
        position: absolute;
        top: 60px;
        right: 0;
        width: 300px;
        background: rgb(7, 7, 7);
        border-radius: 10px;
        box-shadow: 0 4px 15px rgba(236, 234, 234, 0.2);
        z-index: 1000;
        display: none;
    }

    .floating-card .card-content {
        padding: 15px;
    }

    .floating-card .user-info {
        display: flex;
        align-items: center;
        margin-bottom: 15px;
    }

    .floating-card .user-info .avatar {
        width: 40px;
        height: 40px;
        background: linear-gradient(135deg, #1e90ff, #00bfff);
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        font-size: 16px;
        font-weight: bold;
        margin-right: 10px;
    }

    .floating-card .info-details {
        flex: 1;
    }

    .floating-card .info-details p {
        margin: 0;
        font-size: 14px;
        color: #f7f7f7;
    }

    .floating-card .info-details .email {
        font-weight: bold;
        font-size: 16px;
    }

    .floating-card .info-details .credit-score {
        color: #ffd700;
        font-weight: bold;
    }

    .floating-card .nav-links {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .floating-card .nav-links li {
        margin-bottom: 10px;
    }

    .floating-card .nav-links li a {
        color: #f5f3f3;
        text-decoration: none;
        font-size: 14px;
        display: block;
        padding: 5px 0;
    }

    .floating-card .nav-links li a:hover {
        color: #{{ $general->base_color }};
    }

    /* Modal Styles */
    .modal-content {
        background-color: #fff;
        border-radius: 15px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
    }

    .modal-header {
        background-color: #{{ $general->base_color }};
        color: #fff;
        border-top-left-radius: 15px;
        border-top-right-radius: 15px;
        border-bottom: none;
        padding: 15px 20px;
    }

    .modal-title {
        font-size: 1.25rem;
        font-weight: 600;
    }

    .modal-body {
        padding: 20px;
    }

    .form-group {
        margin-bottom: 15px;
    }

    .form-group label {
        font-weight: 600;
        margin-bottom: 5px;
        display: block;
        color: #333;
    }

    .form-group input {
        width: 100%;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
        font-size: 14px;
        transition: border-color 0.3s;
    }

    .form-group input:focus {
        background-color: #fff;
        color: #333;
        border-color: #{{ $general->base_color }};
        outline: none;
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);

    }

    .btn-primary {
        background-color: #{{ $general->base_color }};
        border: none;
        padding: 12px;
        font-size: 16px;
        border-radius: 5px;
        transition: background-color 0.3s;
    }

    .btn-primary:hover {
        background-color: #{{ $general->base_color }};
        opacity: 0.9;
    }

    .modal-backdrop {
        z-index: 1040 !important;
    }

    .modal {
        z-index: 1050 !important;
    }
</style>
@endpush

@push('script')
@push('script')
<script>
    (function($) {
        "use strict";
        console.log("Header script loaded");

        $('#floatingBtn').click(function(e) {
            e.stopPropagation();
            $('#floatingCard').slideToggle('fast');
            console.log("Floating card toggled");
        });

        $(document).click(function(event) {
            if (!$(event.target).closest('#floatingBtn, #floatingCard').length) {
                $('#floatingCard').slideUp('fast');
                console.log("Floating card closed");
            }
        });

        $('#collectionInfoBtn, #collectionInfoMenuBtn').click(function(e) {
            e.preventDefault();
            console.log("Opening modal");
            $('#collectionInfoModal').modal('show');
        });

        // Handle Form Submission
        $('#collectionInfoForm').submit(function(e) {
            e.preventDefault();
            console.log("Form submitted");

            // Serialize form data
            var formData = $(this).serialize();
            console.log("Form data:", formData);

            $.ajax({
                url: '{{ route("user.collection.info.submit") }}',
                type: 'POST',
                data: formData,
                success: function(response) {
                    console.log("AJAX success:", response);
                    if (response.success) {
                        alert(response.message);
                        $('#collectionInfoModal').modal('hide');
                    } else {
                        alert(response.message);
                    }
                },
                error: function(xhr) {
                    console.log("AJAX error:", xhr);
                    var errors = xhr.responseJSON.errors;
                    if (errors) {
                        var errorMsg = Object.values(errors).flat().join('\n');
                        alert(errorMsg);
                    } else {
                        alert('An error occurred while submitting the form.');
                    }
                },
                complete: function() {
                    console.log("AJAX complete, closing modal");
                    $('#collectionInfoModal').modal('hide');
                    $('body').removeClass('modal-open');
                    $('.modal-backdrop').remove();
                    $('body').css('padding-right', '');
                }
            });
        });

        // Ensure the modal backdrop and modal-open class are removed when the modal is hidden
        $('#collectionInfoModal').on('hidden.bs.modal', function () {
            console.log("Modal hidden event triggered");
            // Remove modal-open class from body
            $('body').removeClass('modal-open');
            // Remove all modal backdrops
            $('.modal-backdrop').remove();
            // Reset body padding
            $('body').css('padding-right', '');
            // Clear modal data to prevent lingering state
            $(this).removeData('bs.modal');
            // Ensure the modal is fully hidden
            $(this).css('display', 'none');
        });

        // Ensure the modal is shown when opened
        $('#collectionInfoModal').on('show.bs.modal', function () {
            console.log("Modal show event triggered");
            $(this).css('display', 'block');
        });

        // Handle manual close button click
        $('.btn-close, [data-bs-dismiss="modal"]').click(function() {
            console.log("Close button clicked");
            $('#collectionInfoModal').modal('hide');
        });

        // Debug backdrop removal on any click
        $(document).on('click', function() {
            if ($('.modal-backdrop').length > 0 && !$('#collectionInfoModal').hasClass('show')) {
                console.log("Backdrop found but modal not visible, removing backdrop");
                $('.modal-backdrop').remove();
                $('body').removeClass('modal-open');
                $('body').css('padding-right', '');
            }
        });
    })(jQuery);
</script>
@endpush
@endpush
