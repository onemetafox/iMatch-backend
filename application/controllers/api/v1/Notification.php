<?php
defined('BASEPATH') or exit('No direct script access allowed');
require APPPATH . '/core/BaseController.php';
class Notification extends BaseController
{

    public function getNotification($user_id){
        $filter = array(
            'receiver_id'=>$user_id,
            'read_status'=> "1",
            'notification_status' => ""
        );
        $data['user'] = $this->User->select($user_id);

        $filter['notification_status'] = "Add_fan";
        $data['fan'] = $this->Notification->count($filter);
        
        $filter['notification_status'] = "Add_squad";
        $data['squad'] = $this->Notification->count($filter);

        $filter['notification_status'] = "Add_bestie";
        $data['bestie'] = $this->Notification->count($filter);

        $filter['notification_status'] = "Match_invitation";
        $data['matches'] = $this->Notification->count($filter);

        $data['pending'] = $this->db->query("SELECT COUNT(*) as count from tb_match WHERE rival_id = '$user_id' AND invitation_status IS NULL AND match_type = 'open'")->row()->count;
        
        $data['total'] = $data['fan'] + $data['squad'] + $data["matches"] + $data['bestie'] + $data['pending'];

        $post = array(
            "status" => true,
            "details"=>$data
        );
        $this->response($post);
    }

    public function setNotificationRead(){
        $filter = $this->input->post();
        $data['read_status'] = 2;
        $this->Notification->update($data, $filter);
        $this->response(array("status"=>true, "message"=>"change notification status"));
    }
    public function all(){
        $filter = $this->input->post();
        $data = $this->Notification->getAll($filter);
        $post = array(
            "status" => true,
            "details" => $data
        );
        $this->response($post);
    }
}