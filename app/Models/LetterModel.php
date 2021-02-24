<?php

namespace App\Models;

use CodeIgniter\Model;

class LetterModel extends Model
{
    protected $table = 'medical_letter';

    public function getLetter($id_patient)
    {
        return $this->asArray()
            ->where(['id_patient' => $id_patient])
            ->first();
    }
}
