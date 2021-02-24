<?php namespace App\Models;

use CodeIgniter\Model;

class PatientModel extends Model
{
    protected $table = 'patients';

    public function getPatient($id_patient)
    {
        return $this->asArray()
            -> where(['id_patient'=> $id_patient])
            ->first();
    }
}