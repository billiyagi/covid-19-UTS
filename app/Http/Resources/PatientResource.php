<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class PatientResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id'            => $this->id,
            'name'          => $this->name,
            'phone'         => $this->phone,
            'address'       => $this->address,
            'status'        => $this->status,
            'in_date_at'    => $this->in_date_at,
            'out_date_at'   => $this->out_date_at,
            'hospital_id'   => $this->hospital_id,
            'hospital_name' => $this->hospital->name,
            'created_at'    => $this->created_at,
            'updated_at'    => $this->updated_at_at,
        ];
    }
}
