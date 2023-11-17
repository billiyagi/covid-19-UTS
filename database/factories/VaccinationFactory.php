<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Database\Factories\PatientFactory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Vaccination>
 */
class VaccinationFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'patient_id'    =>  PatientFactory::new(),
            'dose'          =>  fake()->numberBetween(1, 3)
        ];
    }
}
