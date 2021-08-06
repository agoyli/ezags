<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Human extends Model
{
    use HasFactory;

    const STATUS_BIRTH = 'birth';
    const STATUS_NEW_NAME = 'new-name';
    const STATUS_CHECK = 'check';

    const STATUS_CHILD = 'child';
    const STATUS_ORPHAN = 'orphan';
    const STATUS_PARENT = 'parent';

    protected $casts = [
        'birthday' => 'date',
    ];


    public static function statuses()
    {
        return [
            self::STATUS_BIRTH,
            self::STATUS_NEW_NAME,
            self::STATUS_CHECK,
            self::STATUS_CHILD,
            self::STATUS_ORPHAN,
            self::STATUS_PARENT,
        ];
    }



    public static function genders()
    {
        return array_merge(self::maleGenders(), self::femaleGenders());
    }

    public static function maleGenders()
    {
        return [
            0,
            2,
            4,
            6,
            8,
        ];
    }

    public static function femaleGenders()
    {
        return [
            1,
            3,
            5,
            7,
            9,
        ];
    }

    public function number()
    {
        return $this->birthday->year .'_'. sprintf('%08d', $this->id);
    }

    public function mother()
    {
        return $this->belongsTo(self::class, 'mother_id');
    }

    public function father()
    {
        return $this->belongsTo(self::class, 'father_id');
    }

    public function getFullNameAttribute()
    {
        return $this->last_name .' '. $this->first_name .' '. $this->middle_name;
    }
}
