<?php


namespace App\Models\Human\Services;


use App\Models\Human;

class HumanManager
{
    public function updateFields(Human $human, array $data): void
    {
        if (isset($data['first_name'])) { $human->first_name = $data['first_name']; }
        if (isset($data['last_name'])) { $human->last_name = $data['last_name']; }
        if (isset($data['middle_name'])) { $human->middle_name = $data['middle_name']; }
        $human->save();
    }
}
