<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Raýatlar') }}
        </h2>
    </x-slot>

    <div class="mt-5"></div>

    <div>
        <a href="{{ route('human.create') }}" class="btn btn-primary">
            <i class="fa fa-plus"></i> Täza çaga
        </a>
    </div>
    <div class="mt-4">
        <div class="bg-white overflow-hidden shadow-xl sm:rounded-lg">
            <table class="table">
                <thead>
                    <tr>
                        <th>
                            RecID
                        </th>
                        <th>
                            Doglan senesi
                        </th>
                        <th>
                            Jynsy
                        </th>
                        <th>
                            Ady
                        </th>
                        <th>
                            Ýagdaýy
                        </th>
                    </tr>
                </thead>
                <tbody>
                @foreach($humans as $item)
                    <tr>
                        <td>
                            <a href="{{ route('human.edit', ['human' => $item]) }}">
                                {{ $item->number() }}
                            </a>
                        </td>
                        <td>
                            {{ optional($item->birthday)->format('Y-m-d') }}
                        </td>
                        <td>
                            @lang('app.human_gender_'.$item->gender)
                        </td>
                        <td>
                            {{ $item->full_name }}
                        </td>
                        <td>
                            @lang('app.human_status_'.$item->status)
                            <br>
                            @if($item->isBCExists())
                                <a href="{{ route('civil_register.download_db',['human' => $item]) }}" class="btn btn-sm btn-success">
                                    <i class="fa fa-download"></i>
                                </a>
                            @endif
                        </td>
                    </tr>
                @endforeach
                </tbody>
            </table>
            {{ $humans->links() }}



        </div>
    </div>
</x-app-layout>
