<?php

namespace App\Controllers;

use CodeIgniter\I18n\Time;
use App\Models\LetterModel;
use App\Models\CabinetModel;
use App\Models\UserModel;
use App\Models\PatientModel;
use App\Models\CountyModel;
use App\Models\CityModel;
use App\Models\ConsultModel;
use App\Models\ConsultAnaModel;
use App\Models\ExaminationModel;



class MedicalRecord extends BaseController
{

	public function index()
	{
		$db = db_connect();
		$model = new LetterModel();
		$modelcab = new CabinetModel();
		$modeluser = new UserModel();
		$modelpacient = new PatientModel();
		$modelcounty = new CountyModel();
		$modelcity = new CityModel();
		$modelconsult = new ConsultModel();
		$modelExam = new ExaminationModel();
		$modelanalyses = new ConsultAnaModel($db);

		$data = [
			'patients' => $modelpacient->getPatient('1'),
			'examination' => $modelExam->getAllExam(),
		];
		$data['patient_city'] = $modelcity->getCity($data['patients']['id_city']);
		$data['patient_county'] = $modelcounty->getCounty($data['patients']['id_city']);
		$data['consult'] = $modelconsult->getConsult($data['patients']['id_patient']);
		$data['last_vizit'] = end($data['consult']);
		//var_dump($data['last_consult']);
		//die();
		//foreach ($data['consult'] as $consult)
		//	$consult['date'] = date('d-m-Y', strtotime($consult['date']));
		//foreach ($data['consult'] as $consult)
		//var_dump($data['consult']);
		//die();
		$rules = [
			'antecedents' => ['rules' => 'required', 'label' => ' Medical antecedents'],
			'last_period' => ['rules' => 'required', 'label' => ' Last period date'],
			'menstrual_cycle' => ['rules' => 'required', 'label' => 'Menstrual cycle'],
			'births' => ['rules' => 'required|integer', 'label' => 'Number of births'],
			'abortions' => ['rules' => 'required|integer', 'label' => 'Number of abortios'],
			'consult_reason' => ['rules' => 'required', 'label' => 'Consult reason'],
			'diagnosis' => ['rules' => 'required', 'label' => 'Diagnosis'],
			'observations' => ['rules' => 'required', 'label' => 'Observations'],
			'recommendations' => ['rules' => 'required', 'label' => 'Recommendations'],
			'treatment' => ['rules' => 'required', 'label' => 'Treatmen'],
		];

		/*if ($this->request->getMethod() == 'post') {
			if ($this->validate($rules)) {
				return redirect()->to('/medicalrecord');
				//Then do database insertion
				// Login user
			} else {
				$data['validation'] = $this->validator;
			}
		}*/


		if ($this->request->getMethod() === 'post' && $this->validate($rules)) {
			if ((isset($_POST['climax'])) && ($_POST['climax'] = '1')) {
				$data['checkedbox'] = ($_POST['climax']);
			} else $data['checkedbox'] = 0;

			$modelconsult->save([
				'antecedents' => $this->request->getPost('antecedents'),
				'last_period' => $this->request->getPost('last_period'),
				'climax' => $data['checkedbox'],
				/*'menstrual_cycle' => $this->request->getPost('menstrual_cycle'),
				'consult_reason' => $this->request->getPost('consult_reason'),
				'observations' => $this->request->getPost('observations'),
				'recommendations' => $this->request->getPost('recommendations'),*/
			]);
			$data['last_vizit'] = end($data['consult']);
			return redirect()->to('/medicalrecord');
		}
		echo view('templates/header', $data);
		echo view('medical_report', $data);
		echo view('templates/footer');
	}

	//--------------------------------------------------------------------

}
