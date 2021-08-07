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
    <div class="mt-4">
        <div class="p-4 bg-white overflow-hidden shadow-xl sm:rounded-lg">
            <form action="{{ route('parent.update', ['human' => $human]) }}" method="POST">
                @csrf
                <div class="row human-group justify-content-center">
                    <div class="col-3">
                        <div class="form-group">
                            <label for="id">RecID</label>
                            <input type="text" id="id" disabled class="form-control" value="{{ $human->number() }}">
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="form-group">
                            <label for="birthday">Doglan senesi</label>
                            <input type="text" name="birthday" disabled id="birthday" class="form-control airdate"
                                   autocomplete="off"
                                   value="{{ old('birthday')??$human->birthday->format('Y-m-d') }}">
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="form-group">
                            <label for="gender">Jynsy</label>
                            <select name="gender" disabled id="gender" class="form-control">
                                <option value="" selected="selected" disabled></option>
                                @foreach(\App\Models\Human::genders() as $item)
                                    <option value="{{ $item }}" @if((old('gender') ?? $human->gender) == $item && !is_null(old('gender')??$human->gender))selected @endif>{{ $item }}</option>
                                @endforeach
                            </select>
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
                <button type="submit" class="btn btn-success">
                    <i class="fa fa-save"></i> Ýatda sakla
                </button>
            </form>
        </div>
    </div>
</x-app-layout>
