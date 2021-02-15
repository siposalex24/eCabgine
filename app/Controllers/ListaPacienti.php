<?php namespace App\Controllers;

class ListaPacienti extends BaseController
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
		echo view('lista_pacienti');
		echo view('templates/footer', $data);
	}

	//--------------------------------------------------------------------

}
