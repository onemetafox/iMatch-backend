<?php
defined('BASEPATH') or exit('No direct script access allowed');
require APPPATH . '/core/BaseController.php';
class BestieLike extends BaseController
{
    public function add(){
        $data = $this->input->post();
        print_r($data);
    }
}