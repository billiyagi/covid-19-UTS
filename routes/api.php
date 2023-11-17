<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\PatientController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// Authentication
Route::post('auth/login', LoginController::class);


// Authenticated request
Route::group(['middleware' => ['auth:sanctum']], function () {

    // REST request Patients
    Route::get('patients', [PatientController::class, 'index']);
    Route::get('patients/{id}', [PatientController::class, 'show']);
    Route::post('patients', [PatientController::class, 'store']);
    Route::put('patients/{id}', [PatientController::class, 'update']);
    Route::delete('patients/{id}', [PatientController::class, 'destroy']);
    Route::get('patients/search/{name}', [PatientController::class, 'search']);
    Route::get('patients/status/positive', [PatientController::class, 'getPatientByStatusReaktif']);
    Route::get('patients/status/recovered', [PatientController::class, 'getPatientByStatusSembuh']);
    Route::get('patients/status/dead', [PatientController::class, 'getPatientByStatusMeninggal']);
});
