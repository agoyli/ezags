<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Document extends Model
{
    use HasFactory;

    protected $casts = [
        'date' => 'date',
        'files' => 'array',
    ];

    const TYPE_PASSPORT = 'passport';
    const TYPE_JUDGEMENT = 'judgment';
    const TYPE_MEDICAL_CLEARANCE = 'medical-clearance';

    public static function types()
    {
        return [
            self::TYPE_PASSPORT,
            self::TYPE_JUDGEMENT,
            self::TYPE_MEDICAL_CLEARANCE,
        ];
    }

    public function human()
    {
        return $this->belongsTo(Human::class, 'human_id');
    }
}
