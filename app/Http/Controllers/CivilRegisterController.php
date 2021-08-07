<?php


namespace App\Http\Controllers;


use App\Models\Human;
use App\Models\User;
use Illuminate\Http\Request;

class CivilRegisterController
{
    public function list()
    {
        $user = auth()->user();
        if (!$user->hasRole(User::ROLE_MARRIAGE_REGISTRY))
            abort(403, 'You are not civil register');
        $qb = Human::query()->statusCheck();

        return view('app.civil_register.list', [
            'humans' => $qb->paginate(12),
        ]);
    }

    public function edit(Human $human)
    {
        return view('app.civil_register.edit', [
            'human' => $human,
        ]);
    }

    public function update(Human $human, Request $request)
    {
        $data = $request->validate([
            'action' => ['required'],
            'note' => ['nullable'],
        ]);
        if ($data['action'] == 'accept') {
            $human->status = Human::STATUS_CHILD;
            $human->notes = null;
            $human->save();
        }
        else {
            $human->status = Human::STATUS_BIRTH;
            $human->notes = $data['note'];
            $human->save();
        }
        return redirect()->route('civil_register.list')
            ->with('success', $human->number().' çaga ýatda saklandy.');
    }
}
