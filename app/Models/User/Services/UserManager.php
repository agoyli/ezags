<?php


namespace App\Models\User\Services;


use App\Models\User;
use Illuminate\Support\Facades\Mail;

class UserManager
{
    public function sendCreds(User $user)
    {
        Mail::send('email.hello', ['user' => $user], function ($m) use ($user) {
            $m->subject('Hello!');
            $m->to($user->email);
        });
    }
}
