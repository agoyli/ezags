<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Dashboard') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-xl sm:rounded-lg">
                @if(auth()->user()->hasRole(\App\Models\User::ROLE_HOSPITAL))
                    <meta http-equiv="refresh" content="0; url={{ route('human.list') }}">
                @elseif(auth()->user()->hasRole(\App\Models\User::ROLE_PARENT))
                    <meta http-equiv="refresh" content="0; url={{ route('parent.list') }}">
                @elseif(auth()->user()->hasRole(\App\Models\User::ROLE_CHILDREN_SERVICE))
                    <meta http-equiv="refresh" content="0; url={{ route('children_service.list') }}">
                @elseif(auth()->user()->hasRole(\App\Models\User::ROLE_MARRIAGE_REGISTRY))
                    <meta http-equiv="refresh" content="0; url={{ route('civil_register.list') }}">
                @elseif(auth()->user()->hasRole(\App\Models\User::ROLE_ADMIN))
                    <meta http-equiv="refresh" content="0; url={{ route('voyager.dashboard') }}">
                @else
                    <h5 class="m-5">We don't recognize you.</h5>
                @endif
            </div>
        </div>
    </div>
</x-app-layout>
