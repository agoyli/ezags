<?php


namespace App\Http\Controllers;


use App\Models\Human;
use App\Models\User;

class ChildrenServiceController
{
    public function list()
    {
        $user = auth()->user();
        if (!$user->hasRole(User::ROLE_CHILDREN_SERVICE))
            abort(403, 'You are not children service');
        $qb = Human::query();

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
