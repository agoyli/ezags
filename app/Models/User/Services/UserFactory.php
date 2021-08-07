<?php


namespace App\Models\User\Services;


use App\Models\Human;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class UserFactory
{
    public function create(array $data, Human $human = null): User
    {
        $passwordPlain = Str::random(8);
        $user = new User();
        $user->password = Hash::make($passwordPlain);
        $user->password_plain = $passwordPlain;
        if ($human) {
            $user->human()->associate($human);
            $user->name = $human->full_name;
        }
        $user->email = $data['email'];
        $user->save();
        return $user;
    }
}
