<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Testing\Fakes\Fake;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Model>
 */
class PatientFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {

        // Set region to Indonesia
        fake()->locale('id_ID');

        return [
            'name'      =>  fake()->name(),
            'phone'     =>  fake()->phoneNumber(),
            'address'   =>  fake()->address(),
            'status'    =>  fake()->randomElement(['reaktif', 'sembuh', 'meninggal']),
            'in_date_at'    =>  fake()->date(),
            'out_date_at'   =>  fake()->date(),
            'partial_address_id'    =>  fake()->numberBetween(1, 9),
            'hospital_id'   =>  fake()->numberBetween(1, 9),
        ];
    }
}
