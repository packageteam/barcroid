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
		$data2 = $this->tmodel->gettotalproducts($id);
		$this->response($data, 200); 
	}

	public function viewitem_get(){
		$id = (int) $this->get('id');
		$this->load->model('Transaction_model','tmodel');
		$data  = $this->tmodel->getItem($id);
		$data2 = $this->tmodel->gettotalproducts($id);
		$this->response($data, 200); 
	}

	public function totalitem_get(){
		$id = (int) $this->get('id');
		$this->load->model('Transaction_model','tmodel');
		$data = $this->tmodel->gettotalproducts($id);
		// $sum = json_decode($data);
		var_dump($data);
		// $this->response(array('total', $data), 200); 
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
		$this->response(array('ok' => 'Success'), 200);
	}

	public function TransactionItem_get(){
		date_default_timezone_set('Asia/Manila');
		$id = (int) $this->get('item');
		$data = array('item' => $id, 'customer_id' => 2, 'date' => date('Y-m-d'));
		$this->load->model('Transaction_model', 'tmodel');
		$this->tmodel->inserttransitem($data);
	}

	public function additem_post(){
		$post_data = $this->post();
		$this->load->model('Transaction_model', 'tmodel');
		$this->tmodel->insertitem($post_data);
	}

	public function ItemQty_get(){
		$id = (int) $this->get('id');
		$customer_id = (int) $this->get('customer_id');
		$qty = (int) $this->get('qty');
		if($qty == 0){
			$finalqty = 1;
		}else{
			$finalqty = $qty;
		}
		$data = array('qty' => $finalqty);
		$this->load->model('Transaction_model','tmodel');
		$query = $this->tmodel->selectforqty($customer_id, $id);
		if($query){
			$this->tmodel->update($id, $customer_id, $data);
			$this->response(array('Mesaage' => 'Ok'), 200);
		}else{
			$this->tmodel->insertonlyqty($id, $customer_id, $data);
			$this->response(array('Mesaage' => 'Ok'), 200);
		}
	}

	public function budgetedamnt_get(){
		$amnt = (int) $this->get('amnt');
		$id = 2;
		$this->load->model('Transaction_model','tmodel');
		$verify = $this->tmodel->verifybudget($id);
			if($verify == NULL){ //insert
				$data = array('budget_amnt' => $amnt, 'customer_id' => $id);
				$this->tmodel->insertbudgetamnt($data);
				$this->response(array('ok' => 'Success'), 200);
			}else{ //update
				$data = array('budget_amnt' => $amnt);
				$this->tmodel->updatebudgetamnt($id, $data);
				$this->response(array('ok' => 'Success'), 200);
			}
	}

	public function stock_get(){
		$item = (int) $this->get('item');
		$eqty = (int) $this->get('eqty');
		$customer_id = (int) $this->get('customer_id');
		$this->load->model('Transaction_model','tmodel');
		$verify = $this->tmodel->verifystock($item, $eqty, $customer_id);
		$getarraystock = $verify[0]->items_stock;
		$docalculation = $getarraystock - $eqty;
		$array = array('items_stock' => $docalculation);
		$this->tmodel->updatestock($item, $array);
		$this->response(array('ok' => 'Success'), 200);
	}

	public function qty_get(){
		$qty = (int) $this->get('qty');
		$item = (int) $this->get('item');
		$customer_id = 2;
		$data = array('qty' => $qty);
		$this->load->model('Transaction_model', 'tmodel');
		$this->tmodel->editqty($item, $data, $customer_id);
		$this->response(array('ok' => 'Success'), 200);
	}

	public function item_get(){
		$item = $this->get('item');
		$customer_id = 2;
		$this->load->model('Transaction_model', 'tmodel');
		$this->tmodel->deleteitem($item, $customer_id);
		$this->response(array('ok' => 'Success'), 200, $item);
	}

	public function submitotcashier_get(){
		$status = $this->get('status');
		$date = date('Y-m-d');
		$customer_id = 2;
		$array = array("status" => 1);
		$this->load->model('Transaction_model', 'tmodel');
		$this->tmodel->updatestatus($customer_id, $date, $array);
		$this->tmodel->deletebudget($customer_id);
		$query = $this->tmodel->submitotcashier($status, $date);
		var_dump($query);
	}
}