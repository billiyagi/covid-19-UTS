<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Model>
 */
class PartialAddressFactory extends Factory
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
            'province_id'   =>  fake()->numberBetween(1, 10),
            'regency_id'   =>  fake()->numberBetween(1, 10),
            'district_id'   =>  fake()->numberBetween(1, 10),
        ];
    }
}
