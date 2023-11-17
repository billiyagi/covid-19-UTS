<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PartialAddress extends Model
{
    use HasFactory;

    protected $table = 'partial_address';

    protected $guarded = ['id'];

    public $timestamps = true;
}
