<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\IndexController;
use App\Http\Controllers\HomeController;
// admin controller
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\GenreController;
use App\Http\Controllers\CountryController;
use App\Http\Controllers\MovieController;
use App\Http\Controllers\EpisodeController;
use Illuminate\Support\Facades\Auth;



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


Route::get('/', [IndexController::class, 'home'])->name('homepage');
Route::get('/danh-muc/{slug}', [IndexController::class, 'category'])->name('category');
Route::get('/the-loai/{slug}', [IndexController::class, 'genre'])->name('genre');
Route::get('/quoc-gia/{slug}', [IndexController::class, 'country'])->name('country');
Route::get('/phim/{slug}', [IndexController::class, 'movie'])->name('movie');
Route::get('/xem-phim', [IndexController::class, 'watch'])->name('watch');
Route::get('/episode', [IndexController::class, 'episode'])->name('episode');


Auth::routes();


//route admin
Route::group(['prefix' => 'admin'], function () {
    Route::get('/', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

    Route::resource('category', CategoryController::class);
    Route::post('category/destroy/{id}', [CategoryController::class, 'destroy'])->name('category.destroy');
    Route::get('category/edit/{id}', [CategoryController::class, 'edit'])->name('category.edit');
    Route::post('category/update/{id}', [CategoryController::class, 'update'])->name('category.update');

    Route::resource('genre', GenreController::class);
    Route::post('genre/destroy/{id}', [GenreController::class, 'destroy'])->name('genre.destroy');
    Route::get('genre/edit/{id}', [GenreController::class, 'edit'])->name('genre.edit');
    Route::post('genre/update/{id}', [GenreController::class, 'update'])->name('genre.update');

    Route::resource('country', CountryController::class);
    Route::post('country/destroy/{id}', [CountryController::class, 'destroy'])->name('country.destroy');
    Route::get('country/edit/{id}', [CountryController::class, 'edit'])->name('country.edit');
    Route::post('country/update/{id}', [CountryController::class, 'update'])->name('country.update');

    Route::resource('movie', MovieController::class);
    Route::post('movie/destroy/{id}', [MovieController::class, 'destroy'])->name('movie.destroy');
    Route::get('movie/edit/{id}', [MovieController::class, 'edit'])->name('movie.edit');
    Route::post('movie/update/{id}', [MovieController::class, 'update'])->name('movie.update');
    Route::resource('episode', EpisodeController::class);

    //route admin 
    Route::post('resorting', [CategoryController::class, 'resorting'])->name('resorting');
    // update movies top view
    Route::get('/update-topview-phim', [MovieController::class, 'update_topview']);
});
