<?php

namespace App\Models;

use CodeIgniter\Model;


class PatientModel extends Model
{
    protected $table = 'patients';

    protected $primaryKey = 'id_patient';

	protected $allowedFields = ['first_name', 'last_name', 'identification_number'];

    public function getPatient($id_patient)
    
    {
        return $this->asArray()
            -> where(['id_patient'=> $id_patient])
            ->first();
    }
} 





?>