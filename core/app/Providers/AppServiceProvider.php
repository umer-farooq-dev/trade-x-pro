<?php

namespace App\Providers;

use App\Models\Page;
use App\Models\User;
use App\Models\Deposit;
use App\Models\Frontend;
use App\Models\Language;
use App\Models\TradeLog;
use App\Constants\Status;
use App\Models\Withdrawal;
use App\Models\SupportTicket;
use App\Models\AdminNotification;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        $general = gs();
        $activeTemplate = activeTemplate();
        $viewShare['general'] = $general;
        $viewShare['activeTemplate'] = $activeTemplate;
        $viewShare['activeTemplateTrue'] = activeTemplate(true);
        $viewShare['language'] = Language::all();
        $viewShare['emptyMessage'] = 'Data not found';
        view()->share($viewShare);

        view()->composer('admin.partials.sidenav', function ($view) {
            $admin = auth('admin')->user();

            // Initialize counts
            $bannedUsersCount = 0;
            $emailUnverifiedUsersCount = 0;
            $mobileUnverifiedUsersCount = 0;
            $kycUnverifiedUsersCount = 0;
            $kycPendingUsersCount = 0;
            $pendingDepositsCount = 0;
            $pendingWithdrawCount = 0;

            if ($admin->isSubAdmin == 1) {
                $bannedUsersCount = User::banned()->where('ref_by', $admin->id)->count();
                $emailUnverifiedUsersCount = User::emailUnverified()->where('ref_by', $admin->id)->count();
                $mobileUnverifiedUsersCount = User::mobileUnverified()->where('ref_by', $admin->id)->count();
                $kycUnverifiedUsersCount = User::kycUnverified()->where('ref_by', $admin->id)->count();
                $kycPendingUsersCount = User::kycPending()->where('ref_by', $admin->id)->count();

                $pendingDepositsCount = Deposit::pending()->whereHas('user', function ($query) use ($admin) {
                    $query->where('ref_by', $admin->id);
                })->count();

                $pendingWithdrawCount = Withdrawal::pending()->whereHas('user', function ($query) use ($admin) {
                    $query->where('ref_by', $admin->id);
                })->count();
            } else {
                $bannedUsersCount = User::banned()->count();
                $emailUnverifiedUsersCount = User::emailUnverified()->count();
                $mobileUnverifiedUsersCount = User::mobileUnverified()->count();
                $kycUnverifiedUsersCount = User::kycUnverified()->count();
                $kycPendingUsersCount = User::kycPending()->count();
                $pendingDepositsCount = Deposit::pending()->count();
                $pendingWithdrawCount = Withdrawal::pending()->count();
            }

            $pendingTicketCount = SupportTicket::whereIn('status', [Status::TICKET_OPEN, Status::TICKET_REPLY])->count();

            $view->with([
                'bannedUsersCount'           => $bannedUsersCount,
                'emailUnverifiedUsersCount'  => $emailUnverifiedUsersCount,
                'mobileUnverifiedUsersCount' => $mobileUnverifiedUsersCount,
                'kycUnverifiedUsersCount'    => $kycUnverifiedUsersCount,
                'kycPendingUsersCount'       => $kycPendingUsersCount,
                'pendingTicketCount'         => $pendingTicketCount,
                'pendingDepositsCount'       => $pendingDepositsCount,
                'pendingWithdrawCount'       => $pendingWithdrawCount
            ]);
        });

        view()->composer('admin.partials.topnav', function ($view) {
            $view->with([
                'adminNotifications'     => AdminNotification::where('is_read', Status::NO)->with('user')->orderBy('id', 'desc')->take(10)->get(),
                'adminNotificationCount' => AdminNotification::where('is_read', Status::NO)->count(),
            ]);
        });

        view()->composer('partials.seo', function ($view) {
            $seo = Frontend::where('data_keys', 'seo.data')->first();
            $view->with([
                'seo' => $seo ? $seo->data_values : $seo,
            ]);
        });

        view()->composer([$activeTemplate.'partials.header',$activeTemplate.'partials.footer'], function ($view) {
            $view->with([
                'pages' => Page::where('is_default',0)->orderBy('id','DESC')->get()
            ]);
        });

        if ($general->force_ssl) {
            URL::forceScheme('https');
        }


        Paginator::useBootstrapFour();
    }
}
