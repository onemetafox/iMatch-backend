<?php
defined('BASEPATH') or exit('No direct script access allowed');

require APPPATH . '/core/BaseController.php';

class User extends BaseController
{

    public function __construct()
    {   
        parent::__construct();
        $this->load->model('UserModel');
    }
    public function register()
    {
        $name = $this->input->post('name');
        $phone = $this->input->post('phone');
        $email = $this->input->post('email');
        $password = $this->input->post('password');
        $uni_name = $this->input->post('university');
        $isocode = $this->input->post('code');
        $image = $this->input->post('profile_image');
        $device_token = $this->input->post('device_token');
        $device_type = $this->input->post('device_type');
        $long = $this->input->post('long');
        $lat = $this->input->post('lat');
        $data = array(
            'name'  => $name,
            'phone' => $phone,
            'email'  => $email,
            'password' => base64_encode($password),
            'university_name'  => $uni_name,
            'isocode'  => $isocode,
            'profile_pic' => $image,
            'device_token' => $device_token,
            'device_type' => $device_type
            // 'latitude' => $long,
            // 'longitude' => $lat
        );
        $result = $this->UserModel->register($data);
        if (!empty($result)) {
            $post = array(
                'status'  => true,
                'message' => 'success',
                'details' => $result

            );
        } else {
            $post = array(
                'status'  => false,
                'message' => 'user already existing',
                'details' => []
            );
        }

        echo  json_encode($post);
    }

    public function login()
    {
        $user_data = $this->UserModel->login();
        if ($user_data == "notexist") {
            $data = array(
                'status'  => false,
                'message' => 'invalid email id',
                'details' => []
            );
        } else {
            if (!empty($user_data)) {
                $data = array(
                    'status'  => true,
                    'message' => 'success',
                    'details' => $user_data

                );
            } else {
                $data = array(
                    'status'  => false,
                    'message' => 'invalid email id or password',
                    'details' => []
                );
            }
        }
        $this->response($data);
    }
    public function forgotpassword()
    {
        $email = $this->input->post('email');
        $this->load->config('email');
        $this->load->library('email');

        $from = $this->config->item('smtp_user');
        $to = $this->input->post('to');
        $subject = "test subject";
        $message = "test msg";

        $this->email->set_newline("\r\n");
        $this->email->from($from);
        $this->email->to($email);
        $this->email->subject($subject);
        $this->email->message($message);

        if ($this->email->send()) {
            echo 'Your Email has successfully been sent.';
        } else {
            show_error($this->email->print_debugger());
        }
        die();
        //  _______________________________________________________________
        // $this->load->library('email');
        // // configure the email setting
        // $email = "raveena.sics@gmail.com";
        // $config['mailtype'] = 'html';
        // $config['charset'] = 'iso-8859-1';
        // $config['wordwrap'] = TRUE;
        // $config['newline'] = "\r\n"; //use double quotes
        // $this->email->initialize($config);
        // $this->email->from('no-reply@itjobcell.com', 'test');
        // $this->email->to($email);
        // $this->email->subject('test');
        // $message = 'testmail';
        // $this->email->message($message);
        // $result = $this->email->send();
        // if ($result == true) {
        //     echo 'Your Email has successfully been sent....';
        // } else {

        //     show_error($this->email->print_debugger());
        // }
        // die();

        // $alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
        // $pass = array(); //remember to declare $pass as an array
        // $alphaLength = strlen($alphabet) - 1; //put the length -1 in cache
        // for ($i = 0; $i < 8; $i++) {
        //     $n = rand(0, $alphaLength);
        //     $pass[] = $alphabet[$n];
        // }
        // $password = implode($pass);
        // $user_data = $this->UserModel->forget_password($email, $password);
        // if ($user_data == true) {

        //     $data = array(
        //         'status'  => true,
        //         'message' => 'Mail Sent'

        //     );
        // } else {
        //     $data = array(
        //         'status'  => false,
        //         'message' => 'invalid user'
        //     );
        // }
        // echo  json_encode($data);
    }
    public function Listusers()
    {
        $user_data['name'] = $this->UserModel->list_users();
        // $user_data['userdetails'] = $this->UserModel->listusers();
        if (!empty($user_data)) {
            $data = array(
                'status'  => true,
                'message' => 'success',
                'details' => $user_data

            );
        } else {
            $data = array(
                'status'  => false,
                'message' => 'no data existing',
                'details' => []
            );
        }
        echo  json_encode($data);
    }
    public function profile()
    {

        $result = $this->UserModel->updateprofile();
        if (!empty($result)) {
            $post = array(
                'status'  => true,
                'message' => 'success',
                'details' => $result

            );
        } else {
            $post = array(
                'status'  => false,
                'message' => 'failed',
                'details' => []
            );
        }

        echo  json_encode($post);
    }
    public function profile_pic()
    {
        $config['upload_path']   = './uploads/profile_image';
        $config['allowed_types'] = 'gif|jpg|png|jpeg';
        $config['encrypt_name']  = true;
        $this->load->library('upload', $config);
        if (!$this->upload->do_upload('profile_pic')) {
            $error = array('error' => $this->upload->display_errors());
            // print_r($error);
            $errors = array(
                'status'        => false,
                'error' => 'You did not select a file to upload.'
            );
            echo  json_encode($errors);
        } else {

            //file is uploaded successfully
            $upload_data = $this->upload->data();
            //get the uploaded file name
            $image = $upload_data['file_name'];
        }
        if (!empty($image)) {
            $user_data = $this->UserModel->profilepicupdate($image);
        }
        
        if (!empty($user_data)) {
            if ($user_data == "success") {
                $data = array(
                    'status'        => true,
                    'message'       => 'success',
                    'details'       => $user_data

                );
            } else {
                $data = array(
                    'status'        => false,
                    'message'       => 'failed',
                    'details'       => (object)[]
                );
            }
            echo  json_encode($data);
        }
    }
    public function get_pending_match($user_id){
        $result = $this->UserModel->getPendingMatch($user_id);
        if (!empty($result)) {
            $post = array(
                'status'  => true,
                'message' => 'success',
                'details' => $result

            );
        } else {
            $post = array(
                'status'  => false,
                'message' => 'failed',
                'details' => []
            );
        }

        echo  json_encode($post);
    }
    public function get_profile_pic($userid)
    {

        $result = $this->UserModel->getprofilepic($userid);
        if (!empty($result)) {
            $post = array(
                'status'  => true,
                'message' => 'success',
                'details' => $result

            );
        } else {
            $post = array(
                'status'  => false,
                'message' => 'failed',
                'details' => []
            );
        }

        echo  json_encode($post);
    }

