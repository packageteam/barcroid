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
		// return $this->db->get('transactionview')->result_object();

		$this->db->where("customer_id", $id);
		return $this->db->get('transactionview')->result_object();
	}

	public function selecteddetails($id){
		$this->db->where("customer_id", $id);
		return $this->db->get('budget')->result_object();
	}

	public function getavailbleitems($name){
		$this->db->like("items_name", $name);
		$this->db->or_like("brand_details", $name);
		return $this->db->get('inventory')->result_object();
	}

	public function inserttransitem($data){
		
	}

	public function insertitem($data){
		$this->db->insert('transaction', $data);
	}

}