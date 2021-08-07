<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Çagama at goýmak') }}
        </h2>
    </x-slot>

    <div class="mt-5"></div>

    <div class="">
        <a href="{{ route('parent.list') }}" class="btn btn-primary">
            <i class="fa fa-list"></i> Ählisi
        </a>
    </div>
    <script>
        var regions = @json(\App\Models\Human\Services\HumanManager::regions());
        var oldRegion = "{{ old('region') ?? $human->region }}"
    </script>
    <div class="mt-4">
        <div class="p-4 bg-white overflow-hidden shadow-xl sm:rounded-lg">
            <form action="{{ route('parent.update', ['human' => $human]) }}" method="POST">
                @csrf
                <div class="row">
                    <div class="col-4">
                        <div class="form-group">
                            <label for="id">RecID</label>
                            <input type="text" id="id" disabled class="form-control" value="{{ $human->number() }}">
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="form-group">
                            <label for="nin">NIN</label>
                            <input type="text" id="nin" disabled class="form-control" value="{{ $human->nin() }}">
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="form-group">
                            <label for="created_at">Döredilen wagty</label>
                            <input type="text" id="created_at" disabled class="form-control" value="{{ $human->created_at->format('d-m-Y H:i:s') }}">
                        </div>
                    </div>
                </div>
                <div class="row human-group justify-content-center">
                    <div class="col-2">
                        <div class="form-group">
                            <label for="birthday">Doglan senesi</label>
                            <input type="text" name="birthday" disabled id="birthday" class="form-control airdate"
                                   autocomplete="off"
                                   value="{{ old('birthday')??$human->birthday->format('Y-m-d') }}">
                        </div>
                    </div>
                    <div class="col-2">
                        <div class="form-group">
                            <label for="gender">Jynsy</label>
                            <select name="gender" disabled id="gender" class="form-control">
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
                    <div class="col-4">
                        <div class="form-group">
                            <label>Familiýasy</label>
                            <input type="text" disabled class="form-control" value="{{ $human->last_name }}">
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="form-group">
                            <label>Ady</label>
                            <input type="text" name="first_name" class="form-control" value="{{ $human->first_name }}">
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="form-group">
                            <label>Atasynyň ady</label>
                            <input type="text" disabled class="form-control" value="{{ $human->middle_name }}">
                        </div>
                    </div>
                </div>
                <h4>Ejesi: {{ optional($human->mother)->full_name }}</h4>
                <h4>Kakasy: {{ optional($human->father)->full_name }}</h4>
                <button type="submit" class="btn btn-success">
                    <i class="fa fa-save"></i> Ýatda sakla
                </button>
            </form>
        </div>
    </div>
</x-app-layout>
