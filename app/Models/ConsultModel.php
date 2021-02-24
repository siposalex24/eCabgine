<?php

namespace App\Models;

use CodeIgniter\Model;

class ConsultModel extends Model
{
    protected $table = 'consult';
    protected $primaryKey = 'id_consult';
    protected $allowedFields = [
        'id_user',
        'id_patient',
        'date',
        'last_period',
        'climax',
        'menstrual_cycle',
        'births',
        'abortions',
        'antecendets',
        'consult_reason',
        'observations',
        'id_exam',
        'diagnosis',
        'recommendations',
        'id_anal',
        'treatment'
    ];

    public function getConsult($id_patient)
    {

        return $this->asArray()
            ->where(['id_patient' => $id_patient])
            ->get()->getResult('array');
    }
}
