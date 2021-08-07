<?php


namespace App\Models\Human\UseCases\CreateByChildrenService;


use App\Models\Document\Services\DocumentManager;
use App\Models\Human;
use App\Models\Human\Services\HumanFactory;
use App\Models\User\Services\UserFactory;
use App\Models\User\Services\UserManager;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Validation\ValidationException;

class Handler
{
    private $humanFactory;
    private $humanManager;
    private $userFactory;
    private $userManager;
    private $docManager;

    public function __construct(
        HumanFactory $humanFactory,
        Human\Services\HumanManager $humanManager,
        UserFactory $userFactory,
        UserManager $userManager,
        DocumentManager $docManager
    ) {
        $this->humanFactory = $humanFactory;
        $this->humanManager = $humanManager;
        $this->userFactory = $userFactory;
        $this->userManager = $userManager;
        $this->docManager = $docManager;
    }

    public function handle(Request $request): Human
    {
        $data = $this->validated($request->all());
        $human = $this->humanFactory->create($data);
        $this->humanManager->updateFields($human, $data);
        $this->humanManager->handleParents($data, $human);
        $this->docManager->handleDocuments(@$data['documents'], $human);
        $human->updateLastName();
        $human->updateMiddleName();
        if ($human->first_name != '')
            $human->status = Human::STATUS_CHECK;
        else
            $human->status = Human::STATUS_NEW_NAME;
        $human->is_orphan = true;
        $human->save();
        return $human;
    }

    public function validated(array $data): array
    {
        $validator = Validator::make($data, [
            'birthday' => ['required','date'],
            'gender' => ['required',Rule::in(Human::genders())],
            'nation' => ['required',Rule::in(array_keys(Human\Services\HumanManager::countries()))],
            'state' => ['required', Rule::in(array_keys(Human\Services\HumanManager::regions()))],
            'region' => ['required'],
            'documents' => ['array'],
            'documents.*.number' => ['required'],
            'documents.*.date' => ['required'],
            'documents.*.type' => ['required'],
            'documents.*.files' => ['array'],
            'documents.*.files.*' => ['nullable','file', 'mimes:png,jpg,jpeg,pdf'],
            'mother.id' => ['nullable', 'exists:humans,id'],
            'mother.is_account' => ['nullable'],
            'mother.email' => ['nullable'],
            'mother.passport' => ['nullable'],
            'mother.first_name' => ['nullable'],
            'mother.last_name' => ['nullable'],
            'mother.middle_name' => ['nullable'],
            'mother.birthday' => ['nullable','date'],
            'mother.gender' => ['nullable', Rule::in(Human::genders())],
            'father.id' => ['nullable', 'exists:humans,id'],
            'father.is_account' => ['nullable'],
            'father.email' => ['nullable'],
            'father.passport' => ['nullable'],
            'father.first_name' => ['nullable'],
            'father.last_name' => ['nullable'],
            'father.middle_name' => ['nullable'],
            'father.birthday' => ['nullable','date'],
            'father.gender' => ['nullable', Rule::in(Human::genders())],
        ]);
        if ($validator->fails()) {
            throw new ValidationException($validator);
        }
        return $validator->validated();
    }
}
