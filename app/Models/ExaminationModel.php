<?php

namespace App\Models;

use CodeIgniter\Model;

class ExaminationModel extends Model
{
    protected $table = 'examinations';

    public function getAllExam()
    {

        return $this->get()->getResult('array');
    }
}
