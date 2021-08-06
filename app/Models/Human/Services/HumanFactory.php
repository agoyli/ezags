<?php


namespace App\Models\Human\Services;


use App\Models\Human;

class HumanFactory
{
    public function create(array $data, string $status = Human::STATUS_BIRTH): Human
    {
        $human = new Human();
        $human->birthday = $data['birthday'];
        $human->gender = $data['gender'];
        $human->status = $status;
        if (isset($data['passport'])) {
            if (Human::query()
                    ->where('passport', $data['passport'])
                    ->count() > 0) throw new \DomainException('Passport is already exists');
            $human->passport = $data['passport'];
        }
        $human->save();
        return $human;
    }
}
