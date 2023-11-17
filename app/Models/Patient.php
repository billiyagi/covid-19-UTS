<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Patient extends Model
{
    use HasFactory;

    protected $table = 'patients';

    protected $guarded = ['id', 'created_at', 'updated_at'];

    public $timestamps = true;


    public function hospital(): HasOne
    {
        return $this->hasOne(Hospital::class, 'id', 'hospital_id');
    }
}
