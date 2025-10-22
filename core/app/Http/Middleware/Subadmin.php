<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class Subadmin
{
    public function handle(Request $request, Closure $next)
    {
        if (!Auth::guard('subadmin')->check()) {
            return redirect()->route('subadmin.login');
        }

        return $next($request);
    }
}
