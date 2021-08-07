<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});



Route::middleware(['auth:sanctum', 'verified'])->group(function () {
    Route::group(['namespace' => '\App\Http\Controllers'], function () {
        Route::get('/', 'AppController@dashboard')->name('dashboard');
        Route::group(['as' => 'human.', 'prefix' => 'human'], function () {
            Route::get('list','HumanController@list')->name('list');
            Route::get('create','HumanController@create')->name('create');
            Route::post('store','HumanController@store')->name('store');
            Route::get('/edit/{human}','HumanController@edit')->name('edit');
            Route::post('/update/{human}','HumanController@update')->name('update');

            Route::post('find','HumanController@find')->name('find');
        });

        Route::group(['as' => 'parent.', 'prefix' => 'parent'], function () {
            Route::get('list','ParentController@list')->name('list');
            Route::get('edit/{human}','ParentController@edit')->name('edit');
            Route::post('edit/{human}','ParentController@update')->name('update');
        });
        Route::group(['as' => 'civil_register.', 'prefix' => 'civil_register'], function () {
            Route::get('list','CivilRegisterController@list')->name('list');
            Route::get('edit/{human}','CivilRegisterController@edit')->name('edit');
            Route::post('edit/{human}','CivilRegisterController@update')->name('update');
        });
        Route::group(['as' => 'children_service.', 'prefix' => 'children_service'], function () {
            Route::get('list','ChildrenServiceController@list')->name('list');
            Route::get('create','ChildrenServiceController@create')->name('create');
            Route::post('store','ChildrenServiceController@store')->name('store');
            Route::get('edit/{human}','ChildrenServiceController@edit')->name('edit');
            Route::post('edit/{human}','ChildrenServiceController@update')->name('update');
        });
    });
});


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
