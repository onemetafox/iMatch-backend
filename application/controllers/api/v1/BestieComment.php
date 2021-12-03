<?php
defined('BASEPATH') or exit('No direct script access allowed');
require APPPATH . '/core/BaseController.php';
class BestieComment extends BaseController
{

    public function add (){
        $data = $this->input->post();
        $data['commented_at'] = date("Y-m-d H:s:i");
        $result = $this->BestieComment->save($data);
        if($result){
            $post = array(
                "status" => true,
                "msg" => "Successfully Added"
            );
        }else{
            $post = array(
                "status" => false,
                "msg" => "Successfully Added"
            );
        }
        $this->response($post);

    }
    public function all(){
        $filter = $this->input->post();
        print_r($filter);
    }
}