<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use function Livewire\str;

class Human extends Model
{
    use HasFactory;

    const STATUS_BIRTH = 'birth';
    const STATUS_NEW_NAME = 'new-name';
    const STATUS_CHECK = 'check';

    const STATUS_CHILD = 'child';
    const STATUS_ORPHAN = 'orphan';
    const STATUS_PARENT = 'parent';

    const GENDER_MALE = 2;
    const GENDER_FEMALE = 1;

    protected $casts = [
        'birthday' => 'date',
    ];

    public static function genders()
    {
        return [
            self::GENDER_FEMALE,
            self::GENDER_MALE,
        ];
    }


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

    public static function getGenderText(string $gender)
    {
        if ($gender == self::GENDER_FEMALE)
            return 'Gyz';
        else
            return 'Oglan';
    }

    public function genderText()
    {
        return self::getGenderText($this->gender);
    }

    public function isGenderFemale()
    {
        return $this->gender === self::GENDER_FEMALE;
    }

    public function isGenderMale()
    {
        return $this->gender === self::GENDER_MALE;
    }

    public function user()
    {
        return $this->hasOne(User::class, 'human_id');
    }

    public static function getNewNumber(int $year = null): string
    {
        $year = $year ?? now()->year;
        $number = 1;
        $last = Human::query()->where('number', 'like', $year.'%')->latest()->first();
        if ($last) $number = (int)str_replace($year.'-', '', $last->number)+1;
        return $year.'-'.$number;
    }

    public function numberArray():array
    {
        $number = $this->number;
        $number = explode('-',$number);
        $number[1] = sprintf('%04d',$number[1]);
        return $number;
    }

    public function number(): string
    {
        $numbers = $this->numberArray();
        return $numbers[0].'-'.$numbers[1];
    }

    public function nin(): string
    {
        $number = $this->numberArray()[1];
        return $this->birthday->format("d.m.Y").$this->gender.$number;
    }

    public function mother()
    {
        return $this->belongsTo(self::class, 'mother_id');
    }

    public function father()
    {
        return $this->belongsTo(self::class, 'father_id');
    }

    public function children()
    {
        return $this->hasMany(self::class, 'father_id')
            ->orWhere('mother_id', $this->id);
    }

    public function getFullNameAttribute()
    {
        return $this->last_name .' '. $this->first_name .' '. $this->middle_name;
    }

    public function isStatusNewNameExpired()
    {
        return $this->updated_at->addHours(5)->isBefore(now());
    }

    public function updateMiddleName(bool $canBeNull = true, string $optionalFatherName = null)
    {
        if ($this->isGenderFemale()) $postfix = 'wna';
        else $postfix = 'wiç';
        $fatherName = $optionalFatherName ?? optional($this->father)->first_name;
        if (!$fatherName) {
            if ($canBeNull) $this->middle_name = null;
            else throw new \DomainException('Middle name will be empty');
        } else {
            if (in_array(strtolower(substr($fatherName, -1)), ['a', 'e', 'i', 'o', 'u', 'y', 'ä', 'ü', 'ö',]))
                $glue = 'ýe';
            else
                $glue = 'o';
            $this->middle_name = $fatherName.$glue.$postfix;
        }
        $this->save();
    }

    public function updateLastName(bool $canBeNull = true, string $optionalLastName = null)
    {
        if ($this->isGenderFemale()) $postfix = 'wa';
        else $postfix = 'w';
        $lastName = $optionalLastName ?? optional($this->father)->last_name;
        if (!$lastName) {
            if ($canBeNull) $this->last_name = null;
            else throw new \DomainException('Last name will be empty');
        } else {
            $this->last_name = $lastName;
        }
        $this->save();
    }
}
