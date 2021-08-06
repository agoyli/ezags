<?php


namespace App\Models\Human\UseCases\CreateByHospital;


use App\Models\CarCheck\Services\CarCheckManager;
use App\Models\Human;
use App\Models\Human\Services\HumanFactory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Validation\ValidationException;

class Handler
{
    private $humanFactory;
    private $humanManager;

    public function __construct(HumanFactory $humanFactory, Human\Services\HumanManager $humanManager)
    {
        $this->humanFactory = $humanFactory;
        $this->humanManager = $humanManager;
    }

    public function handle(Request $request): Human
    {
        $data = $this->validated($request->all());
        $human = $this->humanFactory->create($data);
        $this->handleParents($data, $human);
        return $human;
    }

    public function handleParent(array $data): Human
    {
        $parent = null;
        if (isset($data['id'])) $parent = Human::find($data['id']);
        else $parent = $this->humanFactory->create($data, Human::STATUS_PARENT);
        $this->humanManager->updateFields($parent, $data);
        return $parent;
    }

    public function handleParents(array $data, Human $baby): void
    {
        $baby->mother()->associate($this->handleParent($data['mother']));
        $baby->father()->associate($this->handleParent($data['father']));
        $baby->save();
    }

    public function validated(array $data): array
    {
        $validator = Validator::make($data, [
            'birthday' => ['required','date'],
            'gender' => ['required',Rule::in(Human::genders())],
            'mother.id' => ['nullable', 'exists:humans,id'],
            'mother.passport' => ['required'],
            'mother.first_name' => ['required'],
            'mother.last_name' => ['required'],
            'mother.middle_name' => ['required'],
            'mother.birthday' => ['required','date'],
            'mother.gender' => ['required', Rule::in(Human::femaleGenders())],
            'father.id' => ['nullable', 'exists:humans,id'],
            'father.passport' => ['required'],
            'father.first_name' => ['required'],
            'father.last_name' => ['required'],
            'father.middle_name' => ['required'],
            'father.birthday' => ['required','date'],
            'father.gender' => ['required', Rule::in(Human::maleGenders())],
        ]);
        if ($validator->fails()) {
            throw new ValidationException($validator);
        }
        return $validator->validated();
    }
}
