<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Tassyklamak') }}
        </h2>
    </x-slot>

    <div class="mt-5"></div>

    <div class="">
        <a href="{{ route('civil_register.list') }}" class="btn btn-primary">
            <i class="fa fa-list"></i> Ählisi
        </a>
    </div>
    <script>
        var regions = @json(\App\Models\Human\Services\HumanManager::regions());
        var oldRegion = "{{ old('region') ?? $human->region }}"
    </script>
    <div class="mt-4">
        <div class="p-4 bg-white overflow-hidden shadow-xl sm:rounded-lg">
            <form action="{{ route('civil_register.update', ['human' => $human]) }}" method="POST">
                @csrf
                <div class="row human-group">
                    <div class="col-12">
                        <div class="row">
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="id">RecID</label>
                                    <input type="text" id="id" disabled class="form-control" value="{{ $human->number() }}">
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="id">NIN</label>
                                    <input type="text" id="id" disabled class="form-control" value="{{ $human->nin() }}">
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="id">Döredilen wagty</label>
                                    <input type="text" id="id" disabled class="form-control" value="{{ $human->created_at->format('d-m-Y H:i:s') }}">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-2">
                        <div class="form-group">
                            <label for="birthday">Doglan senesi</label>
                            <input type="text" name="birthday" id="birthday" disabled class="form-control airdate"
                                   autocomplete="off"
                                   value="{{ old('birthday')??$human->birthday->format('Y-m-d') }}">
                        </div>
                    </div>
                    <div class="col-2">
                        <div class="form-group">
                            <label for="gender">Jynsy</label>
                            <select name="gender" id="gender" disabled class="form-control">
                                <option value="" selected="selected" disabled></option>
                                @foreach(\App\Models\Human::genders() as $item)
                                    <option value="{{ $item }}" @if((old('gender') ?? $human->gender) == $item && !is_null(old('gender')??$human->gender))selected @endif>
                                        @lang('app.human_gender_'.$item)
                                    </option>
                                @endforeach
                            </select>
                        </div>
                    </div>

                    <div class="col-2">
                        <div class="form-group">
                            <label for="nation">Milleti</label>
                            <select name="nation" id="nation" disabled class="form-control">
                                @foreach(\App\Models\Human\Services\HumanManager::countries() as $key => $title)
                                    <option value="{{ $key }}" @if(((old('nation') ?? $human->nation) ?? 'TM') == $key)selected @endif>{{ strtoupper($key) }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="form-group">
                            <label for="state">Welaýat</label>
                            <select name="state" id="state" disabled class="form-control">
                                @foreach(\App\Models\Human\Services\HumanManager::regions() as $key => $title)
                                    <option value="{{ $key }}" @if((old('state') ?? $human->state) == $key)selected @endif>{{ $key }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="form-group">
                            <label for="region">Etrap</label>
                            <select name="region" id="region" disabled class="form-control"></select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-3">
                        <div class="form-group">
                            <label>Familiýasy</label>
                            <input type="text" class="form-control" disabled name="last_name" value="{{ $human->last_name }}">
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="form-group">
                            <label>Ady</label>
                            <input type="text" class="form-control" disabled name="first_name" value="{{ $human->first_name }}">
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="form-group">
                            <label>Atasynyň ady</label>
                            <input type="text" class="form-control" disabled name="middle_name" value="{{ $human->middle_name }}">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6 human-group">
                        <h4>Ejesi</h4>
                        <hr>
                        <input type="hidden" name="mother[id]" class="human-id" disabled value="{{ old('mother.id') ?? optional($human->mother)->id }}">

                        <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                    <label for="mother.passport">Pasport belgisi</label>
                                    <input type="text" name="mother[passport]" disabled id="mother.passport" value="{{ old('mother.passport') ?? optional($human->mother)->passport }}" class="form-control human-passport" autocomplete="off">
                                </div>
                            </div>
                            @if(optional($human->mother)->user)
                                <div class="col-6">
                                    <div class="form-group">
                                        <label for="mother.email">E-poçta</label>
                                        <input type="text" name="mother[email]" disabled id="mother.email" value="{{ old('mother.email') ?? optional($human->mother)->user->email }}" class="form-control human-email" autocomplete="off">
                                    </div>
                                </div>
                            @endif
                        </div>
                        <div class="row">
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="mother.first_name">Ady</label>
                                    <input type="text" name="mother[first_name]" disabled id="mother.first_name" value="{{ old('mother.first_name') ?? optional($human->mother)->first_name }}" class="form-control human-first-name">
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="mother.last_name">Familiýasy</label>
                                    <input type="text" name="mother[last_name]" disabled id="mother.last_name" value="{{ old('mother.last_name') ?? optional($human->mother)->last_name }}" class="form-control human-last-name">
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="mother.middle_name">Atasynyň ady</label>
                                    <input type="text" name="mother[middle_name]" disabled id="mother.middle_name" value="{{ old('mother.middle_name') ?? optional($human->mother)->middle_name }}" class="form-control human-middle-name">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                    <label for="mother.birthday">Doglan senesi</label>
                                    <input type="text" name="mother[birthday]" disabled id="mother.birthday"
                                           value="{{ old('mother.birthday') ?? optional(optional($human->mother)->birthday)->format('Y-m-d') }}"
                                           class="form-control human-birthday airdate" autocomplete="off">
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label for="mother.gender">Jynsy</label>
                                    <select name="mother[gender]" disabled id="mother.gender" class="form-control human-gender">
                                        <option value="" selected="selected" disabled></option>
                                        @foreach(\App\Models\Human::genders() as $item)
                                            <option value="{{ $item }}" @if((old('mother.gender') ?? optional($human->mother)->gender) == $item && !is_null(old('mother.gender') ?? optional($human->mother)->gender))selected @endif>
                                                @lang('app.human_gender_'.$item)
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 human-group">
                        <h4>Kakasy</h4>
                        <hr>
                        <input type="hidden" name="father[id]" class="human-id" value="{{ old('father.id') ?? optional($human->father)->id }}">
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                    <label for="father.passport">Pasport belgisi</label>
                                    <input type="text" name="father[passport]" disabled id="father.passport" value="{{ old('father.passport') ?? optional($human->father)->passport }}" class="form-control human-passport" autocomplete="off">
                                </div>
                            </div>
                            @if(optional($human->father)->user)
                                <div class="col-6">
                                    <div class="form-group">
                                        <label for="father.email">E-poçta</label>
                                        <input type="text" name="father[email]" disabled id="father.email" value="{{ old('father.email') ?? optional($human->father)->user->email }}" class="form-control human-email" autocomplete="off">
                                    </div>
                                </div>
                            @endif
                        </div>
                        <div class="row">
                            <div class="col-4">

                                <div class="form-group">
                                    <label for="father.first_name">Ady</label>
                                    <input type="text" name="father[first_name]" disabled id="father.first_name" value="{{ old('father.first_name') ?? optional($human->father)->first_name }}" class="form-control human-first-name">
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="father.last_name">Familiýasy</label>
                                    <input type="text" name="father[last_name]" disabled id="father.last_name" value="{{ old('father.last_name') ?? optional($human->father)->last_name }}" class="form-control human-last-name">
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="father.middle_name">Atasynyň ady</label>
                                    <input type="text" name="father[middle_name]" disabled id="father.middle_name" value="{{ old('father.middle_name') ?? optional($human->father)->middle_name }}" class="form-control human-middle-name">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                    <label for="father.birthday">Doglan senesi</label>
                                    <input type="text" name="father[birthday]" disabled id="father.birthday" value="{{ old('father.birthday') ?? optional(optional($human->father)->birthday)->format('Y-m-d') }}" class="form-control human-birthday airdate" autocomplete="off">
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label for="father.gender">Jynsy</label>
                                    <select name="father[gender]" disabled id="father.gender" class="form-control human-gender">
                                        <option value="" selected="selected" disabled></option>
                                        @foreach(\App\Models\Human::genders() as $item)
                                            <option value="{{ $item }}" @if((old('father.gender') ?? optional($human->father)->gender) == $item && !is_null((old('father.gender') ?? optional($human->father)->gender)))selected @endif>
                                                @lang('app.human_gender_'.$item)
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row text-right">
                    <div class="col-6">
                        <textarea name="note" class="form-control" id="note" placeholder="Nädogrylygy barada bellik...">{{ old('note') ?? $human->notes }}</textarea>
                    </div>
                    <div class="col-6">
                        <button type="submit" name="action" value="reject" class="btn btn-lg btn-danger">
                            <i class="fa fa-close"></i> Ýalňyşlyk bar
                        </button>
                        <button type="submit" name="action" value="accept" class="btn btn-lg btn-success">
                            <i class="fa fa-check"></i> Dogry
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</x-app-layout>
