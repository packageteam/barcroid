<?php


$config = array(
    'user' => array(
        array('field' => "fname", 'label' => "Firstname", 'rules' => "required|trim|xss_clean"),
        array('field' => "lname", 'label' => "Lastname", 'rules' => "required|trim|xss_clean"),
        array('field' => "username", 'label' => "Username", 'rules' => "required|trim|is_unique[users.username]|min_length[4]|callback_username_check|xss_clean"),
       	array('field' => "email", 'label' => "Email", 'rules' => "required|email"),
        array('field' => "password", 'label' => "Password", 'rules' => "required|trim|max_length[35]|min_length[4]"),
    	array('field' => "contact", 'label' => "Contact", 'rules' => "required|trim"),
    	array('field' => "address", 'label' => "Address", 'rules' => "required|trim"),
    )
);