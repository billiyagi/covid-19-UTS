<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Database\Factories\UserFactory;
use Database\Factories\PatientFactory;
use Illuminate\Support\Facades\Hash;
use App\Models\Hospital;
use App\Models\Vaccination;
use Database\Factories\VaccinationFactory;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {

        UserFactory::new()->create([
            'name'      => 'Billy',
            'email'     => 'febry@billiyagi.space',
            'password'  =>  Hash::make('root'),
        ]);

        // // Seed hospital data
        $hospitals = [
            'RS Umum Az-Zuhra',
            'RS Umum Daerah Dr. Soetomo',
            'RSUD Pasar Minggu',
            'RS Harapan Sehati',
            'RS Umum Dr. Iqbali Taufan',
            'RS Mata Bandung Eye Center',
            'RS Umum Daerah Fakfak',
            'RS Umum Daerah Bengkalis',
            'RS Umum Melati Desa Pontianak',
        ];

        foreach ($hospitals as $hospital) {
            Hospital::factory()->create([
                'name'      => $hospital,
            ]);
        }

        // PatientFactory::new()->count(180)->create();

        // Seed vaccination data
        // Vaccination::factory()->count(180)->create();

        VaccinationFactory::new()->count(180)->create();
    }
}
