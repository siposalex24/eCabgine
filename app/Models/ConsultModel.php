<?php

namespace App\Models;

use CodeIgniter\Model;

class ConsultModel extends Model
{
    protected $table = 'consult';
    protected $primaryKey = 'id_consult';
    protected $allowedFields = ['consult_reason', 'observations', 'recommendations',];

    public function getConsult($id_consult)
    {
        return $this->asArray()
            ->where(['id_consult' => $id_consult])
            ->first();
    }
}
