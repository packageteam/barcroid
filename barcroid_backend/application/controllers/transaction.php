<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

class Transaction extends REST_Controller {

	// public function index_get(){ //read 
	// 	$this->load->model('Todo_model','todo');
	// 	$data  = $this->todo->get_records();
	// 	$this->response($data, 200); 
	// }
	// public function index_post(){ //create
	// 	$post_data = $this->post();
	// 	$this->load->model('Todo_model','todo');
	// 	$id = $this->todo->insert($post_data);
	// 	$this->response(array('id' => $id), 200); 
	// }
	// public function index_put(){
	// 	$id = (int) $this->get('id'); //get the id from todo/3 where 3 is the ex id
	// 	$data = $this->put();
	// 	$this->load->model('Todo_model','todo');
	// 	$id = $this->todo->update($data, $id);
	// 	$this->response(array('ok' => 'Success'), 200); 
	// }
	// public function index_delete(){
	// 	$id = (int) $this->get('id'); //get the id from todo/3 where 3 is the ex id
	// 	$this->load->model('Todo_model','todo');
	// 	$id = $this->todo->delete($id);
	// 	$this->response(array('ok' => 'Success'), 200); 
	// }
	public function index_options(){
		die();
	}

	public function index_get(){
		$id = (int) $this->get('id');
		$this->load->model('Transaction_model','tmodel');
		$data  = $this->tmodel->getItems($id);
		$this->response($data, 200); 
	}

	public function selecteddetails_get(){
		$id = (int) $this->get('id');
		$this->load->model('Transaction_model','tmodel');
		$data  = $this->tmodel->selecteddetails($id);
		$this->response($data, 200); 
	}

	public function availableitem_get(){
		$name = (string) $this->get('name');
		$this->load->model('Transaction_model','tmodel');
		$data  = $this->tmodel->getavailbleitems($name);
		$this->response($data, 200); 
	}

	public function inserttransitem_post(){
		$data = (object) $this->post();
		var_dump($data);
		// $this->load->model('Transaction_model', 'tmodel');
		// $this->tmodel->inserttransitem($data);
	}

	public function additem_post(){
		$post_data = $this->post();
		// var_dump($post_data);
		$this->load->model('Transaction_model', 'tmodel');
		$this->tmodel->insertitem($post_data);
	}
}