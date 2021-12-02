<?php


namespace App\Http\Controllers;


use App\Models\Human;
use App\Models\User;
use Illuminate\Http\Request;

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
        if ($human->isStatusNewNameExpired())
            return redirect()->route('parent.list')
                ->with('warning', $human->number().' Çagaňyza at dakmak üçin berilen wagt gutardy, adminstrator bilen habarlaşyň.');
        if ($human->status !== Human::STATUS_NEW_NAME)
            return redirect()->route('parent.list')->with('warning', $human->number().' Çagaňyza at dakmak prosesinde däl');
        return view('app.parent.edit', [
            'human' => $human,
        ]);
    }

    public function update(Human $human, Request $request)
    {
        if ($human->isStatusNewNameExpired())
            return redirect()->route('parent.list')
                ->with('warning', $human->number().' Çagaňyza at dakmak üçin berilen wagt gutardy, adminstrator bilen habarlaşyň.');
        if ($human->status !== Human::STATUS_NEW_NAME)
            return redirect()->route('parent.list')->with('warning', $human->number().' Çagaňyza at dakmak prosesinde däl');

        $data = $request->validate([
            'first_name' => ['required', 'min:2'],
        ]);
        $human->first_name = $data['first_name'];
        $human->status = Human::STATUS_CHECK;
        $human->save();
        return redirect()->route('parent.list',['human' => $human])
            ->with('success','Çagaňyzyň täze "'.$data['first_name'].'" ady bilen gutlaýarys!');

    }
}
