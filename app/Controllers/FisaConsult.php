<?php namespace App\Controllers;

class FisaConsult extends BaseController
{
	public function index()
	{	
		$data = [];

		//classic Filtering
		if(! session()->get('isLoggedIn')){
          return redirect()->to('/');
        }
        ///////////////////////////////////

		echo view('templates/header', $data);
		echo view('fisa_consult');
		echo view('templates/footer', $data);
	}

	//--------------------------------------------------------------------

}