    public function get_notification()
    {
        $result = $this->UserModel->get_notification();
        if (!empty($result)) {
            $post = array(
                'status'  => true,
                'message' => 'success',
                'details' => $result
            );
        } else {
            $post = array(
                'status'  => false,
                'message' => 'failed',
                'details' => []
            );
        }
        echo  json_encode($post);
    }
    public function startPendingMatch(){
        $matchid = $this->input->post('matchId');
        $result = $this->UserModel->startPendingMatch($matchid);
        if ($result == 'success') {
            $post = array(
                'status'  => true,
                'message' => 'success',
                'details' => $result
            );
        }
        echo  json_encode($post);
    }
    public function accept_or_reject()
    {
        $result = $this->UserModel->accept_or_reject();
        if ($result == "success") {
            $post = array(
                'status'  => true,
                'message' => 'success'
            );
        } else {
            $post = array(
                'status'  => false,
                'message' => 'failed'
            );
        }
        echo  json_encode($post);
    }
    public function Listbesties()
    {
        $id = $this->input->post('id');
        $user_data['besties'] = $this->UserModel->list_besties($id);
        $user_data['squad'] = $this->UserModel->list_squad($id);
        $user_data['fan'] = $this->Fan->fanList($id, "fan");
        $user_data['fan_of'] = $this->Fan->fanList($id, "fan_of");
        if (!empty($user_data)) {
            $data = array(
                'status'  => true,
                'message' => 'success',
                'details' => $user_data

            );
        } else {
            $data = array(
                'status'  => false,
                'message' => 'no data existing',
                'details' => []
            );
        }
        echo  json_encode($data);
    }
    public function statusbar()
    {
        $result = $this->UserModel->statusbar();
        if (!empty($result)) {
            $post = array(
                'status'  => true,
                'message' => 'Success',
                'details' => $result
            );
        } else {
            $post = array(
                'status'  => false,
                'message' => 'failed',
                'details' => []
            );
        }

        echo  json_encode($post);
    }
    public function GetStatus()
    {
        $result['story'] = $this->UserModel->getstatus();
        $result['letter'] = $this->UserModel->getstatus_letter();
        $result['slogan'] = $this->UserModel->getstatus_slogan();
        
        $link = $this->UserModel->getuploadfile();
        $total_like_count = $this->UserModel->gettotallikecount();
        $total_comment_count = $this->UserModel->gettotalcommentcount();
        if (!empty($result)) {
            $post = array(
                'status'  => true,
                'message' => 'success',
                'details' => $result,
                'link' => $link,
                'total_comment_count'=>$total_comment_count,
                'total_like_count'=>$total_like_count
            );
        } else {

            $post = array(
                'status'  => false,
                'message' => 'failed',
                'details' => [],
                'link' => $link
            );
        }
        echo  json_encode($post);
    }
    public function MatchFileUpload()
    {
        $config['upload_path']   = './uploads/Matchuploads';
        $config['allowed_types'] = '*';
        $config['encrypt_name']  = true;
        $this->load->library('upload', $config);
        if (!$this->upload->do_upload('matchfile')) {
            $error = array('error' => $this->upload->display_errors());
            echo  json_encode($error);
        } else {
            $upload_data = $this->upload->data();
            $filename = $upload_data['file_name'];
        }
        $data['matchid'] = $this->input->post('match_id');
        $data['user_uploaded'] = $this->input->post('userid');
        $data['filename'] = $filename;
        $data['filetype'] = 'file';
        $data['created_at'] = date("Y-m-d H:s:i");
        $results = $this->UserModel->savefile($data);
        // if (!empty($filename)) {
        // $ex_result = explode(".", $filename);
        // $extension = $ex_result[1];
        //     $result = $this->UserModel->match_fileupload($filename);
        //     // print_r($result);die();
        //     if (!empty($result)) {
        //         if ($result == "success") {
        //             $post = array(
        //                 'status'  => true,
        //                 'message' => 'File Uploaded',
        //                 'file_extension'=>$extension
        //             );
        //         } else if ($result == "fail") {
        //             $post = array(
        //                 'status'  => false,
        //                 'message' => 'Failed'
        //             );
        //         } else if ($result == "notexist") {
        //             $post = array(
        //                 'status'  => false,
        //                 'message' => 'Match Does not exist'
        //             );
        //         } else {
        //             $post = array(
        //                 'status'  => true,
        //                 'message' => 'File Uploaded',
        //                 'upload_details' => $result,
        //                 'file_extension'=>$extension
        //             );
        //         }
        //     } else {
        //         $post = array(
        //             'status'  => false,
        //             'message' => 'Empty'
        //         );
        //     }
        // } else {
        //     $post = array(
        //         'status'  => false,
        //         'message' => 'Failed to Upload'
        //     );
        // }

        // echo  json_encode($post);
    }
    public function MatchInvitation()
    {
        // $config['upload_path']   = './uploads/Matchuploads';
        // $config['allowed_types'] = '*';
        // $config['encrypt_name']  = true;
        // $this->load->library('upload', $config);
        // if (!$this->upload->do_upload('matchfile')) {
        //     $error = array('error' => $this->upload->display_errors());
        //     // print_r($error);
        //     // $errors = array('status'        => false, 
        //     // 'error' => 'You did not select a file to upload.');
        //     echo  json_encode($error);
        // } else {

        //     //file is uploaded successfully
        //     $upload_data = $this->upload->data();
        //     //get the uploaded file name
        //     $filename = $upload_data['file_name'];
        //     // print_r($filename);
        // }
        // // die();
        // if (!empty($filename)) {
        //     $imagename=$filename;
        // }else{
        //     $imagename=" ";
        // }
        $result = $this->UserModel->match_invitation();
        // print_r($result);die();
        if (!empty($result)) {
            if ($result == "exist") {
                // $results= $this->UserModel->get_existingmatch();
                $post = array(
                    'status'  => false,
                    'message' => 'Invitation Already Given'
                );
            } else if ($result == "fail") {
                $post = array(
                    'status'  => false,
                    'message' => 'failed'
                );
            } else if ($result == "nouser") {
                $post = array(
                    'status'  => false,
                    'message' => 'User Does Not Exist'
                );
            } else if ($result == "success") {
                $post = array(
                    'status'  => true,
                    'message' => 'Invitation Send Successfully',
                    // 'details' => $result
                );
            }
        }

        echo  json_encode($post);
    }
    public function Match_reply()
    {
        $data = $this->input->post();
        $result = $this->UserModel->matchReject($data);
        if ($result == "success") {
            $post = array(
                'status'  => true,
                'message' => 'Successfully Reply Sent'
            );
        }
        if ($result == "fail") {
            $post = array(
                'status'  => false,
                'message' => 'failed'
            );
        }
        if ($result == "noinvitation") {
            $post = array(
                'status'  => false,
                'message' => 'Already Replied'
            );
        }
        echo  json_encode($post);
    }
    public function AllInvitation()
    {
        $result = $this->UserModel->get_myinvitation();
        // $files = $this->UserModel->getmyinvitation_files();
        // if (!empty($files)) {
        //     $files = $files;
        // } else {
        //     $files = [];
        // }
        if (!empty($result)) {
            $post = array(
                'status'  => true,
                'message' => 'Success',
                'details' => $result
                // 'files' => $files
            );
        } else {
            $post = array(
                'status'  => false,
                'message' => 'failed',
                'details' => []
            );
        }
        echo  json_encode($post);
    }
    public function PersonalMatch()
    {
        $result = $this->UserModel->get_personalmatch();
        if($result){
            $data = array(
                'status'  => true,
                'message' => 'success',
                'details' => $result
            );
        }else{
            $data = array(
                'status'  => false,
                'message' => 'currently you are having no personal matches',
                'details' =>[]
            );
        }
        echo  json_encode($data);
    }
    public function OpenMatch()
    {
        $result = $this->UserModel->get_openmatch();
       
        echo  json_encode($result);
    }
    public function OngoingMatch()
    {
        $result = $this->UserModel->get_ongoingmatch();
        if($result){
            $data = array(
                'status'  => true,
                'message' => 'success',
                'details' => $result
            );
        }else{
            $data = array(
                'status'  => false,
                'message' => 'currently you are having no personal matches',
                'details' =>[]
            );
        }
        echo  json_encode($data);
        // if (!empty($result)) {
        //     $post = array(
        //         'status'  => true,
        //         'message' => 'success',
        //         'details' => $result
        //     );
        // } else {

        //     $post = array(
        //         'status'  => false,
        //         'message' => 'currently you are having no ongoing matches',
        //         'details' => []
        //     );
        // }
        // echo  json_encode($post);
        
    }
    public function Like()
    {
        // echo $id;die();
        $status = $this->input->post('status');
        $result = $this->UserModel->like();
        if ($result == "success") {
            if ($status == "like") {
                $post = array(
                    'status'  => true,
                    'message' => 'Successfully Liked'
                );
            } else {
                $post = array(
                    'status'  => true,
                    'message' => 'Successfully DisLiked'
                );
            }
        }
        if ($result == "fail") {
            $post = array(
                'status'  => false,
                'message' => 'Failed'
            );
        }
        if ($result == "notexist") {
            $post = array(
                'status'  => false,
                'message' => 'Match Does not exist'
            );
        }
        echo  json_encode($post);
    }
    public function Comment()
    {
        // echo $id;die();
        $result = $this->UserModel->addcomment();
        if ($result == "success") {
            $post = array(
                'status'  => true,
                'message' => 'Successfully Commented'
            );
        }
        if ($result == "fail") {
            $post = array(
                'status'  => false,
                'message' => 'Failed'
            );
        }
        if ($result == "notexist") {
            $post = array(
                'status'  => false,
                'message' => 'Match Does not exist'
            );
        }
        echo  json_encode($post);
    }
    public function GetComment()
    {
        // echo $id;die();
        $result = $this->UserModel->getComment();
        $result_reply = $this->UserModel->getreplyComment();
        if (!empty($result)) {
            $post = array(
                'status'  => true,
                'message' => 'success',
                'details' => $result,
                'reply_comment' => $result_reply
            );
        } else {

            $post = array(
                'status'  => false,
                'message' => 'No Comments Available',
                'details' => []
            );
        }
        echo  json_encode($post);
    }
    public function add_fan()
    {
        $data = $this->input->post();
        $count = $this->Fan->count($data);
        if($count != 0){
            $post = array(
                'status'  => false,
                'message' => 'Already added '
            );
        }else{
            $fan_id = $this->Fan->insert($data);
            $user_from =  $this->User->select($data['req_from']);
            $user_to =  $this->User->select($data['req_to']);

            $devicetoken = $user_to->device_token;
            $devicetype = $user_to->device_type;
            
            $message = $user_from->name . ' ' . 'added you as Fan';
            $notification_status = 'Add_fan';

            $data = array(
                'sender_id' => $data['req_from'],
                'receiver_id' => $data['req_to'],
                'message' => $message,
                'notification_status' => $notification_status,
                'request_id' => $fan_id
            );
            $this->db->insert('tb_notification', $data);
            $this->push($devicetoken, $message, $devicetype);
            $post = array(
                'status'  => true,
                'message' => 'Successfully Added'
            );
        }

        $this->response($post);
    }
    public function Headline()
    {
        // echo $id;die();
        $result = $this->UserModel->getHeadline();
        if (!empty($result)) {
            $post = array(
                'status'  => true,
                'message' => 'success',
                'details' => $result
            );
        } else {

            $post = array(
                'status'  => false,
                'message' => 'failed',
                'details' => []
            );
        }
        echo  json_encode($post);
    }
    public function RemoveFans()
    {
        $result = $this->UserModel->RemoveFans();
        if ($result == "success") {
            $post = array(
                'status'  => true,
                'message' => 'Successfully Removed'
            );
        } else {
            $post = array(
                'status'  => false,
                'message' => 'Failed'
            );
        }
        echo  json_encode($post);
    }
    public function RemoveBesties()
    {
        $result = $this->UserModel->RemoveBesties();
        if ($result == "success") {
            $post = array(
                'status'  => true,
                'message' => 'Successfully Removed'
            );
        } else {
            $post = array(
                'status'  => false,
                'message' => 'Failed'
            );
        }
        echo  json_encode($post);
    }
    public function ActivityPage()
    {
        $user_data = $this->UserModel->get_categorycount();
        if (!empty($user_data)) {
            $data = array(
                'status'  => true,
                'message' => 'success',
                'details' => $user_data

            );
        } else {
            $data = array(
                'status'  => false,
                'message' => 'no data existing',
                'details' => []
            );
        }
        echo  json_encode($data);
    }
    public function GetMap()
    {
        $user_data = $this->UserModel->get_map();

        echo  json_encode($user_data);
    }
    public function GetAdminMessage()
    {
        // echo $id;die();
        $result = $this->UserModel->getAdminMessage();
        if (!empty($result)) {
            $post = array(
                'status'  => true,
                'message' => 'success',
                'details' => $result
            );
        } else {

            $post = array(
                'status'  => false,
                'message' => 'No Messages Available',
                'details' => []
            );
        }
        echo  json_encode($post);
    }
    public function AnswerMessage()
    {
        $result = $this->UserModel->getMessageAnswer();
        // print_r($result);die();
        if ($result == "success") {
            $post = array(
                'status'  => true,
                'message' => 'Successfully Answered'
            );
        } else {
            $post = array(
                'status'  => false,
                'message' => 'Sorry Cannot Update Answer'
            );
        }
        echo  json_encode($post);
    }
    public function CommentLike()
    {
        // echo $id;die();
        $result = $this->UserModel->commentlike();
        // print_r($result);die();
        if ($result == "success") {
            $post = array(
                'status'  => true,
                'message' => 'Successfully Liked'
            );
        }
        if ($result == "successful") {
            $post = array(
                'status'  => true,
                'message' => 'Successfully DisLiked'
            );
        }
        if ($result == "fail") {
            $post = array(
                'status'  => false,
                'message' => 'Failed'
            );
        }
        if ($result == "notexist") {
            $post = array(
                'status'  => false,
                'message' => 'Admin Message Does not exist'
            );
        }
        if ($result == "answernotexist") {
            $post = array(
                'status'  => false,
                'message' => 'Comment Does not exist'
            );
        }
        echo  json_encode($post);
    }
    public function MyiQuery()
    {
        $result = $this->UserModel->MyiQuery();
        // print_r($result);die();
        if ($result == "success") {
            $post = array(
                'status'  => true,
                'message' => 'Successfully Created iQuery'
            );
        }
        if ($result == "successupdate") {
            $post = array(
                'status'  => true,
                'message' => 'Successfully Updated iQuery'
            );
        }
        if ($result == "fail") {
            $post = array(
                'status'  => false,
                'message' => 'Failed'
            );
        }
        echo  json_encode($post);
    }

