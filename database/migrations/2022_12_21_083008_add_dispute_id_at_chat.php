<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddDisputeIdAtChat extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('chats', function (Blueprint $table) {
            $table->bigInteger('dispute_id')->nullable()->after('order_id');
        });

        Schema::table('order_disputes', function (Blueprint $table) {
            $table->bigInteger('assigned_admin')->nullable()->after('updated_by');
            $table->dateTime('expired_at')->nullable()->after('updated_by');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('chats', function (Blueprint $table) {
            //
        });
        Schema::table('order_disputes', function (Blueprint $table) {
            //
        });
    }
}
