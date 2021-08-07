<?php


namespace App\Models\Human\UseCases\CreateByChildrenService;


use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;

class FormHandler
{
    private $handler;

    public function __construct(Handler $handler)
    {
        $this->handler = $handler;
    }

    public function handle(Request $request)
    {
        try {
            try {
                $human = $this->handler->handle($request);
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
            ->route('children_service.list')
            ->with('success', 'Üstünlikli döredildi.');
    }
}
