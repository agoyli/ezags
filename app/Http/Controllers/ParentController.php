<?php


namespace App\Http\Controllers;


use App\Models\Human;
use App\Models\User;

class ParentController
{
    public function list()
    {
        $user = auth()->user();
        if (!$user->hasRole(User::ROLE_PARENT))
            abort(403, 'You are not parent');
        $qb = $user->human->children()->latest('id');

        return view('app.parent.list', [
            'humans' => $qb->paginate(12),
        ]);
    }

    public function edit(Human $human)
    {
        return view('app.parent.edit', [
            'human' => $human,
        ]);
    }

    public function update(Human $human)
    {

    }
}
