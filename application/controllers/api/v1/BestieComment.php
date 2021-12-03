<?php
defined('BASEPATH') or exit('No direct script access allowed');
require APPPATH . '/core/BaseController.php';
class BestieComment extends BaseController
{

    public function add (){
        $data = $this->input->post();
        print_r($data);
    }
    public function all(){
        $filter = $this->input->post();
        print_r($filter);
    }
}