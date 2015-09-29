<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/*
* USER CONTROLLER
* Does:
*	-authentication of user [admin/user]
* 	-redirects user to their perspective home 
*	-login/logout/adduser/delete/update
*/


class User extends CI_Controller {

	public function __construct ()
	{
		parent::__construct();
		date_default_timezone_set('Asia/Manila');
		$this->load->library('form_validation');
		$this->load->model('user_model');
	}


	//-------------------------------------- DANICA's FUNCTIONS --------------------//
	public function login ()
	{
		$username=$this->input->post('username');
		$password=md5($this->input->post('password'));

		$result=$this->user_model->login($username,$password);		
		
		    if(($this->session->userdata('user_name')=="admin" ))
			{
				$this->profile();
			}elseif (($this->session->userdata('user_name')!="" )) {
				// redirect('user');
				echo "user";
			
			}else{			
				echo "ERROR";
			}//end of else		
	} //end of login function

	public function profile ()
	{
		echo "admin";
	}

	public function registration ()
    {
        // $this->form_validation->set_error_delimiters('<span style="color:red;">','</span>');
        //     if($this->form_validation->run('user') == FALSE)
        //     {
        //         echo "invalid";
        //     }
        //     else
        //     {
        //         $data=array(
        //             'firstname'  => $this->input->post('fname'),
        //             'lastname'   => $this->input->post('lname'),
        //             'username'   => $this->input->post('username'),
        //             'email'      => $this->input->post('email'),
        //             'password'   => md5($this->input->post('password')),
        //             'contact'    => $this->input->post('contact'),
        //             'created_on' => date('Y-m-d H:i:s'),
        //             'updated_on' => date('Y-m-d H:i:s')
        //             );
        //         $message = $this->user_model->add_user($data);
        //         if($message) {
        //             	echo "success";
        //         	}else{
        //                 echo "failed";
        //             }
        //     }
    }

	
}
