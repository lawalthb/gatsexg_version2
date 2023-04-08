<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUserPaymentMethodsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user_payment_methods', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('user_id')->nullable();
            $table->string('user_name')->nullable();
            $table->unsignedBigInteger('payment_method_id')->nullable();
            $table->tinyInteger('payment_type')->nullable();
            $table->string('payment_method_name')->nullable();
            $table->string('bank_name')->nullable();
            $table->string('bank_account_number')->unique()->nullable();
            $table->string('bank_opening_branch_name')->nullable();
            $table->string('transaction_reference')->nullable();
            $table->string('mobile_account_number')->unique()->nullable();
            $table->string('card_number')->unique()->nullable();
            $table->string('card_type')->nullable();
            $table->tinyInteger('status')->default(1);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('user_payment_methods');
    }
}
