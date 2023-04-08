<?php

namespace App\Http\Middleware;

use Closure;

class CheckDemo
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if (env('APP_MODE') == 'demo') {
            return redirect()->back()->with(['dismiss' => __('Currently disable only for demo')]);
        }
        return $next($request);
    }
}
