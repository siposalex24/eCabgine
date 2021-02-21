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

class Letter extends BaseController
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
		$modelanalyses = new ConsultAnaModel($db);

		$data = [
			'medical_letter' => $model->getLetter('1'),
			'cabinet' => $modelcab->getCabinet('Gine3'),
			'user' => $modeluser->getUser('doctor@gmail.com'),
			'patients' => $modelpacient->getPatient('1'),
			//'county' => $modelcounty->getCounty('1'),
			'city' => $modelcity->getCity('1'),
			'consult' => $modelconsult->getConsult('1'),
			//'consult_analysis' => $modelanalyses->getAnalyzes(),
			'today' => new Time('now', 'Europe/Bucharest'),
		];
		$data['county'] = $modelcounty->getCounty($data['patients']['id_county']);
		$data['consult_analysis'] = $modelanalyses->getAnalyzes($data['consult']['id_consult']);
		//var_dump($modelcab->getCabinet('Gine3'));
		// die();
		//$data['logo'] = \Config\Services::image()
		//	->withFile($data['cabinet']['image_path']);
		$time = Time::parse($data['patients']['date_of_birth']);
		$data['age'] = $time->getAge();


		if ($this->request->getMethod() === 'post' && $this->validate([
			'consult_reason' => 'required',
			'observations' => 'required',
			'recommendations' => 'required'
		])) {
			$idcons = $this->request->getPost('id_consult');
			$modelconsult->update($idcons, [
				'consult_reason' => $this->request->getPost('consult_reason'),
				'observations' => $this->request->getPost('observations'),
				'recommendations' => $this->request->getPost('recommendations'),
			]);
			$data['consult'] = $modelconsult->getConsult('1');
			echo view('templates/header');
			echo view('medicalletter/printletter', $data);
			echo view('templates/footer');
		} else {
			echo view('templates/header');
			echo view('medicalletter/letterform', $data);
			echo view('templates/footer');
		}
	}
}
