<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Support\Facades\Log;
use App\Http\Services\TransactionService;

class Transfer implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    private $request ;
    public function __construct($request)
    {
        //
        $this->request = $request;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        try {
            $request = (array)$this->request;
            // Transaction
            Log::info(' transfer before call');
            $trans = new TransactionService();
            $response = $trans->transfer($request['wallet'],$request['username'],$request['amount'],'','',$request['user_id'],$request['message'] ?? '');
            log::info(' transfer called');
            log::info(json_encode($response));

        }
        catch(\Exception $e) {
            log::info($e->getMessage());
            return false;
        }
    }
}