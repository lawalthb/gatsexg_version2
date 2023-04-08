<?php

namespace App\Jobs;

use App\Repository\AffiliateRepository;
use App\Services\Logger;
use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;

class DistributeTradeReferralBonus implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    private $transaction;
    private $userId;
    private $logger;
    public function __construct($transaction,$userId)
    {
        $this->transaction = $transaction;
        $this->logger = new Logger();
        $this->userId = $userId;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        $this->logger->log('DistributeTradeReferralBonus', 'called');
        $this->logger->log('DistributeTradeReferralBonus for user ', $this->userId);
        $repo = new AffiliateRepository();
        $repo->storeTradeAffiliationHistory($this->transaction,$this->userId);
        $this->logger->log('DistributeTradeReferralBonus', 'executed');
    }
}
