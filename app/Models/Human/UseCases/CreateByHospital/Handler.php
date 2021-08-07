<?php


namespace App\Models\Human\UseCases\CreateByHospital;


use App\Models\Human;
use App\Models\Human\Services\HumanFactory;
use App\Models\User;
use App\Models\User\Services\UserFactory;
use App\Models\User\Services\UserManager;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Validation\ValidationException;
use TCG\Voyager\Models\Role;

class Handler
{
    private $humanFactory;
    private $humanManager;
    private $userFactory;
    private $userManager;

    public function __construct(
        HumanFactory $humanFactory,
        Human\Services\HumanManager $humanManager,
        UserFactory $userFactory,
        UserManager $userManager
    ) {
        $this->humanFactory = $humanFactory;
        $this->humanManager = $humanManager;
        $this->userFactory = $userFactory;
        $this->userManager = $userManager;
    }

    public function handle(Request $request): Human
    {
        $data = $this->validated($request->all());
        $human = $this->humanFactory->create($data);
        $this->handleParents($data, $human);
        $human->updateLastName();
        $human->updateMiddleName();
        $human->status = Human::STATUS_NEW_NAME;
        $human->save();
        return $human;
    }

    public function handleParent(array $data): Human
    {
        $parent = null;
        if (isset($data['id'])) $parent = Human::find($data['id']);
        else $parent = $this->humanFactory->create($data, Human::STATUS_PARENT);
        $this->humanManager->updateFields($parent, $data);
        if (isset($data['is_account'])) {
            if (isset($data['email'])) {
                $userData = [
                    'email' => $data['email'],
                    'role' => Role::firstOrNew(['name' => User::ROLE_PARENT])
                ];
                if (!$parent->user) {
                    $user = $this->userFactory->create($userData, $parent);
                } else {
                    $user = $parent->user;
                    $this->userManager->updateFields($user, $userData);
                }
//                $this->userManager->sendCreds($user);
            }
        }
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
            'mother.is_account' => ['nullable'],
            'mother.email' => ['nullable'],
            'mother.passport' => ['required'],
            'mother.first_name' => ['required'],
            'mother.last_name' => ['required'],
            'mother.middle_name' => ['required'],
            'mother.birthday' => ['required','date'],
            'mother.gender' => ['required', Rule::in(Human::genders())],
            'father.id' => ['nullable', 'exists:humans,id'],
            'father.is_account' => ['nullable'],
            'father.email' => ['nullable'],
            'father.passport' => ['required'],
            'father.first_name' => ['required'],
            'father.last_name' => ['required'],
            'father.middle_name' => ['required'],
            'father.birthday' => ['required','date'],
            'father.gender' => ['required', Rule::in(Human::genders())],
        ]);
        if ($validator->fails()) {
            throw new ValidationException($validator);
        }
        return $validator->validated();
    }
}
