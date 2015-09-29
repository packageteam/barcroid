<?php

/*
*	USER_MODEL
*	Does:
*		-login authentication
*		-add user
*		-getdatas
*/

class User_model extends CI_Model{

    public function login($username,$password)
    {
        $this->db->where("username",$username);
        $this->db->where("password",$password);
            
        $query=$this->db->get("user");
        if($query->num_rows()>0)
        {
            foreach($query->result() as $rows)
            {
                //add all data to session
                $newdata = array(
                        'user_id'       => $rows->id,
                        'user_name'     => $rows->username,
                        'logged_in'     => TRUE,
                   );
            }
                $this->session->set_userdata($newdata);
                return true;            
        }
        return false;
    } //end of login function

    
    public function add_user($data)
    {
        $this->db->insert('user',$data);
        return $this->db->affected_rows();
    }


}
