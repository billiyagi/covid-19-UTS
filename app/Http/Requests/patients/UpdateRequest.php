<?php

namespace App\Http\Requests\patients;

use Illuminate\Foundation\Http\FormRequest;

class UpdateRequest extends FormRequest
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
            'name'          =>  'string',
            'phone'         =>  'string',
            'address'       =>  'string',
            'status'        =>  'in:reaktif,sembuh,meninggal',
            'in_date_at'    =>  'date',
            'out_date_at'   =>  'date',
            'hospital_id'   =>  'exists:hospitals,id'
        ];
    }
}
