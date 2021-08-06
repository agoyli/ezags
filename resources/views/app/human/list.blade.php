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
                            ID
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
                            Ejesi
                        </th>
                        <th>
                            Kakasy
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
                        <td>{{ $item->birthday }}</td>
                        <td>
                            {{ $item->gender }}
                        </td>
                        <td>
                            {{ $item->first_name }}
                        </td>
                        <td>
                            {{ $item->mother ? $item->mother->full_name : '-' }}
                        </td>
                        <td>
                            {{ $item->father ? $item->father->full_name : '-' }}
                        </td>
                        <td>
                            {{ $item->status }}
                        </td>
                    </tr>
                @endforeach
                </tbody>
            </table>



        </div>
    </div>
</x-app-layout>
