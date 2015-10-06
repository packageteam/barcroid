<?php

defined('BASEPATH') OR exit('No direct script access allowed');


class Transaction_model extends CI_Model {

	// public function get_records(){
	// 	return $this->db->get('tasks')->result_object();
	// }
	// public function insert($data){
	// 	$this->db->insert('tasks',$data);
	// 	return $this->db->insert_id();
	// }
	// public function update($data, $id){
	// 	return $this->db->where('id',$id)->update('tasks',$data);
	// }
	// public function delete($id){
	// 	return $this->db->where('id',$id)->delete('tasks');
	// }

	public function getItems($id){
		$this->db->where('status', 0);
		$this->db->order_by('brand_details', 'asc'); 
		$this->db->where("customer_id", $id);
		return $this->db->get('temporaryview')->result_object();
	}

	public function getItem($id){
		$this->db->where('status', 0);
		$this->db->order_by('brand_details', 'asc'); 
		$this->db->where("customer_id", $id);
		return $this->db->get('temporaryview')->result_object();
	}

	public function deletebudget($id){
		$this->db->where("customer_id", $id);
		$this->db->delete('budget');
	}

	public function gettotalproducts($id){
		$this->db->select_sum('total');
		$this->db->where("customer_id", $id);
		return $this->db->get('itemtotal')->result_array();
	}

	public function selecteddetails($id){
		$this->db->where("customer_id", $id);
		return $this->db->get('budget')->result_object();
	}

	public function getavailbleitems($name){
		$this->db->order_by('brand_details', 'asc'); 
		$this->db->like("items_name", $name);
		$this->db->or_like("brand_details", $name);
		return $this->db->get('inventory')->result_object();
	}

	public function inserttransitem($id){
		// var_dump($id);
		$this->db->insert('temporary', $id);
	}

	public function update($id, $customer_id, $qty){
		$this->db->like('customer_id', $customer_id);
		$this->db->where('item', $id);
		return $this->db->update('temporary', $qty);
	}

	public function insertitem($data){
		$this->db->insert('transaction', $data);
	}

	public function insertbudgetamnt($data){
		// $this->db->where('customer_id', $id);
		return $this->db->insert('budget', $data);
	}

	public function updatebudgetamnt($id, $data){
		$this->db->where('customer_id', $id);
		return $this->db->update('budget', $data);
	}

	public function verifybudget($id){
		$this->db->where('customer_id', $id);
		return $this->db->get('budget')->result_object();
	}

	public function verifystock($item, $eqty, $customer_id){
		$this->db->select('items_stock');
		$this->db->where('items_id', $item);
		return $this->db->get('items')->result_object();
	}

	public function updatestock($item, $docalculation){
		$this->db->where('items_id', $item);
		return $this->db->update('items', $docalculation);
	}

	public function editqty($item, $data, $customer_id){
		$this->db->where('item', $item);
		$this->db->where('customer_id', $customer_id);
		return $this->db->update('temporary', $data);
	}

	public function deleteitem($item, $customer_id){
		$this->db->where('item', $item);
		$this->db->where('customer_id', $customer_id);
		return $this->db->delete('temporary');
	}

	public function selectforqty($customer_id, $id){
		$this->db->where('customer_id', $customer_id);
		$this->db->where('item', $id);
		return $this->db->get('temporary');
	}

	public function insertonlyqty($id, $customer_id, $data){
		$this->db->where('customer_id', $customer_id);
		$this->db->where('item', $id);
		return $this->db->insert('temporary', $data);
	}

	public function submitotcashier($status, $date){
		$this->db->where('status', $status);
		$this->db->where('date', $date);
		return $this->db->get('temporary')->result_object();
	}

	public function updatestatus($customer_id, $date, $array){
		$this->db->where('customer_id', $customer_id);
		$this->db->where('date', $date);
		$this->db->update('temporary', $array);	
	}

}