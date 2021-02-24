<?php

namespace App\Models;

use CodeIgniter\Database\ConnectionInterface;

class ConsultExamModel
{

    protected $db;

    public function __construct(ConnectionInterface &$db)
    {
        $this->db = &$db;
    }

    function getExam($id_consult)
    {
        $builder = $this->db->table('consult_examination');
        $builder->join('examinations', 'consult_examination.id_exam = examinations.id_examination')
            ->where(['id_consult' => $id_consult]);
        $analysis = $builder->get()->getResult('array');
        return $analysis;
    }
}
