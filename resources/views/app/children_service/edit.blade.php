<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Raýat üýtget') }}
        </h2>
    </x-slot>

    <div class="mt-5"></div>

    <div class="">
        <a href="{{ route('children_service.list') }}" class="btn btn-primary">
            <i class="fa fa-list"></i> Ählisi
        </a>
    </div>
    <script>
        var regions = @json(\App\Models\Human\Services\HumanManager::regions());
        var oldRegion = "{{ old('region') ?? $human->region }}"
    </script>
    <div class="mt-4">
        <div class="p-4 bg-white overflow-hidden shadow-xl sm:rounded-lg">
            <form action="{{ route('children_service.store') }}" method="POST" enctype="multipart/form-data">
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
                                   value="{{ old('birthday') ?? $human->birthday->format('Y-m-d') }}">
                        </div>
                    </div>

                    <div class="col-2">
                        <div class="form-group">
                            <label for="gender">Jynsy</label>
                            <select name="gender" id="gender" class="form-control">
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
                            <select name="nation" id="nation" class="form-control">
                                @foreach(\App\Models\Human\Services\HumanManager::countries() as $key => $number)
                                    <option value="{{ $key }}" @if(((old('nation') ?? $human->nation) ?? 'TM') == $key)selected @endif>{{ strtoupper($key) }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="form-group">
                            <label for="state">Welaýat</label>
                            <select name="state" id="state" class="form-control">
                                @foreach(\App\Models\Human\Services\HumanManager::regions() as $key => $number)
                                    <option value="{{ $key }}" @if((old('state') ?? $human->state) == $key)selected @endif>{{ $key }}</option>
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
                    <div class="col-3">
                        <div class="form-group">
                            <label>Familiýasy</label>
                            <input type="text" class="form-control" name="last_name" value="{{ $human->last_name }}">
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="form-group">
                            <label>Ady</label>
                            <input type="text" class="form-control" name="first_name" value="{{ $human->first_name }}">
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="form-group">
                            <label>Atasynyň ady</label>
                            <input type="text" class="form-control" name="middle_name" value="{{ $human->middle_name }}">
                        </div>
                    </div>
                </div>


                <h4>Resminamalar</h4>
                <div id="documentsList">

                    @foreach(range(0,count(old('documents') ?? (count($human->documents) < 1 ? [''] : $human->documents))-1) as $docKey)
                        <div class="document-item">
                            <input name="documents[{{ $docKey }}][id]" value="{{ old('documents.'.$docKey.'.id') ?? (isset($human->documents[$docKey]) ? $human->documents[$docKey]->id : null) }}" hidden>
                            <div class="row">
                                <div class="form-group col-4">
                                    <label for="">Resminama belgisi:</label>
                                    <input type="text" class="form-control" name="documents[{{ $docKey }}][number]" value="{{ old('documents.'.$docKey.'.number') ?? (isset($human->documents[$docKey]) ? $human->documents[$docKey]->number : null) }}">
                                </div>


                                <div class="form-group col-4">
                                    <label for="">Resminama görnüşi</label>
                                    <select class="form-control w-100 {{ strpos($errors, 'documents.'.$docKey.'.type') ? 'is-invalid' : '' }}" name="documents[{{ $docKey }}][type]" data-live-search="true" style="cursor: pointer;">
                                        <option value="" selected disabled></option>
                                        @foreach(\App\Models\Document::types() as $item)
                                            <option value="{{ $item }}"
                                                    @if((old('documents.'.$docKey.'.type') ?? (isset($human->documents[$docKey]) ? $human->documents[$docKey]->type : null)) == $item)selected @endif
                                            >@lang('app.document_type_'.$item)</option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="form-group col-2">
                                    <label for="">Senesi:</label>
                                    <input type="text" class="form-control airdate" name="documents[{{ $docKey }}][date]" value="{{ old('documents.'.$docKey.'.date') ?? (isset($human->documents[$docKey]) ? $human->documents[$docKey]->date->format('Y-m-d') : null) }}">
                                </div>
                                @if($loop->index > 0)
                                    <em class="far fa-trash-alt" id="goodDeleteBtn" style="cursor: pointer; margin-top: 15px;"></em>
                                @endif
                            </div>
                            <div class="d-flex flex-row justify-content-between align-items-center">
                                <div class="form-group col-3">
                                    <label class="btn btn-primary">
                                        Faýllary ýüklemek<input type="file" hidden name="documents[{{ $docKey }}][files][]" multiple>
                                    </label>
                                </div>

                                @if(is_array(isset($human->documents[$docKey]) ? $human->documents[$docKey]->files : null))
                                    <div class="form-group files_group">
                                        @foreach($human->documents[$docKey]->files as $key => $file)
                                            <a href="javascript:void(0)" data-toggle="modal" data-target="#file_modal_{{$docKey}}-{{ $key }}" style="margin-right: 15px;">
                                                Faýl {{ $key+1 }} ({{ pathinfo($file, PATHINFO_EXTENSION) }})
                                            </a> <br>
                                        @endforeach
                                        @foreach($human->documents[$docKey]->files as $key => $file)
                                            <div class="modal fade" id="file_modal_{{$docKey}}-{{ $key }}">
                                                <div class="modal-dialog modal-lg">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h4 class="modal-number">Ýüklenen faýl</h4>
                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                        </div>
                                                        <div class="modal-body">
                                                            @if(in_array(pathinfo($file, PATHINFO_EXTENSION), ['png', 'jpg', 'jpeg']))
                                                                <img src="{{ asset($human->documents[$docKey]->files[$key]) }}" alt="" width="100%">
                                                            @elseif(in_array(pathinfo($file, PATHINFO_EXTENSION), ['pdf']))
                                                                <object data="{{ asset($human->documents[$docKey]->files[$key]) }}" type="application/pdf" width="100%" height="500px">
                                                                    <embed src="{{ asset($human->documents[$docKey]->files[$key]) }}" type="application/pdf" />
                                                                </object>
                                                            @else
                                                                <iframe number="iframe" src="{{ asset($human->documents[$docKey]->files[$key]) }}" frameborder="0" id="fileShow" allowfullscreen></iframe>
                                                            @endif
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        @endforeach
                                    </div>
                                    <div class="form-group col-3 delete_files_group">
                                        <label>
                                            Faýllary poz <input type="checkbox" name="documents[{{ $docKey }}][delete_files]" class="delete_files">
                                        </label>
                                    </div>
                                @endif
                            </div>
                            <hr>
                        </div>
                    @endforeach
                </div>
                <button type="button" class="btn btn-outline-dark addDocumentBtn">Resminama goş</button>
                <hr class="mb-5">



                <div class="row">
                    <div class="col-6 human-group">
                        <h4>Ejesi</h4>
                        <hr>
                        <input type="hidden" name="mother[id]" class="human-id" value="{{ old('mother.id') ?? optional($human->mother)->id }}">

                        <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                    <label for="mother.passport">Pasport belgisi</label>
                                    <input type="text" name="mother[passport]" id="mother.passport" value="{{ old('mother.passport') ?? optional($human->mother)->passport }}" class="form-control human-passport" autocomplete="off">
                                </div>
                            </div>
                            @if(optional($human->mother)->user)
                                <div class="col-6">
                                    <div class="form-group">
                                        <label for="mother.email">E-poçta</label>
                                        <input type="text" name="mother[email]" id="mother.email" value="{{ old('mother.email') ?? optional($human->mother)->user->email }}" class="form-control human-email" autocomplete="off">
                                    </div>
                                </div>
                            @endif
                        </div>
                        <div class="row">
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="mother.first_name">Ady</label>
                                    <input type="text" name="mother[first_name]" id="mother.first_name" value="{{ old('mother.first_name') ?? optional($human->mother)->first_name }}" class="form-control human-first-name">
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="mother.last_name">Familiýasy</label>
                                    <input type="text" name="mother[last_name]" id="mother.last_name" value="{{ old('mother.last_name') ?? optional($human->mother)->last_name }}" class="form-control human-last-name">
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="mother.middle_name">Atasynyň ady</label>
                                    <input type="text" name="mother[middle_name]" id="mother.middle_name" value="{{ old('mother.middle_name') ?? optional($human->mother)->middle_name }}" class="form-control human-middle-name">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                    <label for="mother.birthday">Doglan senesi</label>
                                    <input type="text" name="mother[birthday]" id="mother.birthday"
                                           value="{{ old('mother.birthday') ?? optional(optional($human->mother)->birthday)->format('Y-m-d') }}"
                                           class="form-control human-birthday airdate" autocomplete="off">
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label for="mother.gender">Jynsy</label>
                                    <select name="mother[gender]" id="mother.gender" class="form-control human-gender">
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
                                    <input type="text" name="father[passport]" id="father.passport" value="{{ old('father.passport') ?? optional($human->father)->passport }}" class="form-control human-passport" autocomplete="off">
                                </div>
                            </div>
                            @if(optional($human->father)->user)
                                <div class="col-6">
                                    <div class="form-group">
                                        <label for="father.email">E-poçta</label>
                                        <input type="text" name="father[email]" id="father.email" value="{{ old('father.email') ?? optional($human->father)->user->email }}" class="form-control human-email" autocomplete="off">
                                    </div>
                                </div>
                            @endif
                        </div>
                        <div class="row">
                            <div class="col-4">

                                <div class="form-group">
                                    <label for="father.first_name">Ady</label>
                                    <input type="text" name="father[first_name]" id="father.first_name" value="{{ old('father.first_name') ?? optional($human->father)->first_name }}" class="form-control human-first-name">
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="father.last_name">Familiýasy</label>
                                    <input type="text" name="father[last_name]" id="father.last_name" value="{{ old('father.last_name') ?? optional($human->father)->last_name }}" class="form-control human-last-name">
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="father.middle_name">Atasynyň ady</label>
                                    <input type="text" name="father[middle_name]" id="father.middle_name" value="{{ old('father.middle_name') ?? optional($human->father)->middle_name }}" class="form-control human-middle-name">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                    <label for="father.birthday">Doglan senesi</label>
                                    <input type="text" name="father[birthday]" id="father.birthday" value="{{ old('father.birthday') ?? optional(optional($human->father)->birthday)->format('Y-m-d') }}" class="form-control human-birthday airdate" autocomplete="off">
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label for="father.gender">Jynsy</label>
                                    <select name="father[gender]" id="father.gender" class="form-control human-gender">
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
                <button type="submit" class="btn btn-success">
                    <i class="fa fa-plus"></i> Goş
                </button>
            </form>
        </div>
    </div>
</x-app-layout>
