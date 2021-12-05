<?php
defined('BASEPATH') or exit('No direct script access allowed');
require APPPATH . '/core/BaseController.php';
class ActionLog extends BaseController
{

    function all (){
        $filter = $this->input->post();
        $data = $this->ActionLog->all($filter);
        $post =array (
            "status" => true,
            "details" => $data
        );
        $this->response($post);
    }
}