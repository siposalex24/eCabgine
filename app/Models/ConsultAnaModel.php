<?php

namespace App\Models;

use CodeIgniter\Database\ConnectionInterface;

class ConsultAnaModel
{

    protected $db;

    public function __construct(ConnectionInterface &$db)
    {
        $this->db = &$db;
    }

    function getAnalyzes($id_consult)
    {
        $builder = $this->db->table('consult_analysis');
        $builder->join('analysis', 'consult_analysis.id_analyses = analysis.id_analysis')
            ->where(['id_consult' => $id_consult]);
        $analysis = $builder->get()->getResult('array');
        return $analysis;
    }
}
