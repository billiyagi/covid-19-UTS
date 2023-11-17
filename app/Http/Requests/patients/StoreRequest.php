<?php

namespace App\Http\Requests\patients;

use Illuminate\Foundation\Http\FormRequest;

class StoreRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'name'          =>  'required|string',
            'phone'         =>  'required|string',
            'address'       =>  'required|string',
            'status'        =>  'required|in:reaktif,sembuh,meninggal',
            'in_date_at'    =>  'required|date',
            'out_date_at'   =>  'required|date',
            'hospital_id'   =>  'required|exists:hospitals,id'
        ];
    }
}
