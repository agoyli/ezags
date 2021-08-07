<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Täze raýat') }}
        </h2>
    </x-slot>

    <div class="mt-5"></div>

    <div class="">
        <a href="{{ route('human.list') }}" class="btn btn-primary">
            <i class="fa fa-list"></i> Ählisi
        </a>
    </div>
    <script>
        var regions = @json(\App\Models\Human\Services\HumanManager::regions());
        var oldRegion = "{{ old('region') }}"
    </script>
    <div class="mt-4">
        <div class="p-4 bg-white overflow-hidden shadow-xl sm:rounded-lg">
            <form action="{{ route('human.store') }}" method="POST">
                @csrf
                <div class="row human-group">
                    <div class="col-12">
                        <div class="row">

                            <div class="col-4">
                                <div class="form-group">
                                    <label for="id">RecID</label>
                                    <input type="text" id="id" disabled class="form-control" value="{{ \App\Models\Human::getNewNumber(now()->year) }}">
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="id">NIN</label>
                                    <input type="text" id="id" disabled class="form-control" value="{{ \App\Models\Human::getNewNumber(now()->year) }}">
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="id">Wagty</label>
                                    <input type="text" id="id" disabled class="form-control" value="{{ now()->format('d-m-Y H:i:s') }}">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-2">
                        <div class="form-group">
                            <label for="birthday">Doglan senesi</label>
                            <input type="text" name="birthday" id="birthday" class="form-control airdate"
                                   autocomplete="off"
                                   value="{{ old('birthday') }}">
                        </div>
                    </div>
                    <div class="col-2">
                        <div class="form-group">
                            <label for="gender">Jynsy</label>
                            <select name="gender" id="gender" class="form-control">
                                <option value="" selected="selected" disabled></option>
                                @foreach(\App\Models\Human::genders() as $item)
                                    <option value="{{ $item }}" @if(old('gender') == $item)selected @endif>
                                        @lang('app.human_gender_'.$item)
                                    </option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="col-2">
                        <div class="form-group">
                            <label for="nation">Milleti</label>
                            <select name="nation" id="nation" class="form-control">
                                @foreach(\App\Models\Human\Services\HumanManager::countries() as $key => $title)
                                    <option value="{{ $key }}" @if((old('state') ?? 'TM') == $key)selected @endif>{{ strtoupper($key) }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="form-group">
                            <label for="state">Welaýat</label>
                            <select name="state" id="state" class="form-control">
                                @foreach(\App\Models\Human\Services\HumanManager::regions() as $key => $title)
                                    <option value="{{ $key }}" @if(old('state') == $key)selected @endif>{{ $key }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="form-group">
                            <label for="region">Etrap</label>
                            <select name="region" id="region" class="form-control"></select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6 human-group">
                        <h4>Ejesi </h4>
                        <label for="mother.is_account">
                            <input type="checkbox" class="is_account" id="mother.is_account" name="mother[is_account]">
                            Hasap döret we email iber
                        </label>
                        <hr>
                        <input type="hidden" name="mother[id]" class="human-id" value="{{ old('mother.id') }}">
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                    <label for="mother.passport">Pasport belgisi</label>
                                    <input type="text" name="mother[passport]" id="mother.passport" value="{{ old('mother.passport') }}" class="form-control human-passport" autocomplete="off">
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group humanEmailGroup" style="display: none">
                                    <label for="mother.email">E-poçta</label>
                                    <input type="text" name="mother[email]" id="mother.email" value="{{ old('mother.email') }}" class="form-control human-email" autocomplete="off">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="mother.first_name">Ady</label>
                                    <input type="text" name="mother[first_name]" id="mother.first_name" value="{{ old('mother.first_name') }}" class="form-control human-first-name">
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="mother.last_name">Familiýasy</label>
                                    <input type="text" name="mother[last_name]" id="mother.last_name" value="{{ old('mother.last_name') }}" class="form-control human-last-name">
                                </div>
                            </div>
                            <div class="col-4">

                                <div class="form-group">
                                    <label for="mother.middle_name">Atasynyň ady</label>
                                    <input type="text" name="mother[middle_name]" id="mother.middle_name" value="{{ old('mother.middle_name') }}" class="form-control human-middle-name">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                           <div class="col-6">
                               <div class="form-group">
                                   <label for="mother.birthday">Doglan senesi</label>
                                   <input type="text" name="mother[birthday]" id="mother.birthday" value="{{ old('mother.birthday') }}" class="form-control human-birthday airdate" autocomplete="off">
                               </div>
                           </div>
                            <div class="col-6">

                                <div class="form-group">
                                    <label for="mother.gender">Jynsy</label>
                                    <select name="mother[gender]" id="mother.gender" class="form-control human-gender">
                                        <option value="" selected="selected" disabled></option>
                                        @foreach(\App\Models\Human::genders() as $item)
                                            <option value="{{ $item }}" @if(old('mother.gender') == $item && !is_null(old('mother.gender')))selected @endif>
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
                        <label for="father.is_account">
                            <input type="checkbox" class="is_account" id="father.is_account" name="father[is_account]">
                            Hasap döret we email iber
                        </label>
                        <hr>
                        <input type="hidden" name="father[id]" class="human-id" value="{{ old('father.id') }}">
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                    <label for="father.passport">Pasport belgisi</label>
                                    <input type="text" name="father[passport]" id="father.passport" value="{{ old('father.passport') }}" class="form-control human-passport" autocomplete="off">
                                </div>
                            </div>

                            <div class="col-6">
                                <div class="form-group humanEmailGroup" style="display: none">
                                    <label for="father.email">E-poçta</label>
                                    <input type="text" name="father[email]" id="father.email" value="{{ old('father.email') }}" class="form-control human-email" autocomplete="off">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="father.first_name">Ady</label>
                                    <input type="text" name="father[first_name]" id="father.first_name" value="{{ old('father.first_name') }}" class="form-control human-first-name">
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="father.last_name">Familiýasy</label>
                                    <input type="text" name="father[last_name]" id="father.last_name" value="{{ old('father.last_name') }}" class="form-control human-last-name">
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="father.middle_name">Atasynyň ady</label>
                                    <input type="text" name="father[middle_name]" id="father.middle_name" value="{{ old('father.middle_name') }}" class="form-control human-middle-name">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                    <label for="father.birthday">Doglan senesi</label>
                                    <input type="text" name="father[birthday]" id="father.birthday" value="{{ old('father.birthday') }}" class="form-control human-birthday">
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label for="father.gender">Jynsy</label>
                                    <select name="father[gender]" id="father.gender" class="form-control human-gender">
                                        <option value="" selected="selected" disabled></option>
                                        @foreach(\App\Models\Human::genders() as $item)
                                            <option value="{{ $item }}" @if(old('father.gender') == $item && !is_null(old('father.gender')))selected @endif>
                                                @lang('app.human_gender_'.$item)
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-success">
                    <i class="fa fa-plus"></i> Goş
                </button>
            </form>
        </div>
    </div>
</x-app-layout>
