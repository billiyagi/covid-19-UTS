<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Patient;
use App\Http\Requests\patients\StoreRequest;
use App\Http\Requests\patients\UpdateRequest;
use voku\helper\AntiXSS;
use App\Http\Resources\PatientResource;

class PatientController extends Controller
{
    // Menampilkan semua data pasien
    public function index(Request $request, Patient $patient)
    {
        // get all data from patient
        $patients = $patient->all();

        // if data exist
        if ($patient) {
            return response()->json([
                'message' => 'List of all patients',
                'data' => PatientResource::collection($patients)
            ], 200);
        } else {
            return response()->json([
                'message' => 'Data is empty',
                'data' => PatientResource::collection($patients)
            ], 200);
        }
    }

    // Menampilkan specific dengan id data pasien
    public function show(Patient $patient, $id)
    {
        // get specific data by id
        $patient = $patient->find($id);


        // if data exist
        if ($patient) {
            return response()->json([
                'message' => 'Get detail resource',
                'data' => new PatientResource($patient)
            ], 200);
        } else {
            return response()->json([
                'message' => 'Patient not found',
                'data' => ''
            ], 404);
        }
    }

    public function store(StoreRequest $storeRequest, Patient $patient, AntiXSS $antiXSS)
    {
        // Validasi request
        $storeRequest->validated();

        // create data save it to database and clean the data with antiXSS
        $patient = $patient->create([
            'name'          =>  $antiXSS->xss_clean($storeRequest->name),
            'phone'         =>  $antiXSS->xss_clean($storeRequest->phone),
            'address'       =>  $antiXSS->xss_clean($storeRequest->address),
            'status'        =>  $antiXSS->xss_clean($storeRequest->status),
            'in_date_at'    =>  $antiXSS->xss_clean($storeRequest->in_date_at),
            'out_date_at'   =>  $antiXSS->xss_clean($storeRequest->out_date_at),
            'hospital_id'   =>  $antiXSS->xss_clean($storeRequest->hospital_id),
        ]);

        // if data exist
        if ($patient) {
            return response()->json([
                'message' => 'Patient created',
                'data' => new PatientResource($patient)
            ], 201);
        } else {
            return response()->json([
                'message' => 'Patient failed to create',
                'data' => ''
            ], 400);
        }
    }


    // update data pasien
    public function update(UpdateRequest $updateRequest, Patient $patient, AntiXSS $antiXSS, $id)
    {

        // temukan data pasien berdasarkan id
        $patient = $patient->find($id);

        // validasi Request
        $updateRequest->validated();

        // update data pasien jika kosong maka tetap menggunakan data sebelumnya
        $patient->update([
            'name'          => $antiXSS->xss_clean($updateRequest->name) ?? $patient->name,
            'phone'         => $antiXSS->xss_clean($updateRequest->phone) ?? $patient->phone,
            'address'       => $antiXSS->xss_clean($updateRequest->address) ?? $patient->address,
            'status'        => $antiXSS->xss_clean($updateRequest->status) ?? $patient->status,
            'in_date_at'    => $antiXSS->xss_clean($updateRequest->in_date_at) ?? $patient->in_date_at,
            'out_date_at'   => $antiXSS->xss_clean($updateRequest->out_date_at) ?? $patient->out_date_at,
            'hospital_id'   => $antiXSS->xss_clean($updateRequest->hospital_id) ?? $patient->hospital_id,
        ]);

        if ($patient->save()) {
            return response()->json([
                'message' => 'Patient updated',
                'data' => new PatientResource($patient)
            ], 200);
        } else {
            return response()->json([
                'message' => 'Patient failed to update',
                'data' => ''
            ], 400);
        }
    }


    // Menghapus data pasien dengan id
    public function destroy($id, Patient $patient)
    {
        // temukan data pasien berdasarkan id
        $patient = $patient->where('id', $id)->first();

        // hapus data pasien
        $patient->delete();

        // if data exist
        if ($patient) {
            return response()->json([
                'message' => 'Patient deleted',
                'data' => $patient
            ], 200);
        } else {
            return response()->json([
                'message' => 'Patient failed to delete',
                'data' => ''
            ], 400);
        }
    }


    // mencari data pasien dengan nama
    public function search($name)
    {
        // Menemukan data pasien
        $patient = Patient::where('name', 'like', '%' . $name . '%')->get();

        if ($patient) {
            return response()->json([
                'message' => 'Patient found',
                'data' => PatientResource::collection($patient)
            ], 200);
        } else {
            return response()->json([
                'message' => 'Patient not found',
                'data' => ''
            ], 404);
        }
    }


    // Menampilan data pasien dengan status positif/reaktif
    public function getPatientByStatusReaktif()
    {

        // Mengambil data dengan status pasien reaktif/positif
        $patient = Patient::where('status', 'reaktif')->get();

        if ($patient) {
            return response()->json([
                'message' => 'Patient found',
                'data' => PatientResource::collection($patient)
            ], 200);
        } else {
            return response()->json([
                'message' => 'Patient not found',
                'data' => ''
            ], 404);
        }
    }

    // Menampilan data pasien dengan status sembuh
    public function getPatientByStatusSembuh()
    {
        $patient = Patient::where('status', 'sembuh')->get();

        if ($patient) {
            return response()->json([
                'message' => 'Patient found',
                'data' => PatientResource::collection($patient)
            ], 200);
        } else {
            return response()->json([
                'message' => 'Patient not found',
                'data' => ''
            ], 404);
        }
    }


    // Menampilan data pasien dengan status meninggal
    public function getPatientByStatusMeninggal()
    {
        $patient = Patient::where('status', 'meninggal')->get();

        if ($patient) {
            return response()->json([
                'message' => 'Patient found',
                'data' => PatientResource::collection($patient)
            ], 200);
        } else {
            return response()->json([
                'message' => 'Patient not found',
                'data' => ''
            ], 404);
        }
    }
}
