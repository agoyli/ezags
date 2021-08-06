<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Human;

class HumanController
{
    public function list()
    {
        $qb = Human::query();

        return view('app.human.list', [
            'humans' => $qb->paginate(12),
        ]);
    }


    public function create()
    {
        return view('app.human.create', [
            'humans' => [],
        ]);
    }


    public function store(Request $request, Human\UseCases\CreateByHospital\FormHandler $formHandler)
    {
        return $formHandler->handle($request);
    }


    public function edit(Human $human)
    {
        return view('app.human.edit', [
            'human' => $human,
        ]);
    }


    public function update()
    {

    }



    public function find(Request $request)
    {
        $response = [];
        $passportNumber = $request->get('query');
        if (!$passportNumber) {
            abort(404);
        }
        $humans = Human::query()
            ->latest()
            ->where('passport', 'like', '%'.$passportNumber.'%')
            ->get();
        $response['data'] = $humans->unique('passport')->take(10);
        return response()->json($response);
    }
}
