<?php
defined('BASEPATH') or exit('No direct script access allowed');
require APPPATH . '/core/BaseController.php';
class Bestie extends BaseController
{

    public function add_bestie()
    {
        $data = $this->input->post();
        $count = $this->Bestie->count($data);
        if($count > 0){
            $post = array(
                "status" => false,
                "message" => "Already Added"
            );
        }else{
            $bestie_id = $this->Bestie->insert($data);
            
            $from = $this->User->select($data['req_from']);
            $to = $this->User->select($data['req_to']);
            
            $token = $to->device_token;
            $message = $from->name . ' ' . 'wants to add you as ' . $data['category'];
            $type = $to->device_type;
            $notification = array(
                'sender_id' => $data['req_from'],
                'receiver_id' => $data['req_to'],
                'message' => $message,
                'notification_status' => 'Add_' .$data['category'],
                'request_id' => $bestie_id
            );
            $this->Notification->save($notification);
            $this->push($token, $message, $type);
            $post = array(
                "status" => true,
                "message" => "Successfully Added"
            );
        }
        $this->response($post);
    }
}