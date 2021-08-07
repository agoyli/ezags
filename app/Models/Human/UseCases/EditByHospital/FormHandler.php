<?php


namespace App\Models\Human\UseCases\EditByHospital;


use App\Models\Human;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;

class FormHandler
{
    private $handler;

    public function __construct(Handler $handler)
    {
        $this->handler = $handler;
    }

    public function handle(Request $request, Human $human)
    {
        try {
            try {
                $human = $this->handler->handle($request, $human);
            } catch (ValidationException $exception) {
                return redirect()
                    ->back()
                    ->withErrors($exception->errors())
                    ->withInput();
            }
        } catch (\DomainException $exception) {
            return redirect()
                ->back()
                ->with('danger', $exception->getMessage())
                ->withInput();
        }
        return redirect()
            ->route('human.edit', ['human' => $human])
            ->with('success', 'Üstünlikli täzelendi.');
    }
}
