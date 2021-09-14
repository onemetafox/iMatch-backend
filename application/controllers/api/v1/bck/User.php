<?php
defined('BASEPATH') or exit('No direct script access allowed');

class User extends CI_Controller
{

    public function __construct()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
        header("Access-Control-Allow-Methods: GET, POST");
        parent::__construct();
        $this->load->model('UserModel');
        $this->load->database(); 
        $this->load->helper('url', 'form');
    }
    public function register()
    {
        $name=$this->input->post('name');
        $phone=$this->input->post('phone');
        $email=$this->input->post('email');
        $password=$this->input->post('password');
        $uni_name=$this->input->post('university');
        $isocode=$this->input->post('code');
        $data = array(
            'name'  => $name,
            'phone' => $phone,
            'email'  => $email,
            'password' =>base64_encode($password),
            'university_name'  => $uni_name,
            'isocode'  => $isocode,
);
            $result=$this->UserModel->register($data);
            if(!empty($result))
        {
            $post = array(
                'status'  => true,
                'message' => 'success',
                'details' => $result

            );
        }
        else {
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
        echo  json_encode($data);
    }
    public function forgotpassword()
    {
        $this->load->library('email');
   // configure the email setting
   $email = "raveena.sics@gmail.com";
   $config['mailtype'] = 'html';
   $config['charset'] = 'iso-8859-1';
   $config['wordwrap'] = TRUE;
   $config['newline'] = "\r\n"; //use double quotes
   $this->email->initialize($config);
   $this->email->from('no-reply@itjobcell.com', 'test');
   $this->email->to($email);
   $this->email->subject('test');
   $message = 'testmail';
   $this->email->message($message);
   $result = $this->email->send();
   if ($result == true) {
       echo 'Your Email has successfully been sent....';
   } else {

       show_error($this->email->print_debugger());
   }
        die();
        $email=$this->input->post('email');
        $alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
        $pass = array(); //remember to declare $pass as an array
        $alphaLength = strlen($alphabet) - 1; //put the length -1 in cache
        for ($i = 0; $i < 8; $i++) {
            $n = rand(0, $alphaLength);
            $pass[] = $alphabet[$n];
        }
        $password=implode($pass); 
       $user_data = $this->UserModel->forget_password($email,$password);
        if ($user_data==true) {
        
            $data = array(
                'status'  => true,
                'message' => 'Mail Sent'

            );
        } else {
            $data = array(
                'status'  => false,
                'message' => 'invalid user'
            );
        }
        echo  json_encode($data);
    }
    public function countrycode()
    {
       $user_data = $this->UserModel->countrycode();
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
     
            $result=$this->UserModel->updateprofile();
            if(!empty($result))
        {
            $post = array(
                'status'  => true,
                'message' => 'success',
                'details' => $result

            );
        }
        else {
            $post = array(
                'status'  => false,
                'message' => 'user already existing',
                'details' => []
            );
        }
        
        echo  json_encode($post);
    }
//     public function profile_pic()
//     {
//             $u_id = $this->input->post('userid');
//             $pic= $this->input->post('profile_pic');
//             echo $u_id;
//             echo $pic;die();
//             $this->db->select('profile_pic');
//             $this->db->from('tb_user');
//             $this->db->where('id',$u_id);
//             $query   = $this->db->get();
//             $img     = $query->row_array();
//     // print_r($img);die();
//             // $config['upload_path']   = FCPATH . '/uploads/profile_image';
//             // $config['allowed_types'] = 'gif|jpg|png|jpeg';
//             // $config['create_thumb']  = TRUE;
//             // $config['encrypt_name']  = true;
//             // $this->load->library('upload', $config);
//             // if ($this->upload->do_upload('profile_pic'))
//             // {
                
//             //     $imagedata   = $this->upload->data();
//             //     $u_image = $imagedata['file_name'];
               
//             //     if($img['profile_pic']!="")
//             //     {
//             //         $old_img = "uploads/profile_image/".$img['profile_pic'];
//             //         unlink($old_img);
//             //     }
               
//             // }
//             // else
//             // {
//             //     $u_image = $img['profile_pic'] ;
//             // }
          
//             $config['upload_path']          = './uploads/profile_pic';
//             // print_r($config['upload_path']);die();
//             $config['allowed_types'] = 'gif|jpg|png|jpeg';
//             $config['encrypt_name']  = TRUE;
//             $this->load->library('upload', $config);
//                 if ( ! $this->upload->do_upload('profile_pic'))
//                 {	
// 				$error = array('error' => $this->upload->display_errors());
// 			print_r($error);
// 			} else {
	
// 				//file is uploaded successfully
// 				$upload_data = $this->upload->data();
// 				//get the uploaded file name
//                 $image= $upload_data['file_name'];
//                 print_r($image);
// 			}
// 			die();
// 			// if(!empty($image)){
// 			// 	$images=$this->input->post('photo');
// 			// }
// 			// else{
// 			// 	$images=$image;
// 			// }
            
//             $user_data = $this->UserModel->profilepicupdate($image);
//             if($user_data== "success")
//             {
//                 $datas=array(
// 'image'     => base_url("uploads/profile_image/" .$image)
//                 );
//                 $data = array(
//                     'status'        => true,
//                     'message'       => 'success',
//                     'details'       => $datas
    
//                 );
//             }
//             else {
//                 $data = array(
//                     'status'        => false,
//                     'message'       => 'failed',
//                     'details'       => (object)[]
//                 );
//             }
//             echo  json_encode($data);
    
//         }
public function profile_pic()
{
    $config['upload_path']   = './uploads/profile_image';
    $config['allowed_types'] = 'gif|jpg|png|jpeg';
    $config['encrypt_name']  = true;
    $this->load->library('upload', $config);
    if ( ! $this->upload->do_upload('profile_pic'))
                    {	
    				$error = array('error' => $this->upload->display_errors());
    			print_r($error);
    			} else {
        
    				//file is uploaded successfully
    				$upload_data = $this->upload->data();
    				//get the uploaded file name
                    $image= $upload_data['file_name'];
                    // print_r($image);
    			}
    // die();
    $user_data = $this->UserModel->profilepicupdate($image);
    // echo "done";
    // die();
    if(!empty($user_data))
    {
        $data = array(
            'status'        => true,
            'message'       => 'success',
            'details'       => $user_data

        );
    }
    else {
        $data = array(
            'status'        => false,
            'message'       => 'failed',
            'details'       => (object)[]
        );
    }
    echo  json_encode($data);

}
}
