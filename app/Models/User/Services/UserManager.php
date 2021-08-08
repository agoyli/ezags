<?php


namespace App\Models\User\Services;


use App\Models\Human;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;

class UserManager
{
    public function sendCreds(User $user)
    {
        Mail::send('email.hello', ['user' => $user], function ($m) use ($user) {
            $m->subject('Salam!');
            $m->to($user->email);
        });
    }

    public function sendNewChild(User $user, Human $child)
    {
        Mail::send('email.new_child', ['user' => $user, 'human' => $child], function ($m) use ($user) {
            $m->subject('Buşluk!');
            $m->to($user->email);
        });
    }

    public function updateFields(User $user, array $data): void
    {
        $user->email = $data['email'];
        $user->save();
    }
}