    public function GetMyiQuery()
    {
        // echo $id;die();
        $result = $this->UserModel->GetMyiQuery();
        if (!empty($result)) {
            $post = array(
                'status'  => true,
                'message' => 'success',
                'details' => $result
            );
        } else {

            $post = array(
                'status'  => false,
                'message' => 'No Query Available',
                'details' => []
            );
        }
        echo  json_encode($post);
    }
    public function GetMyiQueryComment()
    {
        // echo $id;die();
        $result = $this->UserModel->GetMyiQueryComment();
        if (!empty($result)) {
            $post = array(
                'status'  => true,
                'message' => 'success',
                'details' => $result
            );
        } else {

            $post = array(
                'status'  => false,
                'message' => 'No Comments Available',
                'details' => []
            );
        }
        echo  json_encode($post);
    }
    public function CommentAnswer()
    {
        // echo 'hi';die();
        $result = $this->UserModel->commentanswer();
        if ($result == "success") {
            $post = array(
                'status'  => true,
                'message' => 'Successfully Commented'
            );
        }
        if ($result == "fail") {
            $post = array(
                'status'  => false,
                'message' => 'Failed'
            );
        }
        echo  json_encode($post);
    }
    public function RemoveiQuery()
    {
        $result = $this->UserModel->RemoveiQuery();
        if ($result == "success") {
            $post = array(
                'status'  => true,
                'message' => 'Successfully Removed'
            );
        } else {
            $post = array(
                'status'  => false,
                'message' => 'Failed'
            );
        }
        echo  json_encode($post);
    }
    public function Myiquerylike()
    {
        // echo $id;die();
        $result = $this->UserModel->Myiquerylike();
        // print_r($result);die();
        if ($result == "success") {
            $post = array(
                'status'  => true,
                'message' => 'Successfully Liked'
            );
        }
        if ($result == "successful") {
            $post = array(
                'status'  => true,
                'message' => 'Successfully DisLiked'
            );
        }
        if ($result == "fail") {
            $post = array(
                'status'  => false,
                'message' => 'Failed'
            );
        }
        if ($result == "querynotexist") {
            $post = array(
                'status'  => false,
                'message' => 'Query Does not exist'
            );
        }
        if ($result == "answernotexist") {
            $post = array(
                'status'  => false,
                'message' => 'Comment Does not exist'
            );
        }
        echo  json_encode($post);
    }
    public function Iquerycomment()
    {
        // echo $id;die();
        $result = $this->UserModel->myiquerycomment();
        if ($result == "success") {
            $post = array(
                'status'  => true,
                'message' => 'Successfully Commented'
            );
        }
        if ($result == "fail") {
            $post = array(
                'status'  => false,
                'message' => 'Failed'
            );
        }
        if ($result == "notexist") {
            $post = array(
                'status'  => false,
                'message' => 'Query Does not exist'
            );
        }
        echo  json_encode($post);
    }
    public function Top100()
    {
        // echo $id;die();
        $result = $this->UserModel->Top100();
        if (!empty($result)) {
            $post = array(
                'status'  => true,
                'message' => 'success',
                'details' => $result
            );
        } else {

            $post = array(
                'status'  => false,
                'message' => 'Failed',
                'details' => []
            );
        }
        echo  json_encode($post);
    }
    public function BannerSearch()
    {
        $user_data = $this->UserModel->BannerSearch();
        // $user_data['userdetails'] = $this->UserModel->listusers();
        if (!empty($user_data)) {
            $data = array(
                'status'  => true,
                'message' => 'success',
                'details' => $user_data

            );
        } else {
            $data = array(
                'status'  => false,
                'message' => 'no data existing',
                'details' => []
            );
        }
        echo  json_encode($data);
    }
    public function winners_of_the_moment()
    {
        $user_data = $this->UserModel->winners_of_the_moment();
        // $user_data['userdetails'] = $this->UserModel->listusers();
        if (!empty($user_data)) {
            $data = array(
                'status'  => true,
                'message' => 'success',
                'details' => $user_data

            );
        } else {
            $data = array(
                'status'  => false,
                'message' => 'no data existing',
                'details' => []
            );
        }
        echo  json_encode($data);
    }
    public function Recommended_for_you()
    {
        $user_data = $this->UserModel->Recommended_for_you();
        // $user_data['userdetails'] = $this->UserModel->listusers();
        if (!empty($user_data)) {
            $data = array(
                'status'  => true,
                'message' => 'success',
                'details' => $user_data

            );
        } else {
            $data = array(
                'status'  => false,
                'message' => 'no data existing',
                'details' => []
            );
        }
        echo  json_encode($data);
    }
    public function Upload_File()
    {
        $config['upload_path']   = './uploads/Useruploads';
        $config['allowed_types'] = '*';
        $config['encrypt_name']  = true;
        $this->load->library('upload', $config);
        if (!$this->upload->do_upload('userfile')) {
            $error = array('error' => $this->upload->display_errors());
            // print_r($error);
            // $errors = array('status'        => false, 
            // 'error' => 'You did not select a file to upload.');
            echo  json_encode($error);
        } else {

            //file is uploaded successfully
            $upload_data = $this->upload->data();
            //get the uploaded file name
            $image = $upload_data['file_name'];
            // print_r($image);
        }
        // die();
        if (!empty($image)) {
            $user_data = $this->UserModel->uploadedfile($image);
        }
        // echo "done";
        // print_r($user_data);
        // die();
        if (!empty($user_data)) {
            $link = base_url() . 'uploads/Useruploads/' . $image;
            if ($user_data == "success") {
                $data = array(
                    'status'        => true,
                    'message'       => 'success',
                    'details'       => $link

                );
            } else {
                $link = base_url() . 'uploads/Useruploads/default.jpg';
                $data = array(
                    'status'        => false,
                    'message'       => 'failed',
                    'details'       => $link
                );
            }
            echo  json_encode($data);
        }
    }
    public function Chat()
    {
        $user_data = $this->UserModel->chat();
        if ($user_data == "success") {
            $data = array(
                'status'        => true,
                'message'       => 'successfully message send'

            );
        } else {
            $data = array(
                'status'        => false,
                'message'       => 'failed to send message'

            );
        }
        echo  json_encode($data);
    }
    public function GetChat()
    {
        $user_data = $this->UserModel->getchat();
        if (!empty($user_data)) {
            $data = array(
                'status'        => true,
                'message'       => 'List of Chats',
                'details' => $user_data
            );
        } else {
            $data = array(
                'status'        => false,
                'message'       => 'No Chats Available',
                'details' => []

            );
        }
        echo  json_encode($data);
    }
    public function GetDetailChat()
    {
        $user_data = $this->UserModel->getdetailchat();
        if (!empty($user_data)) {
            $data = array(
                'status'        => true,
                'message'       => 'success',
                'details' => $user_data
            );
        } else {
            $data = array(
                'status'        => false,
                'message'       => 'failed',
                'details' => []

            );
        }
        echo  json_encode($data);
    }
    public function Online_Offline_status()
    {
        $userdata = $this->UserModel->changechatstatus();
        if ($userdata == "success") {
            $data = array(
                'status'        => true,
                'message'       => 'success'

            );
        } else {
            $data = array(
                'status'        => false,
                'message'       => 'failed'

            );
        }
        echo  json_encode($data);
    }
    public function BestMoment()
    {
        $userdata = $this->UserModel->BestMoment();
        if ($userdata == "fail") {
            $data = array(
                'status'        => false,
                'message'       => 'failed'

            );
        } else {
            $data = array(
                'status'        => true,
                'message'       => 'success',
                'moment_id' => $userdata
            );
        }
        echo  json_encode($data);
    }
    public function UploadBestieMomentFile()
    {
        $config['upload_path']   = './uploads/Useruploads';
        $config['allowed_types'] = '*';
        $config['encrypt_name']  = true;
        $this->load->library('upload', $config);
        if (!$this->upload->do_upload('userfile')) {
            $error = array('error' => $this->upload->display_errors());
            // print_r($error);
            // $errors = array('status'        => false, 
            // 'error' => 'You did not select a file to upload.');
            echo  json_encode($error);
        } else {

            //file is uploaded successfully
            $upload_data = $this->upload->data();
            //get the uploaded file name
            $image = $upload_data['file_name'];
            // print_r($image);
        }
        // die();
        if (!empty($image)) {
            $user_data = $this->UserModel->uploadedbestmomentfile($image);
        }
        // echo "done";
        // print_r($user_data);
        // die();
        if (!empty($user_data)) {
            if ($user_data == "success") {
                $data = array(
                    'status'        => true,
                    'message'       => 'success',
                    'details'       => $user_data

                );
            } else {
                $data = array(
                    'status'        => false,
                    'message'       => 'failed',
                    'details'       => []
                );
            }
            echo  json_encode($data);
        }
    }
    public function GetBestMoment()
    {
        $userdata['moments'] = $this->UserModel->getBestMoment();
        $userdata['moments_file'] = $this->UserModel->getBestMomentFile();
        if (!empty($userdata)) {
            $data = array(
                'status'        => true,
                'message'       => 'List of Best Moments',
                'details' => $userdata
            );
        } else {
            $data = array(
                'status'        => false,
                'message'       => 'No Best Moments Available',
                'details' => []

            );
        }
        echo  json_encode($data);
    }
    public function UploadChatFile()
    {
        // if (!empty($_FILES['userfile']['name'])) {
        //     print_r(($_FILES['userfile']['name']));
        //     echo "filename exist";
        // } else {
        //     echo "filename empty";
        // }
        // die();
        $config['upload_path']   = './uploads/UserChatuploads';
        $config['allowed_types'] = '*';
        $config['encrypt_name']  = true;
        $this->load->library('upload', $config);
        if (!$this->upload->do_upload('userfile')) {
            $error = array('error' => $this->upload->display_errors());
            // print_r($error);
            // $errors = array('status'        => false, 
            // 'error' => 'You did not select a file to upload.');
            echo  json_encode($error);
        } else {

            //file is uploaded successfully
            $upload_data = $this->upload->data();
            //get the uploaded file name
            $filename = $upload_data['file_name'];
            // print_r($filename);
        }
        // die();
        if (!empty($filename)) {
            $user_data = $this->UserModel->uploadedchatfile($filename);
        }
        // echo "done";
        // print_r($user_data);
        // die();
        if (!empty($user_data)) {
            if ($user_data == "success") {
                $data = array(
                    'status'        => true,
                    'message'       => 'success'

                );
            } else if ($user_data == "empty") {
                $data = array(
                    'status'        => false,
                    'message'       => 'Userid Empty'
                );
            } else {
                $data = array(
                    'status'        => false,
                    'message'       => 'failed'
                );
            }
            echo  json_encode($data);
        }
    }
    public function MomentLike()
    {
        // echo $id;die();
        $result = $this->UserModel->MomentLike();
        if ($result == "success") {
            $post = array(
                'status'  => true,
                'message' => 'Successfully Liked'
            );
        }
        if ($result == "successful") {
            $post = array(
                'status'  => true,
                'message' => 'Successfully DisLiked'
            );
        }
        if ($result == "fail") {
            $post = array(
                'status'  => false,
                'message' => 'Failed'
            );
        }
        if ($result == "notexist") {
            $post = array(
                'status'  => false,
                'message' => 'Moment Does not exist'
            );
        }
        echo  json_encode($post);
    }
    public function MomentComment()
    {
        // echo $id;die();
        $result = $this->UserModel->addmomentcomment();
        if ($result == "success") {
            $post = array(
                'status'  => true,
                'message' => 'Successfully Commented'
            );
        }
        if ($result == "fail") {
            $post = array(
                'status'  => false,
                'message' => 'Failed'
            );
        }
        if ($result == "notexist") {
            $post = array(
                'status'  => false,
                'message' => 'Moment Does not exist'
            );
        }
        echo  json_encode($post);
    }
    public function GetMomentComment()
    {
        // echo $id;die();
        $result = $this->UserModel->getmomentcomment();
        if (!empty($result)) {
            $post = array(
                'status'  => true,
                'message' => 'success',
                'details' => $result
            );
        } else {

            $post = array(
                'status'  => false,
                'message' => 'No Comments Available',
                'details' => []
            );
        }
        echo  json_encode($post);
    }
    function get_ongoing_match($id){
        
    }
    public function acceptInvitation()
    {
        $result = $this->UserModel->matchAccept();
        $matchid = $this->input->post('matchid');
        $userid = $this->input->post('userid');
        $data = $this->input->post();
        $links = json_decode($data['links']);
        $texts = json_decode($data['texts']);

        $current_date = date("Y-m-d H:s:i");

        $post = array(
            'status'  => true,
            'message' => 'Successfully uploaded',
            'matchid' => $matchid
        );
        
        if (!empty($links)) {
            for ($i = 0; $i < count($links); $i++) {
                $sub_caption = $this->getSubCaption($sub_captions, 'link', $i);
                $data = array(
                    'matchid' => $matchid,
                    'user_uploaded' => $userid,
                    'filename' => $links[$i]->value,
                    'filetype' => 'link',
                    'created_at' => $current_date
                );
                $results = $this->UserModel->savefile($data);
                if ($results != "success") {
                    $post = array(
                        'status'  => false,
                        'message' => 'Link Upload Failed'
                    );
                    echo  json_encode($post);
                }
            }
        }
        if (!empty($texts) ) {
            for ($i = 0; $i < count($texts); $i++) {
                $data = array(
                    'matchid' => $matchid,
                    'user_uploaded' => $userid,
                    'filename' => $texts[$i]->value,
                    'filetype' => 'text',
                    'created_at' => $current_date
                );
                $results = $this->UserModel->savefile($data);
                if ($results != "success") {
                    $post = array(
                        'status'  => false,
                        'message' => 'Text Upload Failed'
                    );
                    echo  json_encode($post);
                }
            }
        }
        echo  json_encode($post);
        
    }
    public function GetUserdetails()
    {
        $result = $this->UserModel->GetUserdetails();
        if (!empty($result)) {
            $post = array(
                'status'  => true,
                'message' => 'success',
                'details' => $result
            );
        } else {

            $post = array(
                'status'  => false,
                'message' => 'failed',
                'details' => []
            );
        }
        echo  json_encode($post);
    }
    public function ReplyComment()
    {
        // echo $id;die();
        $result = $this->UserModel->addreplycomment();
        if ($result == "success") {
            $post = array(
                'status'  => true,
                'message' => 'Successfully Commented'
            );
        }
        if ($result == "fail") {
            $post = array(
                'status'  => false,
                'message' => 'Failed'
            );
        }
        if ($result == "notexist") {
            $post = array(
                'status'  => false,
                'message' => 'Match Does not exist'
            );
        }
        echo  json_encode($post);
    }
    public function MatchCommentLike()
    {
        // echo $id;die();
        $result = $this->UserModel->comment_like();
        // print_r($result);die();
        if ($result == "success") {
            $post = array(
                'status'  => true,
                'message' => 'Successfully Liked'
            );
        }
        if ($result == "successful") {
            $post = array(
                'status'  => true,
                'message' => 'Successfully DisLiked'
            );
        }
        if ($result == "fail") {
            $post = array(
                'status'  => false,
                'message' => 'Failed'
            );
        }
        if ($result == "notexist") {
            $post = array(
                'status'  => false,
                'message' => 'Comment Does not exist'
            );
        }
        echo  json_encode($post);
    }
    public function CreateOpenMatch()
    {
        $data = $this->input->post();
        $matchid = $this->UserModel->CreateOpenMatch($data);
        $links = json_decode($data['links']);
        $texts = json_decode($data['texts']);
        $userid = $data['rival_id'];
        $current_date = date("Y-m-d H:s:i");
        $post = array(
            'status'  => true,
            'message' => 'Successfully uploaded',
            'matchid' =>$matchid
        );
        
        if (!empty($links)) {
            for ($i = 0; $i < count($links); $i++) {
                $data = array(
                    'matchid' => $matchid,
                    'user_uploaded' => $userid,
                    'filename' => $links[$i]->value,
                    'filetype' => 'link',
                    'created_at' => $current_date
                );
                $results = $this->UserModel->savefile($data);
                if ($results != "success") {
                    $post = array(
                        'status'  => false,
                        'message' => 'Link Upload Failed'
                    );
                    echo  json_encode($post);
                }
            }
        }
        if (!empty($texts) ) {
            for ($i = 0; $i < count($texts); $i++) {
                $data = array(
                    'matchid' => $matchid,
                    'user_uploaded' => $userid,
                    'filename' => $texts[$i]->value,
                    'filetype' => 'text',
                    'created_at' => $current_date
                );
                $results = $this->UserModel->savefile($data);
                if ($results != "success") {
                    $post = array(
                        'status'  => false,
                        'message' => 'Text Upload Failed'
                    );
                    echo  json_encode($post);
                }
            }
        }
        $user = $this->User->select($userid);
        $actionLog = array(
            "user_id" => $userid,
            "title" => $user->name . "Created Closed Match",
            "type" => "Closed Match",
            "created_at" => date("Y-m-d H:s:i")
        );
        $this->ActionLog->save($actionLog);
        $this->response($post);
    }
    public function testmail()
    {
        $this->load->library('email');

        // $config['protocol']    = 'mail';
        // $config['smtp_host']    = 'smtp.dreamhost.com';
        // $config['smtp_port']    = '587';
        // $config['smtp_timeout'] = '7';
        // $config['smtp_user']    = 'support@thechangeshop.com';
        // $config['smtp_pass']    = 'Q01TYWRtaW4x';
        // $config['charset']    = 'utf-8';
        // $config['newline']    = "\r\n";
        // $config['mailtype'] = 'text'; // or html
        // $config['validation'] = TRUE; // bool whether to validate email or not      

        $config['protocol'] = 'sendmail';
        $config['smtp_host'] = 'smtp.dreamhost.com';
        $config['smtp_user'] = 'support@thechangeshop.com';
        $config['smtp_pass'] = 'Q01TYWRtaW4x';
        $config['smtp_port'] = 25;

        $this->email->initialize($config);

        $this->email->from('1997raveena.s@gmail.com', 'rave');
        $this->email->to('raveena.sics@gmail.com');
        $this->email->subject('Email Test');
        $this->email->message('Testing the email class.');

        // $this->email->send();
        if ($this->email->send()) {
            echo "mail send";
        } else {
            echo $this->email->print_debugger();
        }
    }
    public function create_personalmatch()
    {
        date_default_timezone_set('Asia/Kolkata');
        $current_date    = date('Y-m-d H:i:s');
        $userid = $this->input->post('userid');
        $links = json_decode($this->input->post('links'));
        $texts = json_decode($this->input->post('texts'));
        $matchid = $this->UserModel->create_personalmatch($userid);

        $post = array(
            'status'  => true,
            'message' => 'Successfully uploaded',
            'matchid' =>$matchid
        );
        
        if (!empty($links)) {
            for ($i = 0; $i < count($links); $i++) {
                $data = array(
                    'matchid' => $matchid,
                    'user_uploaded' => $userid,
                    'filename' => $links[$i]->value,
                    'filetype' => 'link',
                    'created_at' => $current_date
                );
                $results = $this->UserModel->savefile($data);
                if ($results != "success") {
                    $post = array(
                        'status'  => false,
                        'message' => 'Link Upload Failed'
                    );
                }
            }
        }
        if (!empty($texts) ) {
            for ($i = 0; $i < count($texts); $i++) {
                $data = array(
                    'matchid' => $matchid,
                    'user_uploaded' => $userid,
                    'filename' => $texts[$i]->value,
                    'filetype' => 'text',
                    'created_at' => $current_date
                );
                $results = $this->UserModel->savefile($data);
                if ($results != "success") {
                    $post = array(
                        'status'  => false,
                        'message' => 'Text Upload Failed'
                    );
                }
            }
        }
        $user = $this->User->select($userid);
        $actionLog = array(
            "user_id" => $userid,
            "title" => $user->name . "Created Personal Match",
            "type" => "Personal Match",
            "created_at" => date("Y-m-d H:s:i")
        );
        $this->ActionLog->save($actionLog);
        $this->response($post);
    }
    public function create_closedmatch()
    {
        date_default_timezone_set('Asia/Kolkata');
        $current_date    = date('Y-m-d H:i:s');
        $rival_userid = $this->input->post('rival_userid');
        $matchid = $this->UserModel->create_closedmatch();
        // $oppo_filename = $this->input->post('match_filename');
        $links = json_decode($this->input->post('link'));
        $texts = json_decode($this->input->post('text'));
        $sub_captions = json_decode($this->input->post('sub_captions'));
        // print_r($sub_captions);
        // die;
        $post = array(
            'status'  => true,
            'message' => 'Successfully uploaded',
            'matchid'=> $matchid
        );

        if (!empty($links)) {
            for ($i = 0; $i < count($links); $i++) {
                // $sub_caption = $this->getSubCaption($sub_captions, 'link', $i);
                $data = array(
                    'matchid' => $matchid,
                    'user_uploaded' => $rival_userid,
                    'filename' => $links[$i]->value,
                    'filetype' => 'link',
                    'created_at' => $current_date
                    // ,
                    // 'sub_caption' => $sub_caption
                );
                $results = $this->UserModel->savefile($data);
                if ($results != "success") {
                    $post = array(
                        'status'  => false,
                        'message' => 'Link Upload Failed'
                    );
                }
            }
        }
        if (!empty($texts) ) {
            for ($i = 0; $i < count($texts); $i++) {
                // $sub_caption = $this->getSubCaption($sub_captions, 'text', $i);
                $data = array(
                    'matchid' => $matchid,
                    'user_uploaded' => $rival_userid,
                    'filename' => $texts[$i]->value,
                    'filetype' => 'text',
                    'created_at' => $current_date
                    // ,
                    // 'sub_caption' => $sub_caption
                );
                $results = $this->UserModel->savefile($data);
                if ($results != "success") {
                    $post = array(
                        'status'  => false,
                        'message' => 'Text Upload Failed'
                    );
                }
            }
        }
        $user = $this->User->select($rival_userid);
        $actionLog = array(
            "user_id" => $rival_userid,
            "title" => $user->name . "Created Closed Match",
            "type" => "Closed Match",
            "created_at" => date("Y-m-d H:s:i")
        );
        $this->ActionLog->save($actionLog);
        $this->response($post);
    }
    public function ClosedMatch()
    {
        $result = $this->UserModel->get_closedmatch();
        // $result['link'] = $this->UserModel->get_closedmatch_link();
        // $result['text'] = $this->UserModel->get_closedmatch_text();
        // $result['audio'] = $this->UserModel->get_closedmatch_audio();
        // $result['image'] = $this->UserModel->get_closedmatch_image();
        // $result['video'] = $this->UserModel->get_closedmatch_video();
        if (!empty($result)) {
            $post = array(
                'status'  => true,
                'message' => 'Success',
                'details' => $result
            );
        } else {
            $post = array(
                'status'  => false,
                'message' => 'currently you are having no closed matches',
                'details' => []
            );
        }
        echo  json_encode($post);
    }
    public function personallike()
    {
        // echo $id;die();
        $result = $this->UserModel->personallike();
        if ($result == "like") {
            $post = array(
                'status'  => true,
                'message' => 'Successfully Liked'
            );
        }
        if ($result == "dislike") {
            $post = array(
                'status'  => true,
                'message' => 'Successfully DisLiked'
            );
        }
        if ($result == "fail") {
            $post = array(
                'status'  => false,
                'message' => 'Failed'
            );
        }
        if ($result == "notexist") {
            $post = array(
                'status'  => false,
                'message' => 'Match Does not exist'
            );
        }
        echo  json_encode($post);
    }
    public function matchfilter()
    {
        // echo 'hi';die();
        $user_data['link'] = $this->UserModel->get_ongoingmatch_link();
        $user_data['text'] = $this->UserModel->get_ongoingmatch_text();
        $user_data['audio'] = $this->UserModel->get_ongoingmatch_audio();
        $user_data['image'] = $this->UserModel->get_ongoingmatch_image();
        $user_data['video'] = $this->UserModel->get_ongoingmatch_video();
        // $user_data['fan_of'] = $this->UserModel->list_fanof($id);
// print_r($user_data['link']);die();
        if ((!empty($user_data['link'])) || (!empty($user_data['text'])) || (!empty($user_data['audio'])) || (!empty($user_data['image']))) {
            $data = array(
                'status'  => true,
                'message' => 'success',
                'details' => $user_data

            );
        } else {
            $data = array(
                'status'  => false,
                'message' => 'no data existing',
                'details' => []
            );
        }
        echo  json_encode($data);
    }
    public function Bestielike()
    {
        // echo $id;die();
        $result = $this->UserModel->Bestielike();
        // print_r($result);die();
        if ($result == "success") {
            $post = array(
                'status'  => true,
                'message' => 'Successfully Liked'
            );
        }
        if ($result == "successful") {
            $post = array(
                'status'  => true,
                'message' => 'Successfully DisLiked'
            );
        }
        if ($result == "fail") {
            $post = array(
                'status'  => false,
                'message' => 'Failed'
            );
        }
        if ($result == "notexist") {
            $post = array(
                'status'  => false,
                'message' => 'Bestie Does not exist'
            );
        }
        echo  json_encode($post);
    }
    public function BestieComment()
    {
        // echo $id;die();
        $result = $this->UserModel->BestieComment();
        if ($result == "success") {
            $post = array(
                'status'  => true,
                'message' => 'Successfully Commented'
            );
        }
        if ($result == "fail") {
            $post = array(
                'status'  => false,
                'message' => 'Failed'
            );
        }
        if ($result == "notexist") {
            $post = array(
                'status'  => false,
                'message' => 'Bestie Does not exist'
            );
        }
        if ($result == "commentnotexist") {
            $post = array(
                'status'  => false,
                'message' => 'Comment Does not exist'
            );
        }
        echo  json_encode($post);
    }
    public function UpdateBestieComment()
    {
        // echo $id;die();
        $result = $this->UserModel->UpdateBestieComment();
        if ($result == "success") {
            $post = array(
                'status'  => true,
                'message' => 'Successfully Comment Updated'
            );
        }
        if ($result == "fail") {
            $post = array(
                'status'  => false,
                'message' => 'Failed'
            );
        }
        if ($result == "notexist") {
            $post = array(
                'status'  => false,
                'message' => 'Comment Does not exist'
            );
        }
        echo  json_encode($post);
    }
     public function GetBestieComment()
    {
        // echo $id;die();
        $result = $this->UserModel->getbestieComment();

        if (!empty($result)) {
            $post = array(
                'status'  => true,
                'message' => 'success',
                'details' => $result
            );
        } else {

            $post = array(
                'status'  => false,
                'message' => 'No Comments Available',
                'details' => []
            );
        }
        echo  json_encode($post);
    }
    public function DeleteBestieComment()
    {
        $result = $this->UserModel->DeleteBestieComment();
        if ($result == "success") {
            $post = array(
                'status'  => true,
                'message' => 'Successfully Deleted'
            );
        } else {
            $post = array(
                'status'  => false,
                'message' => 'Failed'
            );
        }
        echo  json_encode($post);
    }
    public function BestieCommentLike()
    {
        // echo $id;die();
        $result = $this->UserModel->BestieCommentLike();
        // print_r($result);die();
        if ($result == "success") {
            $post = array(
                'status'  => true,
                'message' => 'Successfully Liked'
            );
        }
        if ($result == "successful") {
            $post = array(
                'status'  => true,
                'message' => 'Successfully DisLiked'
            );
        }
        if ($result == "fail") {
            $post = array(
                'status'  => false,
                'message' => 'Failed'
            );
        }
        if ($result == "notexist") {
            $post = array(
                'status'  => false,
                'message' => 'Comment Does not exist'
            );
        }
        echo  json_encode($post);
    }

    public function getSubCaption($sub_captions, $file_type, $posistion){
        foreach($sub_captions as $index=>$caption){
            if($caption->type == $file_type && $caption->position == $posistion){
                return $caption->value;
            }
        }
        return '';
    }
    public function disable_comment(){
        $result = $this->UserModel->disable_comment();
        // print_r($result);die();
        if ($result == "success") {
            $post = array(
                'status'  => true,
                'message' => 'Successfully De-activated'
            );
        }
        if ($result == "successful") {
            $post = array(
                'status'  => true,
                'message' => 'Successfully Activated'
            );
        }
        if ($result == "fail") {
            $post = array(
                'status'  => false,
                'message' => 'Failed'
            );
        }
        // if ($result == "notexist") {
        //     $post = array(
        //         'status'  => false,
        //         'message' => 'No Status available'
        //     );
        // }
        echo  json_encode($post);
    }
}
