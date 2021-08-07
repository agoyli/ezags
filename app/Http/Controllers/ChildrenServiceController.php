<?php


namespace App\Http\Controllers;


use App\Models\Human;
use App\Models\User;
use Illuminate\Http\Request;

class ChildrenServiceController
{
    public function list()
    {
        $user = auth()->user();
        if (!$user->hasRole(User::ROLE_CHILDREN_SERVICE))
            abort(403, 'You are not children service');
        $qb = Human::query()->isOrphan();

        return view('app.children_service.list', [
            'humans' => $qb->paginate(12),
        ]);
    }

    public function create()
    {
        return view('app.children_service.create');
    }

    public function store(Request $request, Human\UseCases\CreateByChildrenService\FormHandler $formHandler)
    {
        return $formHandler->handle($request);
    }

    public function edit(Human $human)
    {
        return view('app.children_service.edit', [
            'human' => $human,
        ]);
    }

    public function update(Human $human)
    {

    }
}
