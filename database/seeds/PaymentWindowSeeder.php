<?php

use App\Model\PaymentWindow;
use Illuminate\Database\Seeder;

class PaymentWindowSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        PaymentWindow::firstOrCreate(['payment_time' => 10],['status' => STATUS_ACTIVE]);
        PaymentWindow::firstOrCreate(['payment_time' => 15],['status' => STATUS_ACTIVE]);
        PaymentWindow::firstOrCreate(['payment_time' => 20],['status' => STATUS_ACTIVE]);
        PaymentWindow::firstOrCreate(['payment_time' => 25],['status' => STATUS_ACTIVE]);
        PaymentWindow::firstOrCreate(['payment_time' => 30],['status' => STATUS_ACTIVE]);
        PaymentWindow::firstOrCreate(['payment_time' => 35],['status' => STATUS_ACTIVE]);
        PaymentWindow::firstOrCreate(['payment_time' => 40],['status' => STATUS_ACTIVE]);
    }
}
