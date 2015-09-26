<?php

defined('BASEPATH') OR exit('No direct script access allowed');


class Todo_model extends CI_Model {

	public function get_records(){
		return $this->db->get('tasks')->result_object();
	}
	public function insert($data){
		$this->db->insert('tasks',$data);
		return $this->db->insert_id();
	}
	public function update($data, $id){
		return $this->db->where('id',$id)->update('tasks',$data);
	}
	public function delete($id){
		return $this->db->where('id',$id)->delete('tasks');
	}
}