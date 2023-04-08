<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddKycToBuySell extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('buys', function (Blueprint $table) {
            $table->decimal('holding_amount',19,8)->default(0)->after('status');
            $table->tinyInteger('kyc_completed')->default(0)->after('status');
            $table->integer('registered_days')->default(0)->after('status');
            $table->integer('payment_time_limit')->nullable()->after('status');
            $table->decimal('sold_amount',19,8)->default(0)->unsigned()->after('status');
            $table->decimal('amount',19,8)->default(0)->unsigned()->after('status');
        });
        Schema::table('sells', function (Blueprint $table) {
            $table->decimal('holding_amount',19,8)->default(0)->after('status');
            $table->tinyInteger('kyc_completed')->default(0)->after('status');
            $table->integer('registered_days')->default(0)->after('status');
            $table->integer('payment_time_limit')->nullable()->after('status');
            $table->decimal('sold_amount',19,8)->default(0)->unsigned()->after('status');
            $table->decimal('amount',19,8)->default(0)->unsigned()->after('status');
        });

        Schema::table('orders', function (Blueprint $table) {
            $table->bigInteger('who_opened')->nullable()->after('status');
            $table->bigInteger('who_cancelled')->nullable()->after('status');
            $table->tinyInteger('is_success')->default(0)->after('status');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('buys', function (Blueprint $table) {
            //
        });
    }
}
