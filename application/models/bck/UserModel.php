<?php
defined('BASEPATH') or exit('No direct script access allowed');

class UserModel  extends CI_Model
{
  public function register($data)
  {
    $email = $this->input->post('email');
    $query =  $this->db->query("select * from tb_user where email='$email'");
    if ($this->db->affected_rows() > 0) {
      $data[] =  array();
    } else {
      $this->db->insert('tb_user', $data);
      if ($this->db->affected_rows() > 0) {
        $user_id = $this->db->insert_id();
        $this->db->select('*');
        $this->db->from('tb_user');
        $this->db->where('id', $user_id);
        $query = $this->db->get();
        $result_array =  $query->result_array();
        $data = array();
        foreach ($result_array as $result) {
          if (!empty($result['profile_pic'])) {
            $string = $result['profile_pic'];
            if (preg_match('/[\'^£$%&*()}{@#~?><>,|=_+¬-]/', $string)) {
              // one or more of the 'special characters' found in $string
              // echo "found";
              $pic = $result['profile_pic'];
            } else {
              // echo "not found";
              $pic = base_url() . 'uploads/profile_image/' . $result['profile_pic'];
            }
          } else {
            // echo "not found";
            $pic = base_url() . 'uploads/profile_image/user.png';
          }
          $data[] =  array(
            'userid'        => $result['id'],
            'name'      => $result['name'],
            'email'       => $result['email'],
            'university_name' => $result['university_name'],
            'phone_number' => $result['phone'],
            'profile_pic' => $pic
          );
        }

        return $data;
      }
    }
  }
  public function login()
  {
    $device_token = $this->input->post('device_token');
    $device_type = $this->input->post('device_type');
    $email = $this->input->post('email');
    $password = base64_encode($this->input->post('password'));
    $checkemail = $this->db->query("select * from tb_user where email='$email' ");
    if ($checkemail->num_rows() > 0) {
      $all_pics = $this->db->query("select * from tb_user where email='$email' and password='$password'");
      $result_array = $all_pics->result_array();
      $update = $this->db->query("update tb_user set device_token='$device_token',device_type='$device_type' WHERE email='$email'");
      $data = array();
      foreach ($result_array as $result) {
        $userid = $result['id'];
        $squad = $this->db->query("select count(*) as squad_count from tb_bestie where (req_from='$userid' or req_to='$userid') and category='squad'");
        $result_squad = $squad->row();
        // print_r($result_squad);
        // echo ;die();
        $bestie = $this->db->query("select count(*) as bestie_count from tb_bestie where (req_from='$userid' or req_to='$userid') and category='bestie'");
        $result_bestie = $bestie->row();
        $fan = $this->db->query("select count(*) as fan_count from tb_fans where (req_from='$userid' or req_to='$userid') and category='fan'");
        $result_fan = $fan->row();
        $fanof = $this->db->query("select count(*) as fanof_count from tb_fans where (req_from='$userid' or req_to='$userid') and category='fan_of'");
        $result_fanof = $fanof->row();
        date_default_timezone_set('Asia/Kolkata');
        $current_date    = date('Y-m-d H:i:s');
        $matches = $this->db->query("select count(*) as match_count from tb_match where invitation_status='accept' and (rival_id='$userid' or opponent_id='$userid')");
        $result_matches = $matches->row();
        // print_r($result_matches);die();
        if (!empty($result['profile_pic'])) {
          $string = $result['profile_pic'];
          if (preg_match('/[\'^£$%&*()}{@#~?><>,|=_+¬-]/', $string)) {
            // one or more of the 'special characters' found in $string
            // echo "found";
            $pic = $result['profile_pic'];
          } else {
            // echo "not found";
            $pic = base_url() . 'uploads/profile_image/' . $result['profile_pic'];
          }
        } else {
          // echo "not found";
          $pic = base_url() . 'uploads/profile_image/user.png';
        }
        if ($result['online_offline_status'] == 0) {
          $onoffstatus = "online";
        } else {
          $onoffstatus = "offline";
        }
        $data[] =  array(
          'userid'        => $result['id'],
          'name'      => $result['name'],
          'email'       => $result['email'],
          'university_name' => $result['university_name'],
          'profile_pic'      => $pic,
          'squad_count' => $result_squad->squad_count,
          'bestie_count' => $result_bestie->bestie_count,
          'fans_count' => $result_fan->fan_count,
          'fans_of_count' => $result_fanof->fanof_count,
          'matches_count' => $result_matches->match_count,
          'online_offline_status' => $onoffstatus,
          'last_seen' => $result['last_seen']
        );
      }

      return $data;
    } else {
      return "notexist";
    }
  }
  public function forget_password($email, $password)
  {
    //   echo $email;echo $password;die();
    $password = base64_encode($password);
    $query =  $this->db->query("select * from tb_user where email='$email'");
    if ($this->db->affected_rows() > 0) {
      $this->db->set('password', $password);
      $this->db->where('email', $email);
      $this->db->update('tb_user');
      if ($this->db->affected_rows() > 0) {
        return 'success';
      } else {
        return 'fail';
      }
    } else {
      return 'usernotexist';
    }
  }
  public function list_users()
  {
    $id = $this->input->post('userid');
    $query = $this->db->query("select * from tb_user where id!='$id'");
    $result_array =  $query->result_array();
    $data = array();
    foreach ($result_array as $result) {
      $userid = $result['id'];
      if (!empty($result['profile_pic'])) {
        $string = $result['profile_pic'];
        if (preg_match('/[\'^£$%&*()}{@#~?><>,|=_+¬-]/', $string)) {
          // one or more of the 'special characters' found in $string
          // echo "found";
          $pic = $result['profile_pic'];
        } else {
          // echo "not found";
          $pic = base_url() . 'uploads/profile_image/' . $result['profile_pic'];
        }
      } else {
        // echo "not found";
        $pic = base_url() . 'uploads/profile_image/user.png';
      }
      $bestie = $this->db->query("select * from tb_bestie where ((req_from='$userid' and req_to='$id') or (req_from='$id' and req_to='$userid')) and category='bestie'");
      if ($bestie->num_rows() > 0) {
        $bestie_list = "yes";
      } else {
        $bestie_list = "no";
      }
      $squad = $this->db->query("select * from tb_bestie where ((req_from='$userid' and req_to='$id') or (req_from='$id' and req_to='$userid')) and category='squad'");
      if ($squad->num_rows() > 0) {
        $squad_list = "yes";
      } else {
        $squad_list = "no";
      }
      $fan = $this->db->query("select * from tb_fans where ((req_from='$userid' and req_to='$id') or (req_from='$id' and req_to='$userid')) and category='fan'");
      if ($fan->num_rows() > 0) {
        $fan_list = "yes";
      } else {
        $fan_list = "no";
      }
      $fanof = $this->db->query("select * from tb_fans where ((req_from='$userid' and req_to='$id') or (req_from='$id' and req_to='$userid')) and category='fan_of'");
      if ($fan->num_rows() > 0) {
        $fanof_list = "yes";
      } else {
        $fanof_list = "no";
      }
      $data[] =  array(
        'userid'        => $result['id'],
        'name'      => $result['name'],
        'profile_pic'      => $pic,
        'bestie_category' => $bestie_list,
        'squad_category' => $squad_list,
        'fan_category' => $fan_list,
        'fanof_category' => $fanof_list,
      );
    }

    return $data;
  }
  public function listusers()
  {
    $id = $this->input->post('userid');
    $query = $this->db->query("select * from tb_user where id!='$id'");
    $result_array =  $query->result_array();
    $data = array();
    foreach ($result_array as $result) {
      if (!empty($result['profile_pic'])) {
        $string = $result['profile_pic'];
        if (preg_match('/[\'^£$%&*()}{@#~?><>,|=_+¬-]/', $string)) {
          // one or more of the 'special characters' found in $string
          // echo "found";
          $pic = $result['profile_pic'];
        } else {
          // echo "not found";
          $pic = base_url() . 'uploads/profile_image/' . $result['profile_pic'];
        }
      } else {
        // echo "not found";
        $pic = base_url() . 'uploads/profile_image/user.png';
      }
      $data[] =  array(
        'userid'        => $result['id'],
        'profile_pic'      => $pic
      );
    }

    return $data;
  }
  public function updateprofile()
  {
    // $id = $this->input->post('userid');
    $name = $this->input->post('name');
    $phone = $this->input->post('phone');
    $email = $this->input->post('email');
    $uni_name = $this->input->post('university');
    $isocode = $this->input->post('code');
    $bio = $this->input->post('bio');
    $gender = $this->input->post('gender');

    $query =  $this->db->query("select * from tb_user where email='$email'");
    if ($this->db->affected_rows() > 0) {
      $result_array =  $query->row();
      $password = $result_array->password;
      // echo $password;die();
      $data = array(
        'name'  => $name,
        'phone' => $phone,
        'email'  => $email,
        'password' => $password,
        'university_name'  => $uni_name,
        'isocode'  => $isocode,
        'bio' => $bio,
        'gender' => $gender
      );
      $this->db->where('email', $email);
      $this->db->update('tb_user', $data);
      if ($this->db->affected_rows() > 0) {
        $this->db->select('*');
        $this->db->from('tb_user');
        $this->db->where('email', $email);
        $query = $this->db->get();
        $result_array =  $query->result_array();
        $data = array();

        foreach ($result_array as $result) {
          $userid = $result['id'];
          $squad = $this->db->query("select count(*) as squad_count from tb_bestie where (req_from='$userid' or req_to='$userid') and category='squad'");
          $result_squad = $squad->row();
          // print_r($result_squad);
          // echo ;die();
          $bestie = $this->db->query("select count(*) as bestie_count from tb_bestie where (req_from='$userid' or req_to='$userid') and category='bestie'");
          $result_bestie = $bestie->row();
          $fan = $this->db->query("select count(*) as fan_count from tb_fans where (req_from='$userid' or req_to='$userid') and category='fan'");
          $result_fan = $fan->row();
          $fanof = $this->db->query("select count(*) as fanof_count from tb_fans where (req_from='$userid' or req_to='$userid') and category='fan_of'");
          $result_fanof = $fanof->row();
          date_default_timezone_set('Asia/Kolkata');
          $current_date    = date('Y-m-d H:i:s');
          $matches = $this->db->query("select count(*) as match_count from tb_match where invitation_status='accept' and (rival_id='$userid' or opponent_id='$userid')");
          $result_matches = $matches->row();

          $data[] =  array(
            'userid'        => $result['id'],
            'name'      => $result['name'],
            'email'       => $result['email'],
            'university_name' => $result['university_name'],
            'phone_number' => $result['phone'],
            'country_code' => $result['isocode'],
            'bio' => $result['bio'],
            'gender' => $result['gender'],
            'squad_count' => $result_squad->squad_count,
            'bestie_count' => $result_bestie->bestie_count,
            'fans_count' => $result_fan->fan_count,
            'fans_of_count' => $result_fanof->fanof_count,
            'matches_count' => $result_matches->match_count
          );
        }

        return $data;
      }
    }
  }
  public function profilepicupdate($image)
  {
    $uid = $this->input->post('userid');
    $check = $this->db->query("update tb_user set profile_pic='$image' WHERE id='$uid'");
    if ($this->db->affected_rows() > 0) {
      return "success";
    } else {
      return "fail";
    }
  }
  public function uploadedfile($image)
  {
    $uid = $this->input->post('userid');
    $send_to = $this->input->post('send_to');
    $data = array(
      'user_id' => $uid,
      'send_to' => $send_to,
      'filename' => $image
    );
    $this->db->insert('tb_userupload', $data);
    if ($this->db->affected_rows() > 0) {
      return "success";
    } else {
      return "fail";
    }
  }
  public function getprofilepic($userid)
  {
    $query =  $this->db->query("select * from tb_user where id='$userid'");
    if ($this->db->affected_rows() > 0) {
      $result_array =  $query->result_array();
      $data = array();
      foreach ($result_array as $result) {
        $userid = $result['id'];
        $squad = $this->db->query("select count(*) as squad_count from tb_bestie where (req_from='$userid' or req_to='$userid') and category='squad'");
        $result_squad = $squad->row();
        // print_r($result_squad);
        // echo ;die();
        $bestie = $this->db->query("select count(*) as bestie_count from tb_bestie where (req_from='$userid' or req_to='$userid') and category='bestie'");
        $result_bestie = $bestie->row();
        $fan = $this->db->query("select count(*) as fan_count from tb_fans where (req_from='$userid' or req_to='$userid') and category='fan'");
        $result_fan = $fan->row();
        $fanof = $this->db->query("select count(*) as fanof_count from tb_fans where (req_from='$userid' or req_to='$userid') and category='fan_of'");
        $result_fanof = $fanof->row();
        date_default_timezone_set('Asia/Kolkata');
        $current_date    = date('Y-m-d H:i:s');
        $matches = $this->db->query("select count(*) as match_count from tb_match where invitation_status='accept' and (rival_id='$userid' or opponent_id='$userid')");
        $result_matches = $matches->row();
        $matchesinvitation = $this->db->query("select count(*) as invitationcount from tb_match WHERE opponent_id='$userid' AND `invitation_status` IS NULL");
        $result_matcheinvitation = $matchesinvitation->row();
        if (!empty($result['profile_pic'])) {
          $string = $result['profile_pic'];
          if (preg_match('/[\'^£$%&*()}{@#~?><>,|=_+¬-]/', $string)) {
            // one or more of the 'special characters' found in $string
            // echo "found";
            $pic = $result['profile_pic'];
          } else {
            // echo "not found";
            $pic = base_url() . 'uploads/profile_image/' . $result['profile_pic'];
          }
        } else {
          // echo "not found";
          $pic = base_url() . 'uploads/profile_image/user.png';
        }
        $data[] =  array(
          'userid'        => $result['id'],
          'name'      => $result['name'],
          'email'       => $result['email'],
          'university_name' => $result['university_name'],
          'phone_number' => $result['phone'],
          'country_code' => $result['isocode'],
          'bio' => $result['bio'],
          'gender' => $result['gender'],
          'profile_pic'      => $pic,
          'squad_count' => $result_squad->squad_count,
          'bestie_count' => $result_bestie->bestie_count,
          'fans_count' => $result_fan->fan_count,
          'fans_of_count' => $result_fanof->fanof_count,
          'matches_count' => $result_matches->match_count,
          'matches_invitationcount' => $result_matcheinvitation->invitationcount
        );
      }

      return $data;
    }
  }
  public function add_bestie()
  {
    $from = $this->input->post('from');
    $to = $this->input->post('to');
    $category = $this->input->post('category');
    $data = array(
      'req_from' => $this->input->post('from'),
      'req_to' => $this->input->post('to'),
      'category' => $this->input->post('category'),
    );
    $query =  $this->db->query("select * from tb_user where id='$from'"); //sender
    $queryto =  $this->db->query("select * from tb_user where id='$to'"); //receiver
    if ($this->db->affected_rows() > 0) {
      // echo "select * from tb_bestie where (req_from='$from' and req_to='$to') or (req_from='$to' and req_to='$from') and category='$category'";die();
      $result_query =  $this->db->query("select * from tb_bestie where ((req_from='$from' and req_to='$to') or (req_from='$to' and req_to='$from')) and category='$category'");
      if ($this->db->affected_rows() > 0) {
        return "exist";
      } else {
        $this->db->insert('tb_bestie', $data);
        if ($this->db->affected_rows() > 0) {
          $bestie_id = $this->db->insert_id();
          $result_array =  $query->row();
          $senderdevtoken = $result_array->device_token;
          $sendermessage = $result_array->name . ' ' . 'added you as ' . $category;
          $senderdevicetype = $result_array->device_type;
          $resultarray =  $queryto->row();
          $receiverdevtoken = $resultarray->device_token;
          $receivermessage = 'You have added ' . $resultarray->name . ' to your ' . $category . ' list';
          $receiverdevicetype = $resultarray->device_type;
          $data = array(
            'sender_id' => $this->input->post('from'),
            'receiver_id' => $this->input->post('to'),
            'message' => $result_array->name . ' ' . 'added you as ' . $category,
            'notification_status' => 'Add_Bestie',
            'request_id' => $bestie_id
          );
          $this->db->insert('tb_notification', $data);
          $this->push($senderdevtoken, $sendermessage, $senderdevicetype);
          $data = array(
            'sender_id' => $this->input->post('to'),
            'receiver_id' => $this->input->post('from'),
            'message' =>  'You have added ' . $resultarray->name . ' to your ' . $category . ' list',
            'notification_status' => 'Add_Bestie',
            'request_id' => $bestie_id
          );
          $this->db->insert('tb_notification', $data);
          $this->push($receiverdevtoken, $receivermessage, $receiverdevicetype);
          return "success";
        } else {
          return "fail";
        }
      }
    }
  }
  public function get_notification($userid)
  {
    $query =  $this->db->query("select * from tb_notification where receiver_id='$userid'");
    if ($this->db->affected_rows() > 0) {
      $result_array =  $query->result_array();
      $data = array();
      foreach ($result_array as $result) {
        $data[] =  array(
          'request_id'        => $result['request_id'],
          'message'      => $result['message']
        );
      }

      return $data;
    }
  }
  public function accept_or_reject()
  {
    $reqid = $this->input->post('request_id');
    $status = $this->input->post('status');
    $result = $this->db->query("select * from  tb_bestie WHERE bestie_id='$reqid'");
    if ($this->db->affected_rows() > 0) {
      $check = $this->db->query("update tb_bestie set req_status='$status' WHERE bestie_id='$reqid'");
      if ($this->db->affected_rows() > 0) {
        $output =  $result->row();
        $from = $output->req_from;
        $to = $output->req_to;
        $query =  $this->db->query("select * from tb_user where id='$from'"); //sender
        $queryto =  $this->db->query("select * from tb_user where id='$to'"); //receiver
        $result_array =  $query->row();
        $senderdevtoken = $result_array->device_token;
        $sendermessage = 'Your request is ' . $status . ' by ' . $result_array->name;
        $senderdevicetype = $result_array->device_type;
        $resultarray =  $queryto->row();
        $receiverdevtoken = $resultarray->device_token;
        $receivermessage = 'You have ' . $status . ' request from' . $resultarray->name;
        $receiverdevicetype = $resultarray->device_type;
        $data = array(
          'sender_id' => $this->input->post('from'),
          'receiver_id' => $this->input->post('to'),
          'message' => 'Your request is ' . $status . ' by ' . $result_array->name,
          'notification_status' => 'accept_or_reject',
          'request_id' => $reqid
        );
        $this->db->insert('tb_notification', $data);
        $this->push($senderdevtoken, $sendermessage, $senderdevicetype);
        $datas = array(
          'sender_id' => $this->input->post('to'),
          'receiver_id' => $this->input->post('from'),
          'message' =>  'You have ' . $status . ' request from' . $resultarray->name,
          'notification_status' => 'accept_or_reject',
          'request_id' => $reqid
        );
        $this->db->insert('tb_notification', $datas);
        $this->push($receiverdevtoken, $receivermessage, $receiverdevicetype);
        return "success";
      } else {
        return "fail";
      }
    }
  }
  public function list_besties($id)
  {
    // echo $id;
    $query = $this->db->query("SELECT * FROM `tb_bestie` WHERE (req_from='$id' or req_to='$id') and category='bestie'");
    // echo "SELECT * FROM `tb_bestie` WHERE req_from='$id' or req_to='$id' ";
    $result_array =  $query->result_array();
    // print_r( $result_array);die();
    $data = array();
    foreach ($result_array as $results) {
      // print_r($results['req_from']);die();
      if ($results['req_from'] == $id) {
        $userid = $results['req_to'];
      } else {
        $userid = $results['req_from'];
      }
      // print_r($userid);die();
      $result_query = $this->db->query("SELECT * FROM `tb_user` WHERE id='$userid'");
      $output =  $result_query->result_array();
      foreach ($output as $result) {
        if (!empty($result['profile_pic'])) {
          $string = $result['profile_pic'];
          if (preg_match('/[\'^£$%&*()}{@#~?><>,|=_+¬-]/', $string)) {
            // one or more of the 'special characters' found in $string
            // echo "found";
            $pic = $result['profile_pic'];
          } else {
            // echo "not found";
            $pic = base_url() . 'uploads/profile_image/' . $result['profile_pic'];
          }
        } else {
          // echo "not found";
          $pic = base_url() . 'uploads/profile_image/user.png';
        }
        $data[] =  array(
          'tableid'        => $results['bestie_id'],
          'userid'        => $result['id'],
          'name'      => $result['name'],
          'email'       => $result['email'],
          'university_name' => $result['university_name'],
          'profile_pic'      => $pic,
          'category' => $results['category'],
          'likes' => ' ',
          'comments' => ' ',
        );
      }
    }

    return $data;
  }
  public function list_squad($id)
  {
    // echo $id;
    $query = $this->db->query("SELECT * FROM `tb_bestie` WHERE (req_from='$id' or req_to='$id') and category='squad'");
    // echo "SELECT * FROM `tb_bestie` WHERE req_from='$id' or req_to='$id' ";
    $result_array =  $query->result_array();
    // print_r( $result_array);die();
    $data = array();
    foreach ($result_array as $results) {
      // print_r($results['req_from']);die();
      if ($results['req_from'] == $id) {
        $userid = $results['req_to'];
      } else {
        $userid = $results['req_from'];
      }
      // print_r($userid);die();
      $result_query = $this->db->query("SELECT * FROM `tb_user` WHERE id='$userid'");
      $output =  $result_query->result_array();
      foreach ($output as $result) {
        if (!empty($result['profile_pic'])) {
          $string = $result['profile_pic'];
          if (preg_match('/[\'^£$%&*()}{@#~?><>,|=_+¬-]/', $string)) {
            // one or more of the 'special characters' found in $string
            // echo "found";
            $pic = $result['profile_pic'];
          } else {
            // echo "not found";
            $pic = base_url() . 'uploads/profile_image/' . $result['profile_pic'];
          }
        } else {
          // echo "not found";
          $pic = base_url() . 'uploads/profile_image/user.png';
        }
        $data[] =  array(
          'tableid'        => $results['bestie_id'],
          'userid'        => $result['id'],
          'name'      => $result['name'],
          'email'       => $result['email'],
          'university_name' => $result['university_name'],
          'profile_pic'      => $pic,
          'category' => $results['category'],
          'likes' => ' ',
          'comments' => ' ',
        );
      }
    }

    return $data;
  }
  public function statusbar()
  {
    $userid = $this->input->post('userid');
    $category = $this->input->post('category');
    $text = $this->input->post('text');
    $send_to = $this->input->post('send_to');
    // echo $text;die();
    $data = array(
      'userid' => $this->input->post('userid'),
      'category' => $this->input->post('category'),
      'text' => $this->input->post('text'),
      'send_to' => $this->input->post('send_to'),
    );
    $result_query = $this->db->query("SELECT * FROM `tb_statusbar` WHERE userid='$userid' and category='$category' and send_to='$send_to' ");
    if ($this->db->affected_rows() > 0) {
      // echo "yes";die();
      $check = $this->db->query("update tb_statusbar set text='$text' WHERE userid='$userid' and category='$category' and send_to='$send_to'");
    } else {
      $this->db->insert('tb_statusbar', $data);
    }
    return $data;
  }
  public function getstatus()
  {
    $userid = $this->input->post('userid');
    $senderid = $this->input->post('senderid');
    $result_query = $this->db->query("SELECT * FROM `tb_statusbar` WHERE userid='$userid' and send_to='$senderid' and category='story'");
    $output = $result_query->result_array();
    // print_r($output);die();
    $data = array();
    foreach ($output as $result) {
      $data[] =  array(
        'statusid'        => $result['statusid'],
        'category'      => $result['category'],
        'text'       => $result['text']
      );
    }
    // print_r($data);die();
    return $data;
  }
  public function getuploadfile() //get user uploaded file in besties
  {
    $userid = $this->input->post('userid');
    $senderid = $this->input->post('senderid');
    $result_query = $this->db->query("SELECT * FROM `tb_userupload` WHERE user_id='$userid' and send_to='$senderid'");
    if ($result_query->num_rows() > 0) {
      $output = $result_query->result_array();
      // print_r($output);die();
      $data = array();
      foreach ($output as $result) {
        $data[] =  array(
          'file_link'        => base_url() . 'uploads/Useruploads/' . $result['filename']
        );
      }
    } else {
      $data[] =  array(
        'file_link'        => base_url() . 'uploads/Useruploads/upload_default.jpg'
      );
    }
    // print_r($data);die();
    return $data;
  }
  public function getstatus_letter()
  {
    $userid = $this->input->post('userid');
    $senderid = $this->input->post('senderid');
    $result_query = $this->db->query("SELECT * FROM `tb_statusbar` WHERE userid='$userid' and send_to='$senderid' and category='letter'");
    $output = $result_query->result_array();
    // print_r($output);die();
    $data = array();
    foreach ($output as $result) {
      $data[] =  array(
        'statusid'        => $result['statusid'],
        'category'      => $result['category'],
        'text'       => $result['text']
      );
    }
    // print_r($data);die();
    return $data;
  }
  public function getstatus_slogan()
  {
    $userid = $this->input->post('userid');
    $senderid = $this->input->post('senderid');
    $result_query = $this->db->query("SELECT * FROM `tb_statusbar` WHERE userid='$userid' and send_to='$senderid' and category='slogan'");
    $output = $result_query->result_array();
    // print_r($output);die();
    $data = array();
    foreach ($output as $result) {
      $data[] =  array(
        'statusid'        => $result['statusid'],
        'category'      => $result['category'],
        'text'       => $result['text']
      );
    }
    // print_r($data);die();
    return $data;
  }
  public function match_invitation()
  {
    date_default_timezone_set('Asia/Kolkata');
    $current_date    = date('Y-m-d H:i:s');
    $rival_id = $this->input->post('rival_id');
    $opponent_id = $this->input->post('opponent_id');
    $category = $this->input->post('category');
    $uploadid = $this->input->post('uploaded_id');
    $data = array(
      'rival_id' => $this->input->post('rival_id'),
      'opponent_id' => $this->input->post('opponent_id'),
      'description' => $this->input->post('description'),
      'time_duration' => $this->input->post('time_duration'),
      'caption' => $this->input->post('caption'),
      'category' => $this->input->post('category'),
      'created_at' => $current_date
    );
    $query =  $this->db->query("select * from tb_user where id='$rival_id'");
    $queryto =  $this->db->query("select * from tb_user where id='$opponent_id'");
    if ($this->db->affected_rows() > 0) {
      // echo "select * from tb_bestie where (req_from='$from' and req_to='$to') or (req_from='$to' and req_to='$from') and category='$category'";die();
      $checkresult_query =  $this->db->query("select * from tb_match where (rival_id='$rival_id' and opponent_id='$opponent_id') and `invitation_status` IS NULL");
      // if ($this->db->affected_rows() > 0) {
      //   return "exist";
      // } else {
      $result_query =  $this->db->query("select * from tb_match where (rival_id='$rival_id' and opponent_id='$opponent_id') and category='$category' and match_end>'$current_date'");
      // if ($this->db->affected_rows() > 0) {
      //   return "exist";
      // } else {
      $this->db->insert('tb_match', $data);
      $match_id = $this->db->insert_id();
      if ($this->db->affected_rows() > 0) {
        $result_array =  $query->row();
        $resultarray =  $queryto->row();
        // $imagedata = array(
        //   'matchid' => $matchid,
        //   'user_uploaded' =>$rival_id,
        //   'filename' => $imagename,
        //   'created_at' => $current_date
        // );
        //   $this->db->insert('tb_matchupload', $imagedata );
        $check = $this->db->query("update tb_matchupload set matchid='$match_id' WHERE mup_id= $uploadid ");
        

        $data = array(
          'sender_id' => $rival_id,
          'receiver_id' => $opponent_id,
          'message' => $result_array->name . ' ' . 'Invited you from ' . $category . ' list to have a Match of ' . $this->input->post('time_duration') . ' duration',//receiver msg
          'notification_status' => 'Match_invitation',
          'request_id' => $match_id
        );
        $this->db->insert('tb_notification', $data);
        
        $senderdevtoken = $result_array->device_token;
        $sendermessage ='You have Invited ' . $resultarray->name . ' from ' . $category . ' list to have a Match of ' . $this->input->post('time_duration') . ' duration';
        $senderdevicetype = $result_array->device_type;
        // echo $senderdevtoken; echo $sendermessage; echo $senderdevicetype.'senderdata';
        $this->push($senderdevtoken, $sendermessage, $senderdevicetype);
        $receiverdevtoken = $resultarray->device_token;
        $receivermessage = $result_array->name . ' ' . 'Invited you from ' . $category . ' list to have a Match of ' . $this->input->post('time_duration') . ' duration';
        $receiverdevicetype = $resultarray->device_type;
        $data = array(
          'sender_id' => $opponent_id,
          'receiver_id' => $rival_id,
          'message' =>  'You have been Invited by ' . $resultarray->name . ' to have a Match of ' . $this->input->post('time_duration') . ' duration',
          'notification_status' => 'Match_invitation',
          'request_id' => $match_id
        );
        $this->db->insert('tb_notification', $data);
        // echo $receiverdevtoken; echo $receivermessage; echo $receiverdevicetype.'receiverdata';
        $this->push($receiverdevtoken, $receivermessage, $receiverdevicetype);
        // $resultdata=array(
        //   'match_id' => $matchid,
        //   'file_link'=>base_url() . 'uploads/Matchuploads/'.$imagename
        // );
        return "success";
      } else {
        return "fail";
      }
      // }
      // }
    } else {
      return "nouser";
    }
  }
  public function get_existingmatch()
  {
    $rival_id = $this->input->post('rival_id');
    $opponent_id = $this->input->post('opponent_id');
    $category = $this->input->post('category');
    $result_query =  $this->db->query("select * from tb_match where (rival_id='$rival_id' and opponent_id='$opponent_id') and category='$category'");
    if ($this->db->affected_rows() > 0) {
      // return "exist";
      $output = $result_query->row();
      $queryto =  $this->db->query("select * from tb_user where id='$opponent_id'");
      $outputqueryto = $queryto->row();
      $data[] = array(
        'matchid' => $output->matchid,
        'reciever_name' => $outputqueryto->name,
        'description' => $output->description,
        'caption' => $output->caption,
        'duration' => $output->time_duration
      );
    }
    return $data;
  }
  public function Match_accept_or_reject()
  {
    date_default_timezone_set('Asia/Kolkata');
    $current_date    = date('Y-m-d H:i:s');
    $reqid = $this->input->post('request_id');
    $status = $this->input->post('status');
    // echo "select * from tb_match WHERE matchid='$reqid' and `invitation_status` IS NULL";die();
    $result = $this->db->query("select * from tb_match WHERE matchid='$reqid' and `invitation_status` IS NULL");
    if ($this->db->affected_rows() > 0) {
      if ($status == 'accept') {
        $match_status = 1;
      } else {
        $match_status = 0;
      }
      $check = $this->db->query("update tb_match set invitation_status='$status',replied_at='$current_date',match_status=$match_status WHERE matchid='$reqid'");

      if ($this->db->affected_rows() > 0) {
        $output =  $result->row();
        $time = $output->time_duration;
        if ($status == "accept") {
          $match_end = date('Y-m-d H:i:s', strtotime($time));
        } else {
          $match_end = ' ';
        }
        $check = $this->db->query("update tb_match set match_end='$match_end' WHERE matchid='$reqid'");
        $from = $output->rival_id;
        $to = $output->opponent_id;
        $fromdata=$this->db->query("SELECT * FROM `tb_user` WHERE id='$from'");
        $fdata=$fromdata->row();
        $fromname=$fdata->name;
        $todata=$this->db->query("SELECT * FROM `tb_user` WHERE id='$to'");
        $tdata=$todata->row();
        $toname=$tdata->name;
        if ($status == "accept"){//only send push notification if accepted the request
        //fans of rival start
        $rivalfanquery = $this->db->query("SELECT * FROM `tb_fans` WHERE (req_from='$from' or req_to='$from') and category='fan'");
        $rivalfanresult_array =  $rivalfanquery->result_array();
       
        foreach ($rivalfanresult_array as $results) {
          if ($results['req_from'] == $from) {
            $rivalfanuserid = $results['req_to'];
          } else {
            $rivalfanuserid = $results['req_from'];
          }
          $rivalfanresult_query = $this->db->query("SELECT * FROM `tb_user` WHERE id='$rivalfanuserid'");
          if($rivalfanresult_query ->num_rows()>0){
          $rivalfanoutput =  $rivalfanresult_query->row();
          // print_r($rivalfanoutput);die();
          // foreach ($rivalfanoutput as $result) {
            $rivalfandevicetoken = $rivalfanoutput->device_token;
            $rivalfandevicetype = $rivalfanoutput->device_type;
            $pushmessage="$fromname added a new open match with $toname, Open app to view the contest";
            $datas = array(
              'sender_id' => $from,
              'receiver_id' => $to,
              'message' =>$pushmessage,
              'notification_status' => 'fan_notification',
              'request_id' =>" "
            );
            $this->db->insert('tb_notification', $datas);
            $this->push($rivalfandevicetoken, $pushmessage, $rivalfandevicetype);
          // }
        }
        }
        //end
         //fans of opponent start
         $opponentfanquery = $this->db->query("SELECT * FROM `tb_fans` WHERE (req_from='$to' or req_to='$to') and category='fan'");
         $opponentfanresult_array =  $opponentfanquery->result_array();
        
         foreach ($opponentfanresult_array as $results) {
           if ($results['req_from'] == $to) {
             $opponentfanuserid = $results['req_to'];
           } else {
             $opponentfanuserid = $results['req_from'];
           }
           $opponentfanresult_query = $this->db->query("SELECT * FROM `tb_user` WHERE id='$opponentfanuserid'");
           if($opponentfanresult_query->num_rows()>0){
           $opponentfanoutput =  $opponentfanresult_query->row();
          //  print_r($opponentfanoutput);die();
          //  foreach ($opponentfanoutput as $result) {
             $opponentfandevicetoken =$opponentfanoutput->device_token;
             $opponentfandevicetype = $opponentfanoutput->device_type;
             $pushmessage="$fromname added a new open match with $toname, Open app to view the contest";
             $datas = array(
               'sender_id' => $from,
               'receiver_id' => $to,
               'message' =>$pushmessage,
               'notification_status' => 'fan_notification',
               'request_id' =>" "
             );
             $this->db->insert('tb_notification', $datas);
             $this->push($opponentfandevicetoken, $pushmessage, $opponentfandevicetype);
          //  }
          }
         }
         //end
        }
        $query =  $this->db->query("select * from tb_user where id='$from'");
        $queryto =  $this->db->query("select * from tb_user where id='$to'");
        $result_array =  $query->row();
        $resultarray =  $queryto->row();
        if ($status == "accept") {
          $message = "accepted";
        } else {
          $message = "rejected";
        }
        $senderdevtoken = $result_array->device_token;
        $sendermessage = 'Your Invitation is ' . $message . ' by ' . $resultarray->name;
        $senderdevicetype = $result_array->device_type;
        $data = array(
          'sender_id' => $from,
          'receiver_id' => $to,
          'message' => 'Your Invitation is ' . $message . ' by ' . $resultarray->name,
          'notification_status' => 'match_reply',
          'request_id' => $reqid
        );
        $this->db->insert('tb_notification', $data);
        $this->push($senderdevtoken, $sendermessage, $senderdevicetype);
        $receiverdevtoken = $resultarray->device_token;
        $receivermessage = 'You have ' . $message . ' Invitation from ' . $result_array->name;
        $receiverdevicetype = $resultarray->device_type;
        $datas = array(
          'sender_id' => $to,
          'receiver_id' => $from,
          'message' =>  'You have ' . $message . ' Invitation from ' . $result_array->name,
          'notification_status' => 'match_reply',
          'request_id' => $reqid
        );
        $this->db->insert('tb_notification', $datas);
        $this->push($receiverdevtoken, $receivermessage, $receiverdevicetype);
        return "success";
      } else {
        return "fail";
      }
    } else {
      return "noinvitation";
    }
  }

  public function get_myinvitation()
  {
    $userid = $this->input->post('userid');
    $result = $this->db->query("select * from tb_match WHERE opponent_id='$userid' AND `invitation_status` IS NULL");
    if ($this->db->affected_rows() > 0) {
      $result_array = $result->result_array();
      $data = array();
      foreach ($result_array as $result) {
        $uid = $result['rival_id'];
        $matchid = $result['matchid'];
        $query = $this->db->query("select * from tb_user WHERE id='$uid'");
        $output = $query->row();
        if (!empty($output->profile_pic)) {
          $string = $output->profile_pic;
          if (preg_match('/[\'^£$%&*()}{@#~?><>,|=_+¬-]/', $string)) {
            // one or more of the 'special characters' found in $string
            // echo "found";
            $pic = $output->profile_pic;
          } else {
            // echo "not found";
            $pic = base_url() . 'uploads/profile_image/' . $output->profile_pic;
          }
        } else {
          // echo "not found";
          $pic = base_url() . 'uploads/profile_image/user.png';
        }
        $matchsenderfilequery = $this->db->query("select * from tb_matchupload WHERE user_uploaded='$userid' and matchid=$matchid"); //rival
        if ($matchsenderfilequery->num_rows() > 0) {
          $senderfileoutput = $matchsenderfilequery->row();

        $sfilename = $senderfileoutput->filename;
        $sfiletype = $senderfileoutput->filetype;
        if ($sfiletype == 'file') {
          $sfile = base_url() . 'uploads/Matchuploads/' . $sfilename;
        } else {
          $sfile = $sfilename;
        }
      } else {
        $sfile = base_url() . 'assets/images/splash.jpg';
      }
      $matchoppofilequery = $this->db->query("select * from tb_matchupload WHERE user_uploaded='$uid' and matchid=$matchid"); //rival
      if ($matchoppofilequery->num_rows() > 0) {
        $oppofileoutput = $matchoppofilequery->row();

        $ofilename = $oppofileoutput->filename;
        $ofiletype = $oppofileoutput->filetype;
        if ($ofiletype == 'file') {
          $ofile = base_url() . 'uploads/Matchuploads/' . $ofilename;
        } else {
          $ofile = $ofilename;
        }
      } else {
        $ofile = base_url() . 'assets/images/splash.jpg';
      }
        $data[] =  array(
          'match_id'        => $result['matchid'],
          'senderid'        => $result['rival_id'],
          'sender_name' => $output->name,
          'receiverid'      => $result['opponent_id'],
          'description'       => $result['description'],
          'time_duration'        => $result['time_duration'],
          'caption'      => $result['caption'],
          'category'       => $result['category'],
          'user_profile' => $pic,
          'sender_image' => $sfile,
        'receiver_image' => $ofile
        );
      }

      return $data;
    }
  }
  public function getmyinvitation_files()
  {
    $userid = $this->input->post('userid');
    $result = $this->db->query("select * from tb_match WHERE opponent_id='$userid' AND `invitation_status` IS NULL");
    if ($this->db->affected_rows() > 0) {
      $result_array = $result->result_array();
      $data = array();
      foreach ($result_array as $results) {
        $mid = $results['matchid'];
        $query = $this->db->query("select * from tb_matchupload WHERE matchid='$mid'");
        $output = $query->result_array();
        foreach ($output as $result) {
          $filetype = $result['filetype'];
          if ($filetype == 'file') {
            $file = base_url() . 'uploads/Matchuploads/' . $result['filename'];
          } else {
            $file = $result['filename'];
          }
          $data[] =  array(
            'id'        => $result['mup_id'],
            'matchid'       => $result['matchid'],
            'useruploaded'        => $result['user_uploaded'],
            'filename'      => $file,
            'filetype' => $result['filetype'],
            'created_at'        => $result['created_at']
          );
        }
      }
      return $data;
    }
  }
  public function get_personalmatch() //whom i have send matches
  {
    // echo "hi";die();
    date_default_timezone_set('Asia/Kolkata');
    $current_date    = date('Y-m-d H:i:s');
    $user_id = $this->input->post('userid');
    // echo "select * from tb_match WHERE rival_id='$userid' and invitation_status='accept' and match_end>='$current_date'";die();
    $result = $this->db->query("select * from tb_match WHERE rival_id='$user_id' and invitation_status='accept' and match_end<'$current_date'");
    if ($this->db->affected_rows() > 0) {
      $result_array = $result->result_array();
      $data = array();
      foreach ($result_array as $result) {
        $matchid = $result['matchid'];
        $uid = $result['rival_id'];
        $query = $this->db->query("select * from tb_user WHERE id='$uid'");
        $output = $query->row();
        $userid = $result['opponent_id'];
        $queryresult = $this->db->query("select * from tb_user WHERE id='$userid'");
        $outputdata = $queryresult->row();
        // echo "select * from tb_like WHERE contestent_id='$user_id' and matchid='$matchid' and like_status='like'";die();contestent_id='$user_id' and 
        $likequery = $this->db->query("select count(*) as total_like from tb_like WHERE matchid='$matchid' and like_status='like'");
        $likeresult = $likequery->row();
        // print_r($likeresult);die();
        $data[] =  array(
          'match_id'        => $result['matchid'],
          'senderid'        => $result['rival_id'],
          'sender_name' => $output->name,
          'receiverid'      => $result['opponent_id'],
          'receiver_name' => $outputdata->name,
          'sender_image' => base_url() . 'assets/images/splash.jpg',
          'receiver_image' => base_url() . 'assets/images/splash.jpg',
          // 'description'       => $result['description'],
          // 'time_duration'        => $result['time_duration'],
          // 'caption'      => $result['caption'],
          'category'       => $result['category'],
          // 'user_profile'=>base_url() . 'uploads/profile_image/user.png',
          'likes' => $likeresult->total_like
        );
      }

      return $data;
    }
  }
  public function get_openmatch() //whom have send matches to me
  {
    date_default_timezone_set('Asia/Kolkata');
    $current_date    = date('Y-m-d H:i:s');
    $userid = $this->input->post('userid');
    // echo "select * from tb_match WHERE (rival_id='$userid' or opponent_id='$userid') and invitation_status='accept' and '$current_date' between replied_at and match_end";die();
    $result = $this->db->query("select * from tb_match  WHERE opponent_id='$userid' and invitation_status='accept' and match_end <'$current_date'");
    // $result = $this->db->query("select * from tb_match WHERE (rival_id='$userid' or opponent_id='$userid') and invitation_status='accept' and '$current_date' between replied_at and match_end");
    if ($this->db->affected_rows() > 0) {
      $result_array = $result->result_array();
      $data = array();
      foreach ($result_array as $result) {
        $matchid = $result['matchid'];
        $rivalid = $result['rival_id']; //rival
        $oppoid = $result['opponent_id']; //opponent
        // echo"select contestent_id from tb_like WHERE user_liked='$userid' and matchid='$matchid'";die();
        $userlike = $this->db->query("select contestent_id from tb_like WHERE user_liked='$userid' and matchid='$matchid'");
        if ($userlike->num_rows() > 0) {
          $userlikes = $userlike->row();
          // print_r($userlikes);die();
          $contid = $userlikes->contestent_id;
          // echo $contid;die();
          if ($contid == $rivalid) {
            // echo "rival match";
            $userrivallike = '1';
            $useroppolike = '0';
            $usercommonlike = '0';
            $agree = '0';
            $disagree = '0';
          }
          if ($contid == 0) {
            // echo "rival match";
            $userrivallike = '0';
            $useroppolike = '0';
            $usercommonlike = '1';
            $commonquerylike = $this->db->query("select count(*) as common_like from tb_like WHERE contestent_id='0' and matchid='$matchid' and like_status='like'");
            $commonquerylikeoutput = $commonquerylike->row();
            $commonquerydislike = $this->db->query("select count(*) as common_dislike from tb_like WHERE contestent_id='0' and matchid='$matchid' and like_status='dislike'");
            $commonquerydislikeoutput = $commonquerydislike->row();
            $agree = $commonquerylikeoutput->common_like;
            $disagree = $commonquerydislikeoutput->common_dislike;
          }
          if ($contid == $oppoid) {
            // echo "oppo match";
            $userrivallike = '0';
            $useroppolike = '1';
            $usercommonlike = '0';
            $agree = '0';
            $disagree = '0';
          }
        } else {
          $userrivallike = '0';
          $useroppolike = '0';
          $usercommonlike = '0';
          $agree = '0';
          $disagree = '0';
        }
        $likequery = $this->db->query("select count(*) as sender_like from tb_like WHERE contestent_id='$rivalid' and matchid='$matchid'");
        $likeoutput = $likequery->row();
        $sender_like = $likeoutput->sender_like;
        $queryresult = $this->db->query("select * from tb_user WHERE id='$rivalid'");
        $outputresult = $queryresult->row();
        if (!empty($outputresult->profile_pic)) {
          $string = $outputresult->profile_pic;
          if (preg_match('/[\'^£$%&*()}{@#~?><>,|=_+¬-]/', $string)) {
            // one or more of the 'special characters' found in $string
            // echo "found";
            $pic = $outputresult->profile_pic;
          } else {
            // echo "not found";
            $pic = base_url() . 'uploads/profile_image/' . $outputresult->profile_pic;
          }
        } else {
          // echo "not found";
          $pic = base_url() . 'uploads/profile_image/user.png';
        }
        $likeoppquery = $this->db->query("select count(*) as receiver_like from tb_like WHERE contestent_id='$oppoid' and matchid='$matchid'");
        $likeoppoutput = $likeoppquery->row();
        $receiver_like = $likeoppoutput->receiver_like;
        $query = $this->db->query("select * from tb_user WHERE id='$oppoid'");
        $output = $query->row();
        if (!empty($output->profile_pic)) {
          $string = $output->profile_pic;
          if (preg_match('/[\'^£$%&*()}{@#~?><>,|=_+¬-]/', $string)) {
            // one or more of the 'special characters' found in $string
            // echo "found";
            $picture = $output->profile_pic;
          } else {
            // echo "not found";
            $picture = base_url() . 'uploads/profile_image/' . $output->profile_pic;
          }
        } else {
          // echo "not found";
          $picture = base_url() . 'uploads/profile_image/user.png';
        }
        $commentquery = $this->db->query("select count(*) as total_comments from tb_comment WHERE match_id='$matchid' and contestent_id!='0'");
        $commentoutput = $commentquery->row();
        $commoncommentquery = $this->db->query("select count(*) as total_commoncomments from tb_comment WHERE match_id='$matchid' AND `contestent_id` = 0");
        $commoncommentoutput = $commoncommentquery->row();
        $data[] =  array(
          'match_id'        => $result['matchid'],
          'senderid'        => $result['rival_id'],
          'sender_name' => $outputresult->name,
          'sender_profile' => $pic,
          'sender_email' => $outputresult->email,
          'receiverid'      => $result['opponent_id'],
          'receiver_name' => $output->name,
          'receiver_profile' => $picture,
          'receiver_email' => $output->email,
          'description'       => $result['description'],
          'time_duration'        => $result['time_duration'],
          'caption'      => $result['caption'],
          'category'       => $result['category'],
          'match_start' => $result['replied_at'],
          'match_end' => $result['match_end'],
          'match_invitationsend' => $result['created_at'],
          'sender_image' => base_url() . 'assets/images/splash.jpg',
          'receiver_image' => base_url() . 'assets/images/splash.jpg',
          'sender_likecount' => $sender_like,
          'sender_likecount' => $sender_like,
          'receiver_likecount' => $receiver_like,
          'total_likecount' => $sender_like + $receiver_like,
          'userliked_sender' => $userrivallike,
          'userliked_receiver' => $useroppolike,
          'userliked_common' => $usercommonlike,
          'agree_count' => $agree,
          'disagree_count' => $disagree,
          'total_comment' => $commentoutput->total_comments,
          'total_commoncomments' => $commoncommentoutput->total_commoncomments,
          'match_status' => $result['match_status'],
        );
      }

      return $data;
    }
  }
  public function get_ongoingmatch()
  {
    date_default_timezone_set('Asia/Kolkata');
    $current_date    = date('Y-m-d H:i:s');
    $user_id = $this->input->post('userid');
    $result = $this->db->query("select * from tb_match WHERE (rival_id='$user_id' or opponent_id='$user_id') and invitation_status='accept' and match_end>='$current_date'");
    $result_array = $result->result_array();
    $data = array();
    foreach ($result_array as $result) {
      $uid = $result['rival_id']; //rival 
      // echo $uid;
      $oppouid = $result['opponent_id']; //opponent
      // echo $oppouid;
      $matchid = $result['matchid'];
      $query = $this->db->query("select * from tb_user WHERE id='$uid'"); //rival
      $output = $query->row();
      $matchsenderfilequery = $this->db->query("select * from tb_matchupload WHERE user_uploaded='$uid' and matchid=$matchid"); //rival
      if ($matchsenderfilequery->num_rows() > 0) {
        $senderfileoutput = $matchsenderfilequery->row();

        $sfilename = $senderfileoutput->filename;
        $sfiletype = $senderfileoutput->filetype;
        if ($sfiletype == 'file') {
          $sfile = base_url() . 'uploads/Matchuploads/' . $sfilename;
        } else {
          $sfile = $sfilename;
        }
      } else {
        $sfile = base_url() . 'assets/images/splash.jpg';
      }
      $matchoppofilequery = $this->db->query("select * from tb_matchupload WHERE user_uploaded='$oppouid' and matchid=$matchid"); //rival
      if ($matchoppofilequery->num_rows() > 0) {
        $oppofileoutput = $matchoppofilequery->row();

        $ofilename = $oppofileoutput->filename;
        $ofiletype = $oppofileoutput->filetype;
        if ($ofiletype == 'file') {
          $ofile = base_url() . 'uploads/Matchuploads/' . $ofilename;
        } else {
          $ofile = $ofilename;
        }
      } else {
        $ofile = base_url() . 'assets/images/splash.jpg';
      }
      $likequery = $this->db->query("select count(*) as sender_like from tb_like WHERE contestent_id='$uid' and matchid='$matchid'");
      $likeoutput = $likequery->row();
      $sender_like = $likeoutput->sender_like;
      $resultquery = $this->db->query("select * from tb_user WHERE id='$oppouid'");
      $resultoutput = $resultquery->row();
      $likeoppquery = $this->db->query("select count(*) as receiver_like from tb_like WHERE contestent_id='$oppouid' and matchid='$matchid'");
      $likeoppoutput = $likeoppquery->row();
      $receiver_like = $likeoppoutput->receiver_like;
      // die();

      if (!empty($output->profile_pic)) {
        $string = $output->profile_pic;
        if (preg_match('/[\'^£$%&*()}{@#~?><>,|=_+¬-]/', $string)) {
          // one or more of the 'special characters' found in $string
          // echo "found";
          $pic = $output->profile_pic;
        } else {
          // echo "not found";
          $pic = base_url() . 'uploads/profile_image/' . $output->profile_pic;
        }
      } else {
        // echo "not found";
        $pic = base_url() . 'uploads/profile_image/user.png';
      }

      if (!empty($resultoutput->profile_pic)) {
        $string = $resultoutput->profile_pic;
        if (preg_match('/[\'^£$%&*()}{@#~?><>,|=_+¬-]/', $string)) {
          // one or more of the 'special characters' found in $string
          // echo "found";
          $picture = $resultoutput->profile_pic;
        } else {
          // echo "not found";
          $picture = base_url() . 'uploads/profile_image/' . $resultoutput->profile_pic;
        }
      } else {
        // echo "not found";
        $picture = base_url() . 'uploads/profile_image/user.png';
      }
      $userlike = $this->db->query("select contestent_id from tb_like WHERE user_liked='$user_id' and matchid='$matchid'");
      // echo "select contestent_id from tb_like WHERE user_liked='$user_id' and matchid='$matchid'";
      if ($userlike->num_rows() > 0) {
        // echo 'yes';
        $userlikes = $userlike->row();
        // print_r($userlikes);
        $contid = $userlikes->contestent_id;
        if ($contid == $uid) {
          // echo "rival match";
          $userrivallike = '1';
          $useroppolike = '0';
        }
        if ($contid == $oppouid) {
          // echo "oppo match";
          $userrivallike = '0';
          $useroppolike = '1';
        }
        if ($contid == 0) {
          // echo "open like ";
          $userrivallike = '0';
          $useroppolike = '0';
        }
      } else {
        $userrivallike = '0';
        $useroppolike = '0';
      }
      // echo $userrivallike;
      // die();
      $cmnt_count = $this->db->query("select count(*) as total_cmnt from tb_comment WHERE match_id='$matchid'");
      $cmntcount = $cmnt_count->row();
      //
      $current_time = date('H:i:s');
      /* Send duration start */
      $stime = $result['replied_at'];
      $start_date = new DateTime($stime);
      $since_start = $start_date->diff(new DateTime($current_time));
      $send_duration_h = $since_start->h;
      $send_duration_i = $since_start->i;
      $send_duration_s = $since_start->s;
      if ($send_duration_h == 0) { //hour is 0
        if ($send_duration_i == 0) { //minute is 0
          $sduration = $send_duration_s . ' seconds';
        } else {
          $sduration = $send_duration_i . ' minutes';
        }
      } else {
        $sduration = $send_duration_h . ' hours';
      }
      // echo $sduration;
      /* Send duration end */
      /* remaning duration start */
      $etime = $result['match_end'];
      $end_date = new DateTime($etime);
      $since_end = $end_date->diff(new DateTime($current_time));
      $remaining_duration_h = $since_end->h;
      $remaining_duration_i = $since_end->i;
      $remaining_duration_s = $since_end->s;
      if ($remaining_duration_h == 0) { //hour is 0
        if ($remaining_duration_i == 0) { //minute is 0
          $rduration = $remaining_duration_s . ' seconds';
        } else {
          $rduration = $remaining_duration_i . ' minutes';
        }
      } else {
        $rduration = $remaining_duration_h . ' hours';
      }
      // echo $rduration;
      /* remaning duration end */
      //
      // die();

      $data[] =  array(
        'match_id'        => $result['matchid'],
        'senderid'        => $result['rival_id'],
        'sender_name' => $output->name,
        'sender_profile' => $pic,
        'sender_email' => $output->email,
        'receiverid'      => $result['opponent_id'],
        'receiver_name' => $resultoutput->name,
        'receiver_profile' => $picture,
        'receiver_email' => $resultoutput->email,
        'description'       => $result['description'],
        'time_duration'        => $result['time_duration'],
        'caption'      => $result['caption'],
        'category'       => $result['category'],
        'match_start' => $result['replied_at'],
        'match_end' => $result['match_end'],
        'match_invitationsend' => $result['created_at'],
        'sender_image' => $sfile,
        'receiver_image' => $ofile,
        'sender_likecount' => $sender_like,
        'receiver_likecount' => $receiver_like,
        'total_likecount' => $sender_like + $receiver_like,
        'userliked_sender' => $userrivallike,
        'userliked_receiver' => $useroppolike,
        'send_duration' => $sduration,
        'remaining_time' => $rduration,
        'total_comment_count' => $cmntcount->total_cmnt,
        'match_status' => $result['match_status'],
      );
    }
    return $data;
  }
  public function like()
  {
    $uid = $this->input->post('userid');
    $mid = $this->input->post('matchid');
    $cid = $this->input->post('contestentid');
    $status = $this->input->post('status');
    $result = $this->db->query("select * from tb_match WHERE matchid='$mid'");
    if ($this->db->affected_rows() > 0) {
      $result = $this->db->query("select * from tb_like WHERE user_liked='$uid' and matchid='$mid'");
      if ($this->db->affected_rows() > 0) {
        $check = $this->db->query("update tb_like set contestent_id='$cid',like_status='$status' WHERE user_liked='$uid' and matchid='$mid'");
        if ($this->db->affected_rows() > 0) {
          return "success";
        } else {
          return "fail";
        }
      } else {
        $data = array(
          'user_liked' => $this->input->post('userid'),
          'matchid' => $this->input->post('matchid'),
          'contestent_id' => $this->input->post('contestentid'),
          'like_status' => $this->input->post('status')
        );
        $this->db->insert('tb_like', $data);
        if ($this->db->affected_rows() > 0) {
          return "success";
        } else {
          return "fail";
        }
      }
    } else {
      return "notexist";
    }
  }
  public function addcomment()
  {
    $uid = $this->input->post('userid');
    $mid = $this->input->post('matchid');
    $cid = $this->input->post('comment');
    $contestentid = $this->input->post('contestentid');
    $result = $this->db->query("select * from tb_match WHERE matchid='$mid'");
    if ($this->db->affected_rows() > 0) {
      // $result = $this->db->query("select * from tb_like WHERE user_liked='$uid' and matchid='$mid'");
      // if ($this->db->affected_rows() > 0) {
      //  $check = $this->db->query("update tb_like set contestent_id='$cid',like_status='$status' WHERE user_liked='$uid' and matchid='$mid'"); 
      //  if ($this->db->affected_rows() > 0) {
      //   return "success";
      // } else {
      //   return "fail";
      // }
      // }
      // else{
      $data = array(
        'userid' => $this->input->post('userid'),
        'match_id' => $this->input->post('matchid'),
        'comment' => $this->input->post('comment'),
        'contestent_id' => $this->input->post('contestentid')
      );
      $this->db->insert('tb_comment', $data);
      if ($this->db->affected_rows() > 0) {
        return "success";
      } else {
        return "fail";
      }
      // } 
    } else {
      return "notexist";
    }
  }
  public function getComment()
  {
    $userid = $this->input->post('userid');
    $matchid = $this->input->post('matchid');
    $quwe = $this->db->query("SELECT count(*) as total_count FROM `tb_comment` WHERE contestent_id='$userid' and match_id='$matchid' ");
    $quweoutput = $quwe->row();
    $result_query = $this->db->query("SELECT * FROM `tb_comment` WHERE contestent_id='$userid' and match_id='$matchid' and replied_commentid='0'");
    $output = $result_query->result_array();
    // print_r($output);die();
    $data = array();
    foreach ($output as $result) {
      $uid = $result['userid'];
      $cid = $result['comment_id'];
      $cl_count = $this->db->query("SELECT count(*) as cl_count FROM `tb_commentlike` WHERE commentid='$cid'");
      $cloutput = $cl_count->row();

      $resultuser = $this->db->query("SELECT * FROM `tb_user` WHERE id='$uid'");
      $output = $resultuser->row();
      if (!empty($output->profile_pic)) {
        $string = $output->profile_pic;
        if (preg_match('/[\'^£$%&*()}{@#~?><>,|=_+¬-]/', $string)) {
          // one or more of the 'special characters' found in $string
          // echo "found";
          $pic = $output->profile_pic;
        } else {
          // echo "not found";
          $pic = base_url() . 'uploads/profile_image/' . $output->profile_pic;
        }
      } else {
        // echo "not found";
        $pic = base_url() . 'uploads/profile_image/user.png';
      }

      $data[] =  array(
        'id'        => $result['comment_id'],
        'contestent_id'      => $result['contestent_id'],
        'commented_userid'      => $result['userid'],
        'commented_username'      => $output->name,
        'commented_userprofile'      => $pic,
        'comment'       => $result['comment'],
        'commented_at'       => $result['commented_at'],
        'like' => '0',
        'reply' => '0',
        'total_comment_count'       => $quweoutput->total_count,
        'total_like_count' => $cloutput->cl_count,
        // 'total_reply_like_count' => '0',
        'replied_comment' => $result['replied_commentid']
      );
    }
    // print_r($data);die();
    return $data;
  }
  public function getreplyComment()
  {
    $userid = $this->input->post('userid');
    $matchid = $this->input->post('matchid');
    $result_query = $this->db->query("SELECT * FROM `tb_comment` WHERE contestent_id='$userid' and match_id='$matchid' and replied_commentid!='0'");
    $output = $result_query->result_array();
    // print_r($output);die();
    $data = array();
    foreach ($output as $result) {
      $uid = $result['userid'];
      $resultuser = $this->db->query("SELECT * FROM `tb_user` WHERE id='$uid'");
      $output = $resultuser->row();
      if (!empty($output->profile_pic)) {
        $string = $output->profile_pic;
        if (preg_match('/[\'^£$%&*()}{@#~?><>,|=_+¬-]/', $string)) {
          // one or more of the 'special characters' found in $string
          // echo "found";
          $pic = $output->profile_pic;
        } else {
          // echo "not found";
          $pic = base_url() . 'uploads/profile_image/' . $output->profile_pic;
        }
      } else {
        // echo "not found";
        $pic = base_url() . 'uploads/profile_image/user.png';
      }
      $cid = $result['comment_id'];
      $crl_count = $this->db->query("SELECT count(*) as crl_count FROM `tb_commentlike` WHERE commentid='$cid'");
      $crloutput = $crl_count->row();
      $data[] =  array(
        'id'        => $result['comment_id'],
        'contestent_id'      => $result['contestent_id'],
        'commented_userid'      => $result['userid'],
        'commented_username'      => $output->name,
        'commented_userprofile'      => $pic,
        'comment'       => $result['comment'],
        'commented_at'       => $result['commented_at'],
        'like' => '',
        'reply' => '',
        // 'total_comment_count'       => '0',
        // 'total_like_count' => '0',
        'total_reply_like_count' => $crloutput->crl_count,
        'replied_comment' => $result['replied_commentid']
      );
    }
    // print_r($data);die();
    return $data;
  }
  public function add_fan()
  {
    $from = $this->input->post('from');
    $to = $this->input->post('to');
    $category = $this->input->post('category');
    $data = array(
      'req_from' => $this->input->post('from'),
      'req_to' => $this->input->post('to'),
      'category' => $this->input->post('category'),
    );
    $query =  $this->db->query("select * from tb_user where id='$from'");
    $queryto =  $this->db->query("select * from tb_user where id='$to'");
    if ($this->db->affected_rows() > 0) {
      // echo "select * from tb_bestie where (req_from='$from' and req_to='$to') or (req_from='$to' and req_to='$from') and category='$category'";die();
      $result_query =  $this->db->query("select * from tb_fans where ((req_from='$from' and req_to='$to') or (req_from='$to' and req_to='$from')) and category='$category'");
      if ($this->db->affected_rows() > 0) {
        return "exist";
      } else {
        $this->db->insert('tb_fans', $data);
        if ($this->db->affected_rows() > 0) {
          $bestie_id = $this->db->insert_id();
          $result_array =  $query->row(); //sender
          $resultarray =  $queryto->row(); //receiver
          $senderdevtoken = $resultarray->device_token;
          $sendermessage = $result_array->name . ' ' . 'added you as ' . $category;
          $senderdevicetype = $resultarray->device_type;
          $data = array(
            'sender_id' => $this->input->post('from'),
            'receiver_id' => $this->input->post('to'),
            'message' => $result_array->name . ' ' . 'added you as ' . $category,
            'notification_status' => 'Add_Fan',
            'request_id' => $bestie_id
          );
          $this->db->insert('tb_notification', $data);
          $this->push($senderdevtoken, $sendermessage, $senderdevicetype);
          $receiverdevtoken = $result_array->device_token;
          $receivermessage = 'You have added ' . $resultarray->name . ' to your ' . $category . ' list';
          $receiverdevicetype = $result_array->device_type;
          $data = array(
            'sender_id' => $this->input->post('to'),
            'receiver_id' => $this->input->post('from'),
            'message' =>  'You have added ' . $resultarray->name . ' to your ' . $category . ' list',
            'notification_status' => 'Add_Fan',
            'request_id' => $bestie_id
          );
          $this->db->insert('tb_notification', $data);
          $this->push($receiverdevtoken, $receivermessage, $receiverdevicetype);
          return "success";
        } else {
          return "fail";
        }
      }
    }
  }
  public function list_fan($id)
  {
    // echo $id;
    $query = $this->db->query("SELECT * FROM `tb_fans` WHERE (req_from='$id' or req_to='$id') and category='fan'");
    // echo "SELECT * FROM `tb_bestie` WHERE req_from='$id' or req_to='$id' ";
    $result_array =  $query->result_array();
    // print_r( $result_array);die();
    $data = array();
    foreach ($result_array as $results) {
      // print_r($results['req_from']);die();
      if ($results['req_from'] == $id) {
        $userid = $results['req_to'];
      } else {
        $userid = $results['req_from'];
      }
      // print_r($userid);die();
      $result_query = $this->db->query("SELECT * FROM `tb_user` WHERE id='$userid'");
      $output =  $result_query->result_array();
      foreach ($output as $result) {
        if (!empty($result['profile_pic'])) {
          $string = $result['profile_pic'];
          if (preg_match('/[\'^£$%&*()}{@#~?><>,|=_+¬-]/', $string)) {
            // one or more of the 'special characters' found in $string
            // echo "found";
            $pic = $result['profile_pic'];
          } else {
            // echo "not found";
            $pic = base_url() . 'uploads/profile_image/' . $result['profile_pic'];
          }
        } else {
          // echo "not found";
          $pic = base_url() . 'uploads/profile_image/user.png';
        }
        $data[] =  array(
          'tableid'        => $results['fan_id'],
          'userid'        => $result['id'],
          'name'      => $result['name'],
          'email'       => $result['email'],
          'university_name' => $result['university_name'],
          'profile_pic'      => $pic,
          'category' => $results['category'],
          'likes' => ' ',
          'comments' => ' ',
        );
      }
    }

    return $data;
  }
  public function list_fanof($id)
  {
    // echo $id;
    $query = $this->db->query("SELECT * FROM `tb_fans` WHERE (req_from='$id' or req_to='$id') and category='fan_of'");
    // echo "SELECT * FROM `tb_bestie` WHERE req_from='$id' or req_to='$id' ";
    $result_array =  $query->result_array();
    // print_r( $result_array);die();
    $data = array();
    foreach ($result_array as $results) {
      // print_r($results['req_from']);die();
      if ($results['req_from'] == $id) {
        $userid = $results['req_to'];
      } else {
        $userid = $results['req_from'];
      }
      // print_r($userid);die();
      $result_query = $this->db->query("SELECT * FROM `tb_user` WHERE id='$userid'");
      $output =  $result_query->result_array();
      foreach ($output as $result) {
        if (!empty($result['profile_pic'])) {
          $string = $result['profile_pic'];
          if (preg_match('/[\'^£$%&*()}{@#~?><>,|=_+¬-]/', $string)) {
            // one or more of the 'special characters' found in $string
            // echo "found";
            $pic = $result['profile_pic'];
          } else {
            // echo "not found";
            $pic = base_url() . 'uploads/profile_image/' . $result['profile_pic'];
          }
        } else {
          // echo "not found";
          $pic = base_url() . 'uploads/profile_image/user.png';
        }
        $data[] =  array(
          'tableid'        => $results['fan_id'],
          'userid'        => $result['id'],
          'name'      => $result['name'],
          'email'       => $result['email'],
          'university_name' => $result['university_name'],
          'profile_pic'      => $pic,
          'category' => $results['category'],
          'likes' => ' ',
          'comments' => ' ',
        );
      }
    }

    return $data;
  }
  public function RemoveFans()
  {
    $fanid = $this->input->post('fanid');
    $check = $this->db->query("delete from tb_fans WHERE fan_id='$fanid'");
    if ($this->db->affected_rows() > 0) {
      return "success";
    } else {
      return "fail";
    }
  }
  public function get_categorycount()
  {
    date_default_timezone_set('Asia/Kolkata');
    $current_date    = date('Y-m-d H:i:s');
    $userid = $this->input->post('userid');
    $query =  $this->db->query("select * from tb_user where id='$userid'");
    $result_query = $query->row();
    $squad = $this->db->query("select count(*) as squad_count from tb_bestie where (req_from='$userid' or req_to='$userid') and category='squad'");
    $result_squad = $squad->row();
    $bestie = $this->db->query("select count(*) as bestie_count from tb_bestie where (req_from='$userid' or req_to='$userid') and category='bestie'");
    $result_bestie = $bestie->row();
    $fan = $this->db->query("select count(*) as fan_count from tb_fans where (req_from='$userid' or req_to='$userid') and category='fan'");
    $result_fan = $fan->row();
    $fanof = $this->db->query("select count(*) as fanof_count from tb_fans where (req_from='$userid' or req_to='$userid') and category='fan_of'");
    $result_fanof = $fanof->row();
    $matchquery =  $this->db->query("select count(*) as endmatch_count from tb_match where (rival_id='$userid' or opponent_id='$userid') and match_end<='$current_date'");
    $result_matchquery = $matchquery->row();
    if (!empty($result_query->profile_pic)) {
      $string = $result_query->profile_pic;
      if (preg_match('/[\'^£$%&*()}{@#~?><>,|=_+¬-]/', $string)) {
        // one or more of the 'special characters' found in $string
        // echo "found";
        $pic = $result_query->profile_pic;
      } else {
        // echo "not found";
        $pic = base_url() . 'uploads/profile_image/' . $result_query->profile_pic;
      }
    } else {
      // echo "not found";
      $pic = base_url() . 'uploads/profile_image/user.png';
    }
    $data[] =  array(
      'userid' => $result_query->id,
      'username' => $result_query->name,
      'user_profilepic' => $pic,
      'squad_count' => $result_squad->squad_count,
      'bestie_count' => $result_bestie->bestie_count,
      'fans_count' => $result_fan->fan_count,
      'fans_of_count' => $result_fanof->fanof_count,
      'match_count' => $result_matchquery->endmatch_count,
    );
    return $data;
  }
  public function getHeadline()
  {
    date_default_timezone_set('Asia/Kolkata');
    $current_date    = date('Y-m-d H:i:s');
    $userid = $this->input->post('userid');
    $dateStr = date('Y-m-d H:i:s', strtotime('last saturday')); //last sat date
    // $startdate = date($dateStr, strtotime('-7 days'));
    $startdate = date('Y-m-d H:i:s', strtotime('-7 days', strtotime($dateStr)));
    // echo $dateStr;
    // echo $startdate;die();
    $data = array();
    /*start of first headline */

    // echo "select * from tb_match WHERE (rival_id='$userid' or opponent_id='$userid') and invitation_status='accept' and `match_end` BETWEEN '$startdate' AND '$current_date'";die();
    $resultopen = $this->db->query("select * from tb_match WHERE (rival_id='$userid' or opponent_id='$userid') and invitation_status='accept' and `match_end` BETWEEN '$startdate' AND '$current_date'");
    if ($this->db->affected_rows() > 0) {
      $result_array = $resultopen->result_array();
      // print_r($result_array);die();
      foreach ($result_array as $result) {
        $matchid = $result['matchid'];
        $rivalid = $result['rival_id']; //rival
        $oppoid = $result['opponent_id']; //opponent
        $likequery = $this->db->query("select count(*) as sender_like from tb_like WHERE contestent_id='$rivalid' and matchid='$matchid'");
        $likeoutput = $likequery->row();
        $sender_like = $likeoutput->sender_like;
        $likeoppquery = $this->db->query("select count(*) as receiver_like from tb_like WHERE contestent_id='$oppoid' and matchid='$matchid'");
        $likeoppoutput = $likeoppquery->row();
        $receiver_like = $likeoppoutput->receiver_like;
        if ($sender_like > $receiver_like) {
          // echo "sender won";
          $winnerid = $rivalid;
          $likes = $sender_like;
        } else {
          // echo "receiver won";
          $winnerid = $oppoid;
          $likes = $receiver_like;
        }
        if ($likes != 0) {
          $datawinner[] = array(
            'matchid' => $matchid,
            'winner' => $winnerid,
            'like' => $likes,
          );
        }
      }
      // print_r($datawinner);die();
      uasort($datawinner, function ($item, $compare) {
        return $item['like'] <= $compare['like'];
      });
      foreach ($datawinner as $result) {
        $winnerid = $result['winner'];
        $querywinner = $this->db->query("select * from tb_user WHERE id='$winnerid'");
        $outputwinner = $querywinner->row();

        if (!empty($outputwinner->profile_pic)) {
          $string = $outputwinner->profile_pic;
          if (preg_match('/[\'^£$%&*()}{@#~?><>,|=_+¬-]/', $string)) {
            // one or more of the 'special characters' found in $string
            // echo "found";
            $pic = $outputwinner->profile_pic;
          } else {
            // echo "not found";
            $pic = base_url() . 'uploads/profile_image/' . $outputwinner->profile_pic;
          }
        } else {
          // echo "not found";
          $pic = base_url() . 'uploads/profile_image/user.png';
        }
        $userdata[] =  array(
          // 'matchid' => $result['matchid'],
          'userid'        => $result['winner'],
          'name'      => $outputwinner->name,
          'email'       => $outputwinner->email,
          'university_name' => $outputwinner->university_name,
          'profile_pic'      => $pic,
          'category'       => " ",
          'likes' => $result['like'],
          'comments' => ' ',
        );
      }
      $finaldata = $userdata;
      $data['first_headline'] = array_slice($finaldata, 0, 1);
    } else {
      $data['first_headline'] =  array(
        // 'matchid' =>'',
        'userid'        => '',
        'name'      => '',
        'email'       => '',
        'university_name' => '',
        'profile_pic'      => '',
        'category'       => " ",
        'likes' => '',
        'comments' => ' ',
      );
    }
    /*end of first headline */
    /*Start of Second headline */
    $resultpersonal = $this->db->query("select * from tb_match WHERE rival_id='$userid' and invitation_status='accept' and `match_end` BETWEEN '$startdate' AND '$current_date'");
    // echo"select * from tb_match WHERE rival_id='$userid' and invitation_status='accept' and `match_end` BETWEEN '$startdate' AND '$current_date'";die();
    if ($this->db->affected_rows() > 0) {
      $result_arraypersonal = $resultpersonal->result_array();
      // print_r($result_arraypersonal );die();
      $i = 0;
      foreach ($result_arraypersonal as $result) {
        $matchid = $result['matchid'];
        $rivalid = $result['rival_id']; //rival
        $oppoid = $result['opponent_id']; //opponent
        $likequery = $this->db->query("select count(*) as sender_like from tb_like WHERE contestent_id='$rivalid' and matchid='$matchid'");
        $likeoutput = $likequery->row();
        $sender_like = $likeoutput->sender_like;
        $likeoppquery = $this->db->query("select count(*) as receiver_like from tb_like WHERE contestent_id='$oppoid' and matchid='$matchid'");
        $likeoppoutput = $likeoppquery->row();
        $receiver_like = $likeoppoutput->receiver_like;
        $receiver_like = $likeoppoutput->receiver_like;
        if ($sender_like > $receiver_like) {
          // echo "sender won";
          $winnerid = $rivalid;
          $likes = $sender_like;
        } else {
          // echo "receiver won";
          $winnerid = $oppoid;
          $likes = $receiver_like;
        }
        if ($likes != 0) {
          $personalwinner[] = array(
            'index' => $i,
            'matchid' => $matchid,
            'winner' => $winnerid,
            'like' => $likes,
          );
          $i++;
        }
      }
      // print_r($personalwinner);die();
      uasort($personalwinner, function ($item, $compare) {
        return $item['like'] <= $compare['like'];
      });
      foreach ($personalwinner as $result) {
        $winner_id = $result['winner'];
        $querysecondwinner = $this->db->query("select * from tb_user WHERE id='$winner_id'");
        $outputsecondwinner =  $querysecondwinner->row();

        if (!empty($outputsecondwinner->profile_pic)) {
          $string = $outputsecondwinner->profile_pic;
          if (preg_match('/[\'^£$%&*()}{@#~?><>,|=_+¬-]/', $string)) {
            // one or more of the 'special characters' found in $string
            // echo "found";
            $pic = $outputsecondwinner->profile_pic;
          } else {
            // echo "not found";
            $pic = base_url() . 'uploads/profile_image/' . $outputsecondwinner->profile_pic;
          }
        } else {
          // echo "not found";
          $pic = base_url() . 'uploads/profile_image/user.png';
        }
        $userseconddata[] =  array(
          'matchid' => $result['matchid'],
          'userid'        => $result['winner'],
          'name'      => $outputsecondwinner->name,
          'email'       => $outputsecondwinner->email,
          'university_name' => $outputsecondwinner->university_name,
          'profile_pic'      => $pic,
          'category'       => " ",
          'likes' => $result['like'],
          'comments' => ' ',
        );
      }
      $finalseconddata = $userseconddata;
      $data['second_headline'] = array_slice($finalseconddata, 0, 1);
    } else {
      $data['second_headline'] =  array(
        'matchid' => '',
        'userid'        => '',
        'name'      => '',
        'email'       => '',
        'university_name' => '',
        'profile_pic'      => '',
        'category'       => " ",
        'likes' => '',
        'comments' => ' ',
      );
    }
    // print_r($data['second_headline']);die();
    /*End of Second headline */
    /*Start of Third headline */
    // echo "select * from tb_match WHERE rival_id='$userid' and invitation_status='accept' and `match_end` BETWEEN '$startdate' AND '$current_date'";die();
    $resultthirdpersonal = $this->db->query("select * from tb_match WHERE rival_id='$userid' and invitation_status='accept' and `match_end` BETWEEN '$startdate' AND '$current_date'");
    if ($this->db->affected_rows() > 0) {
      $result_arraythird = $resultthirdpersonal->result_array();
      foreach ($result_arraythird as $result) {
        $matchid = $result['matchid'];
        $rivalid = $result['rival_id']; //rival
        $oppoid = $result['opponent_id']; //opponent
        $commentquery = $this->db->query("select count(*) as sender_count from tb_comment WHERE contestent_id='$rivalid' and match_id='$matchid'");
        $commentoutput = $commentquery->row();
        $sender_comment = $commentoutput->sender_count;
        $commentoppquery = $this->db->query("select count(*) as receiver_count from tb_comment WHERE contestent_id='$oppoid' and match_id='$matchid'");
        $commentoppoutput = $commentoppquery->row();
        $receiver_comment = $commentoppoutput->receiver_count;
        if ($sender_comment > $receiver_comment) {
          // echo "sender won";
          $winnerid = $rivalid;
          $comment = $sender_comment;
        } else {
          // echo "receiver won";
          $winnerid = $oppoid;
          $comment = $receiver_comment;
        }
        if ($comment != 0) {
          $thirdwinner[] = array(
            'matchid' => $matchid,
            'winner' => $winnerid,
            'comment' => $comment,
          );
        }
      }
      // print_r($thirdwinner);die();
      uasort($thirdwinner, function ($item, $compare) {
        return $item['comment'] <= $compare['comment'];
      });
      foreach ($thirdwinner as $result) {
        $w_id = $result['winner'];
        $querythirdwinner = $this->db->query("select * from tb_user WHERE id='$w_id'");
        $outputthirdwinner =  $querythirdwinner->row();

        if (!empty($outputthirdwinner->profile_pic)) {
          $string = $outputthirdwinner->profile_pic;
          if (preg_match('/[\'^£$%&*()}{@#~?><>,|=_+¬-]/', $string)) {
            // one or more of the 'special characters' found in $string
            // echo "found";
            $pic = $outputthirdwinner->profile_pic;
          } else {
            // echo "not found";
            $pic = base_url() . 'uploads/profile_image/' . $outputthirdwinner->profile_pic;
          }
        } else {
          // echo "not found";
          $pic = base_url() . 'uploads/profile_image/user.png';
        }
        $userthirddata[] =  array(
          'matchid' => $result['matchid'],
          'userid'        => $result['winner'],
          'name'      => $outputthirdwinner->name,
          'email'       => $outputthirdwinner->email,
          'university_name' => $outputthirdwinner->university_name,
          'profile_pic'      => $pic,
          'category'       => " ",
          'likes' => ' ',
          'comments' => $result['comment'],
        );
      }
      $finalthirddata = $userthirddata;
      $data['Third_headline'] = array_slice($finalthirddata, 0, 1);
      // print_r($data['Third_headline']);die();
    } else {
      $data['Third_headline'] =  array(
        'matchid' => '',
        'userid'        => '',
        'name'      => '',
        'email'       => '',
        'university_name' => '',
        'profile_pic'      => '',
        'category'       => " ",
        'likes' => '',
        'comments' => '',
      );
    }
    /*End of Third headline */
    /*Start of Fourth headline */
    $iquery = $this->db->query("select * from tb_MyiQuery");
    if ($this->db->affected_rows() > 0) {
      $iqueryresult = $iquery->result_array();
      foreach ($iqueryresult as $result) {
        $id = $result['queryid'];
        $like1iquery = $this->db->query("select count(*) as total1like from tb_myiquerylike where like_status='like' and iquerylike_id='$id' AND `querynum` LIKE 'query1'");
        $iquery1likeresult = $like1iquery->row();
        $like2iquery = $this->db->query("select count(*) as total2like from tb_myiquerylike where like_status='like' and iquerylike_id='$id' AND `querynum` LIKE 'query2'");
        $iquery2ikeresult = $like2iquery->row();
        $total_like = $iquery1likeresult->total1like + $iquery2ikeresult->total2like;
        $ilike[] =  array(
          'userid' => $id,
          'total_like'        => $total_like
        );
      }
      $ilikecount = 0;
      foreach ($ilike as $test) {
        // echo $test['matchid'];die();
        if ($ilikecount == 0) {
          $ilikecount = $test['total_like'];
          $uid = $test['userid'];
        } else {
          if ($ilikecount > $test['total_like']) {
            $ilikecount = $ilikecount;
            $uid = $uid;
          } else {
            $ilikecount = $test['total_like'];
            $uid = $test['userid'];
          }
        }
      }
    }
    //  echo $ilikecount.'=like count';echo $userid.'=userid';
    $queryfourthwinner = $this->db->query("select * from tb_user WHERE id='$uid'");
    $outputfourthwinner = $queryfourthwinner->row();

    if (!empty($outputfourthwinner->profile_pic)) {
      $string = $outputfourthwinner->profile_pic;
      if (preg_match('/[\'^£$%&*()}{@#~?><>,|=_+¬-]/', $string)) {
        // one or more of the 'special characters' found in $string
        // echo "found";
        $pic = $outputfourthwinner->profile_pic;
      } else {
        // echo "not found";
        $pic = base_url() . 'uploads/profile_image/' . $outputfourthwinner->profile_pic;
      }
    } else {
      // echo "not found";
      $pic = base_url() . 'uploads/profile_image/user.png';
    }
    $data['Fourth_headline'] =  array(
      'userid'        => $uid,
      'name'      => $outputfourthwinner->name,
      'email'       => $outputfourthwinner->email,
      'university_name' => $outputfourthwinner->university_name,
      'profile_pic'      => $pic,
      'category'       => " ",
      'likes' => $ilikecount,
      'comments' => '',
    );
    // print_r($data['Fourth_headline'] );
    /*End of Fourth headline */
    /*Start of Fifth headline */
    $squadquery = $this->db->query("SELECT * FROM `tb_bestie` WHERE (req_from='$userid' or req_to='$userid') and category='squad'");
    if ($this->db->affected_rows() > 0) {
      $result_squadquery =  $squadquery->result_array();
      //  print_r( $result_array);die();
      foreach ($result_squadquery as $results) {
        // print_r($results['req_from']);die();
        if ($results['req_from'] == $userid) {
          $u_id = $results['req_to'];
        } else {
          $u_id = $results['req_from'];
        }
        // echo $u_id.',';
        $querymostliked = $this->db->query("select count(*) as squadlike from tb_like WHERE user_liked='$u_id' and like_status='like'");
        $result_mostliked = $querymostliked->row();
        $squad[] = array(
          'userid' => $u_id,
          'likedcount' => $result_mostliked->squadlike
        );
      }
      uasort($squad, function ($item, $compare) {
        return $item['likedcount'] <= $compare['likedcount'];
      });
      //  $winnersquad=$squad[0] ;
      $squaduserid = $squad[0]['userid'];
      $squadcount = $squad[0]['likedcount'];
      //  print_r($winnersquad);
      $queryfifthwinner = $this->db->query("select * from tb_user WHERE id='$squaduserid'");
      $outputfifthhwinner = $queryfifthwinner->row();

      if (!empty($outputfifthhwinner->profile_pic)) {
        $string = $outputfifthhwinner->profile_pic;
        if (preg_match('/[\'^£$%&*()}{@#~?><>,|=_+¬-]/', $string)) {
          // one or more of the 'special characters' found in $string
          // echo "found";
          $pic = $outputfifthhwinner->profile_pic;
        } else {
          // echo "not found";
          $pic = base_url() . 'uploads/profile_image/' . $outputfifthhwinner->profile_pic;
        }
      } else {
        // echo "not found";
        $pic = base_url() . 'uploads/profile_image/user.png';
      }
      $data['Fifth_headline'] =  array(
        'userid'        => $squaduserid,
        'name'      => $outputfifthhwinner->name,
        'email'       => $outputfifthhwinner->email,
        'university_name' => $outputfifthhwinner->university_name,
        'profile_pic'      => $pic,
        'category'       => " ",
        'likes' => $squadcount,
        'comments' => '',
      );
      // print_r($data['Fifth_headline']);
      // die();
    }
    /*End of Fifth headline */
    /*Start of Sixth headline */
    $data['Sixth_headline'] =  array(
      'userid'        => '',
      'name'      => '',
      'email'       => '',
      'university_name' => '',
      'profile_pic'      => '',
      'category'       => " ",
      'likes' => '',
      'comments' => '',
    );
    /*End of Sixth headline */
    /*Start of Seventh headline */
    // $data['Seventh_headline'] =array(
    //   'userid'        =>'',
    //   'name'      => '',
    //   'email'       => '',
    //   'university_name' => '',
    //   'profile_pic'      =>'',
    //   'category'       => " ",
    //   'likes' =>'',
    //   'comments' => '',
    // );
    /*End of Seventh headline */
    // print_r($data);
    // die();
    return $data;
  } //Headline function end
  public function get_map()
  {
    $lat = $this->input->post('latitude');
    $long = $this->input->post('longitude');
    $geocode = "http://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$long&sensor=false&key=AIzaSyCeCYMDg0kIGcWsKLygXr3NlLXMpksu45w";
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $geocode);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_PROXYPORT, 3128);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
    $response = curl_exec($ch);
    curl_close($ch);
    $output = json_decode($response);
    print_r($output);
    $dataarray = get_object_vars($output);
    if ($dataarray['status'] != 'ZERO_RESULTS' && $dataarray['status'] != 'INVALID_REQUEST') {
      if (isset($dataarray['results'][0]->formatted_address)) {

        $address = $dataarray['results'][0]->formatted_address;
      } else {
        $address = 'Not Found';
      }
    } else {
      $address = 'Not Found';
    }

    return $address;
    die();
  }
  public function bestiesaction()
  {
    date_default_timezone_set('Asia/Kolkata');
    $current_date    = date('Y-m-d H:i:s');
    $id = $this->input->post('userid');
    // echo $id;
    $query = $this->db->query("SELECT * FROM `tb_bestie` WHERE (req_from='$id' or req_to='$id') and category='bestie'");
    // echo "SELECT * FROM `tb_bestie` WHERE req_from='$id' or req_to='$id' ";
    $result_array =  $query->result_array();
    //  print_r( $result_array);die();
    $data = array();
    foreach ($result_array as $results) {
      // print_r($results['req_from']);die();
      if ($results['req_from'] == $id) {
        $userid = $results['req_to'];
      } else {
        $userid = $results['req_from'];
      }
      //  echo $userid.' the bestie id'; 
      $result_query = $this->db->query("SELECT * FROM `tb_user` WHERE id='$userid'");
      $output =  $result_query->row();

      if (!empty($output->profile_pic)) {
        $string = $output->profile_pic;
        if (preg_match('/[\'^£$%&*()}{@#~?><>,|=_+¬-]/', $string)) {
          // one or more of the 'special characters' found in $string
          // echo "found";
          $pic = $output->profile_pic;
        } else {
          // echo "not found";
          $pic = base_url() . 'uploads/profile_image/' . $output->profile_pic;
        }
      } else {
        // echo "not found";
        $pic = base_url() . 'uploads/profile_image/user.png';
      }
      //  echo "select * from tb_match WHERE (rival_id='$userid' or opponent_id='$userid') and invitation_status='accept' and '$current_date' between replied_at and match_end";die();
      // $result = $this->db->query("select *,time(replied_at) as start_time from tb_match WHERE (rival_id='$userid' or opponent_id='$userid') and invitation_status='accept' and '$current_date' between replied_at and match_end");
      // $result = $this->db->query("select *,time(replied_at) as start_time from tb_match WHERE (rival_id='$userid' or opponent_id='$userid') and invitation_status='accept' and '$current_date' between replied_at and match_end");
      $result = $this->db->query("select *,time(replied_at) as start_time from tb_match  WHERE rival_id='$userid' and opponent_id='$id' and invitation_status='accept' ");
      if ($this->db->affected_rows() > 0) {
        $result_array = $result->result_array();
        foreach ($result_array as $result) {
          $current_time = date('H:i:s');
          $stime = $result['start_time'];
          $start_date = new DateTime($stime);
          $since_start = $start_date->diff(new DateTime($current_time));
          // echo $since_start->days.' days total<br>';
          // echo $since_start->y.' years<br>';
          // echo $since_start->m.' months<br>';
          // echo $since_start->d.' days<br>';
          // echo $since_start->h.' hours<br>';
          // echo $since_start->i.' minutes<br>';
          // echo $since_start->s.' seconds<br>';
          $minutes = $since_start->days * 24 * 60;
          $minutes += $since_start->h * 60;
          $minutes += $since_start->i;
          // echo $minutes.' minutes';
          $mins = $minutes;
          // die();
          $data[] =  array(
            // 'match_id'        => $result['matchid'],
            // 'userid'=>$userid,
            'username' => $output->name,
            'userprofile' => $pic,
            'sender_image' => base_url() . 'assets/images/splash.jpg',
            'receiver_image' => base_url() . 'assets/images/splash.jpg',
            'time' => $mins
          );
        }
      }
    }
    //  print_r($data);die();
    return $data;
  }
  public function getAdminMessage()
  {
    $id = $this->input->post('userid');
    $result_query = $this->db->query("SELECT * FROM `tb_adminmessage`");
    $output = $result_query->row();
    // print_r($output);die();
    $questionid = $output->id;
    $data = array();
    $data['adminmessage'] =  array(
      'id' => $output->id,
      'message1'        => $output->message1,
      'message2'      => $output->message2
    );
    $result = $this->db->query("SELECT * FROM `tb_useranswer` where userid='$id'");
    $output_result = $result->row();
    if ($result->num_rows() > 0) {
      $data['answers'] =  array(
        'answer_id' => $output_result->ansid,
        'answer1'        => $output_result->answer1,
        'answer2'      => $output_result->answer2
      );
    } else {
      $data['answers'] =  array();
    }
    $resultiquery = $this->db->query("SELECT * FROM `tb_MyiQuery` WHERE `user_id` = '$id'");
    if ($resultiquery->num_rows() > 0) {
      $output_query = $resultiquery->result_array();
      // print_r($output);die();
      foreach ($output_query as $result) {
        $queryid = $result['queryid'];
        $q1like = $this->db->query("SELECT count(*) as q1like  FROM `tb_myiquerylike` WHERE `myqueryid` = $queryid AND `querynum` LIKE 'query1' AND `like_status` LIKE 'like'");
        $output_q1like = $q1like->row();
        $q2like = $this->db->query("SELECT count(*) as q2like  FROM `tb_myiquerylike` WHERE `myqueryid` = $queryid AND `querynum` LIKE 'query2' AND `like_status` LIKE 'like'");
        $output_q2like = $q2like->row();
        $c1like = $this->db->query("SELECT count(*) as c1like FROM `tb_myiquerycomment` WHERE `queryid` = $queryid AND `querynum` LIKE 'query1'");
        $output_c1like = $c1like->row();
        $c2like = $this->db->query("SELECT count(*) as c2like FROM `tb_myiquerycomment` WHERE `queryid` = $queryid AND `querynum` LIKE 'query2'");
        $output_c2like = $c2like->row();
        $query[] =  array(
          'queryid'        => $result['queryid'],
          'query1'      => $result['query1'],
          'query2'      => $result['query2'],
          'total_likecount_query1' => $output_q1like->q1like,
          'total_likecount_query2' => $output_q2like->q2like,
          'total_commentcount_query1' => $output_c1like->c1like,
          'total_commentcount_query2' => $output_c2like->c2like,
        );
      }
    } else {
      $query = [];
    }
    // print_r($query);die();

    $data['MyiQuery'] = $query;
    $resultlike = $this->db->query("SELECT * FROM `tb_answerlike` where user_liked='$id' and `IsActive`='0'");
    if ($resultlike->num_rows() > 0) {
      $output_resultlike = $resultlike->result_array();
      // print_r($output_resultlike);die();
      foreach ($output_resultlike as $result) {
        $like[] =  array(
          'id'        => $result['id'],
          'answer'      => $result['answerid'],
          'status'      => $result['like_status']
        );
      }
    } else {
      $like = [];
    }
    // print_r($like);die();
    $data['Like'] = $like;
    $resultcomment = $this->db->query("SELECT count(*) as total_comment  FROM `tb_useranswer` WHERE `questionid` LIKE '$questionid'");
    $output_resultcomment = $resultcomment->row();
    $resultans1like = $this->db->query("SELECT count(*) as ans1_like  FROM `tb_answerlike` WHERE `questionid` = $questionid AND `answerid` LIKE 'answer1'");
    $output_resultans1like = $resultans1like->row();
    $resultans2like = $this->db->query("SELECT count(*) as ans2_like  FROM `tb_answerlike` WHERE `questionid` = $questionid AND `answerid` LIKE 'answer2'");
    $output_resultans2like = $resultans2like->row();
    $data['Count'] = array(
      'total_comment'      => $output_resultcomment->total_comment,
      'total_ans1like'      => $output_resultans1like->ans1_like,
      'total_ans2like'      => $output_resultans2like->ans2_like,
    );
    // print_r($data);die();

    return $data;
  }
  public function getMessageAnswer() //to insert answers for the admin messages
  {
    $userid = $this->input->post('userid');
    $answer1 = $this->input->post('answer1');
    $answer2 = $this->input->post('answer2');
    $questionnum = $this->input->post('questionnum');
    $query =  $this->db->query("select * from tb_useranswer where questionid='$questionnum' and userid='$userid'");
    if ($this->db->affected_rows() > 0) {
      // $data =  array(
      //   'userid' => $userid,
      //   'questionid' => $questionnum,
      //   'answer1'        => $answer1,
      //   'answer2'      => $answer2,
      // );
      // $this->db->where('questionid', $questionnum);
      // $this->db->update('tb_useranswer', $data);
      // if ($this->db->affected_rows() > 0) {
      //   return "success";
      // } else {
      return "fail";
      // }
    } else {
      $data =  array(
        'userid' => $userid,
        'questionid' => $questionnum,
        'answer1'        => $answer1,
        'answer2'      => $answer2,
      );
      $this->db->insert('tb_useranswer', $data);
      if ($this->db->affected_rows() > 0) {
        return "success";
      } else {
        return "fail";
      }
    }
  }
  public function commentlike()
  {
    $uid = $this->input->post('userid');
    $questionid = $this->input->post('questionid');
    $aid = $this->input->post('answerid');
    $status = $this->input->post('status');
    // echo "SELECT * FROM `tb_useranswer` WHERE `$aid` IS NOT NULL and userid='$uid'";die();
    $result = $this->db->query("select * from tb_adminmessage WHERE id='$questionid'");
    if ($this->db->affected_rows() > 0) {
      $result = $this->db->query("SELECT * FROM `tb_useranswer` WHERE `$aid` IS NOT NULL and userid='$uid'");
      if ($this->db->affected_rows() > 0) {
        //answer is existing

        $result = $this->db->query("select * from tb_answerlike WHERE user_liked='$uid' and questionid='$questionid' and answerid='$aid'");
        if ($this->db->affected_rows() > 0) {
          // echo "yes exist";die();
          $result = $this->db->query("select * from tb_answerlike WHERE user_liked='$uid' and questionid='$questionid' and answerid='$aid' and like_status='dislike'");
          if ($this->db->affected_rows() > 0) {
            // echo "yes dislike";die();
            $check = $this->db->query("update tb_answerlike set like_status='like' WHERE user_liked='$uid' and questionid='$questionid' and answerid='$aid'");
            if ($this->db->affected_rows() > 0) {
              return "success";
            } else {
              return "fail";
            }
          }
          $result = $this->db->query("select * from tb_answerlike WHERE user_liked='$uid' and questionid='$questionid' and answerid='$aid' and like_status='like'");
          if ($this->db->affected_rows() > 0) {
            // echo "yes like";die();
            $check = $this->db->query("update tb_answerlike set like_status='dislike' WHERE user_liked='$uid' and questionid='$questionid' and answerid='$aid'");
            if ($this->db->affected_rows() > 0) {
              return "successful";
            } else {
              return "fail";
            }
          }
        } else {
          $data = array(
            'user_liked' => $this->input->post('userid'),
            'questionid' => $this->input->post('questionid'),
            'answerid' => $this->input->post('answerid'),
            'like_status' => $this->input->post('status')
          );
          $this->db->insert('tb_answerlike', $data);
          if ($this->db->affected_rows() > 0) {
            return "success";
          } else {
            return "fail";
          }
        }
      } else {
        //answer not existing
        return "answernotexist";
      }
    } else {
      return "notexist";
    }
  }
  public function MyiQuery()
  {
    $queryid = $this->input->post('queryid');
    if (!empty($queryid)) {
      $data = array(
        // 'user_id' => $this->input->post('userid'),
        'query1' => $this->input->post('query1'),
        'query2' => $this->input->post('query2')
      );
      $this->db->where('queryid', $queryid);
      $this->db->update('tb_MyiQuery', $data);
      if ($this->db->affected_rows() > 0) {
        return "successupdate";
      } else {
        return "fail";
      }
    } else {
      $data = array(
        'user_id' => $this->input->post('userid'),
        'query1' => $this->input->post('query1'),
        'query2' => $this->input->post('query2')
      );
      $this->db->insert('tb_MyiQuery', $data);
      if ($this->db->affected_rows() > 0) {
        return "success";
      } else {
        return "fail";
      }
    }
  }
  public function GetMyiQuery()
  {
    $userid = $this->input->post('userid');
    $result_query = $this->db->query("SELECT * FROM `tb_MyiQuery` WHERE `user_id` = '$userid'");
    $output = $result_query->result_array();
    // print_r($output);die();
    $data = array();
    foreach ($output as $result) {
      $data[] =  array(
        'queryid'        => $result['queryid'],
        'query1'      => $result['query1'],
        'query2'      => $result['query2']
      );
    }
    // print_r($data);die();
    return $data;
  }
  public function commentanswer()
  {
    $data = array(
      'userid' => $this->input->post('userid'),
      'comment' => $this->input->post('comment'),
      'userstatus' => 'self'
    );
    $this->db->insert('tb_usercomments', $data);
    if ($this->db->affected_rows() > 0) {
      return "success";
    } else {
      return "fail";
    }
  }
  public function RemoveiQuery()
  {
    $queryid = $this->input->post('queryid');
    $check = $this->db->query("delete from tb_MyiQuery WHERE queryid='$queryid'");
    if ($this->db->affected_rows() > 0) {
      return "success";
    } else {
      return "fail";
    }
  }
  public function Myiquerylike()
  {
    $uid = $this->input->post('userid');
    $queryid = $this->input->post('queryid');
    $qid = $this->input->post('querynum');
    $result = $this->db->query("select * from tb_MyiQuery WHERE queryid='$queryid'");
    if ($this->db->affected_rows() > 0) {
      $result = $this->db->query("SELECT * FROM `tb_MyiQuery` WHERE `$qid` IS NOT NULL and `user_id`='$uid' and queryid='$queryid'");
      if ($this->db->affected_rows() > 0) {
        $result = $this->db->query("SELECT * FROM `tb_myiquerylike` WHERE user_liked='$uid' and querynum='$qid' and myqueryid='$queryid'");
        if ($this->db->affected_rows() > 0) {
          //already existing in db
          $result = $this->db->query("select * from tb_myiquerylike WHERE user_liked='$uid' and querynum='$qid' and like_status='like' and myqueryid='$queryid'");
          if ($this->db->affected_rows() > 0) {
            $check = $this->db->query("update tb_myiquerylike set like_status='dislike' WHERE user_liked='$uid' and querynum='$qid' and myqueryid='$queryid'");
            if ($this->db->affected_rows() > 0) {
              return "successful";
            } else {
              return "fail";
            }
          }
          $result = $this->db->query("select * from tb_myiquerylike WHERE user_liked='$uid' and querynum='$qid' and like_status='dislike' and myqueryid='$queryid'");
          if ($this->db->affected_rows() > 0) {
            $check = $this->db->query("update tb_myiquerylike set like_status='like' WHERE user_liked='$uid' and querynum='$qid' and myqueryid='$queryid'");
            if ($this->db->affected_rows() > 0) {
              return "success";
            } else {
              return "fail";
            }
          }
        } else {
          //insert into db
          $data = array(
            'user_liked' => $this->input->post('userid'),
            'myqueryid' => $this->input->post('queryid'),
            'querynum' => $this->input->post('querynum'),
            'like_status' => $this->input->post('status')
          );
          $this->db->insert('tb_myiquerylike', $data);
          if ($this->db->affected_rows() > 0) {
            return "success";
          } else {
            return "fail";
          }
        }
      } else {
        return "querynotexist";
      }
    } else {
      return "querynotexist";
    }
  }
  public function myiquerycomment()
  {
    $queryid = $this->input->post('queryid');
    $result = $this->db->query("select * from tb_MyiQuery WHERE queryid='$queryid'");
    if ($this->db->affected_rows() > 0) {
      $data = array(
        'user_commented' => $this->input->post('userid'),
        'queryid' => $this->input->post('queryid'),
        'querynum' => $this->input->post('querynum'),
        'comment' => $this->input->post('comment'),
        'userstatus' => 'vistor'
      );
      $this->db->insert('tb_myiquerycomment', $data);
      if ($this->db->affected_rows() > 0) {
        return "success";
      } else {
        return "fail";
      }
    } else {
      return "notexist";
    }
  }
  public function GetMyiQueryComment()
  {
    $queryid = $this->input->post('queryid');
    $result_1query = $this->db->query("SELECT * FROM `tb_myiquerycomment` WHERE `queryid` = $queryid AND `querynum` LIKE 'query1'");
    if ($result_1query->num_rows() > 0) {
      $output1 = $result_1query->result_array();
      // print_r($output1);die();
      $data = array();
      foreach ($output1 as $result) {
        $userid = $result['user_commented'];
        $resultuser = $this->db->query("SELECT * FROM `tb_user` WHERE id='$userid'");
        $output = $resultuser->row();

        if (!empty($output->profile_pic)) {
          $string = $output->profile_pic;
          if (preg_match('/[\'^£$%&*()}{@#~?><>,|=_+¬-]/', $string)) {
            // one or more of the 'special characters' found in $string
            // echo "found";
            $pic = $output->profile_pic;
          } else {
            // echo "not found";
            $pic = base_url() . 'uploads/profile_image/' . $output->profile_pic;
          }
        } else {
          // echo "not found";
          $pic = base_url() . 'uploads/profile_image/user.png';
        }
        $q1[] =  array(
          'id'        => $result['querycomment_id'],
          'comment'      => $result['comment'],
          'commented_userid'      => $result['user_commented'],
          'commented_username' => $output->name,
          'commented_userprofile' => $pic,
          'commented_at' => $result['updated_at'],
          'like' => "",
          'reply' => ""
        );
      }

      $data['query1'] = $q1;
    } else {
      $q1 = array();
      $data['query1'] = $q1;
    }
    $result_2query = $this->db->query("SELECT * FROM `tb_myiquerycomment` WHERE `queryid` = $queryid AND `querynum` LIKE 'query2'");
    if ($result_2query->num_rows() > 0) {
      $output2 = $result_2query->result_array();
      // print_r($output);die();
      foreach ($output2 as $result) {
        $userid = $result['user_commented'];
        $resultuser = $this->db->query("SELECT * FROM `tb_user` WHERE id='$userid'");
        $output = $resultuser->row();
        if (!empty($output->profile_pic)) {
          $string = $output->profile_pic;
          if (preg_match('/[\'^£$%&*()}{@#~?><>,|=_+¬-]/', $string)) {
            // one or more of the 'special characters' found in $string
            // echo "found";
            $pic = $output->profile_pic;
          } else {
            // echo "not found";
            $pic = base_url() . 'uploads/profile_image/' . $output->profile_pic;
          }
        } else {
          // echo "not found";
          $pic = base_url() . 'uploads/profile_image/user.png';
        }
        $q2[] =  array(
          'id'        => $result['querycomment_id'],
          'comment'      => $result['comment'],
          'commented_userid'      => $result['user_commented'],
          'commented_username' => $output->name,
          'commented_userprofile' => $pic,
          'commented_at' => $result['updated_at'],
          'like' => "",
          'reply' => ""
        );
      }
      $data['query2'] = $q2;
    } else {
      $q2 = array();
      $data['query2'] = $q2;
    }
    // print_r($data);die();
    return $data;
  }
  public function sort_array_of_array(&$array, $subfield)
  {
    $sortarray = array();
    foreach ($array as $key => $row) {
      $sortarray[$key] = $row[$subfield];
    }

    array_multisort($sortarray, SORT_ASC, $array);
  }
  public function Top100()
  {
    $uid = $this->input->post('userid');
    $result = $this->db->query("SELECT * FROM `tb_user`");
    $output = $result->result_array();
    // print_r($output);die();
    foreach ($output as $result) {
      $userid = $result['id'];
      $userresult = $this->db->query("SELECT count(*) as total  FROM `tb_fans`where (req_from=$userid or req_to=$userid)");
      $useroutput = $userresult->row();
      if (($useroutput->total) != 0) {
        $data[] = array(
          'count' => $useroutput->total,
          'userid' => $userid
        );
      }
    }
    uasort($data, function ($item, $compare) {
      return $item['count'] <= $compare['count'];
    });

    // print_r($data);//sorted array
    foreach ($data as $result) {
      $uid = $result['userid'];
      $userquery = $this->db->query("SELECT * FROM `tb_user` where id=$uid");
      $userqueryoutput = $userquery->row();

      if (!empty($userqueryoutput->profile_pic)) {
        $string = $userqueryoutput->profile_pic;
        if (preg_match('/[\'^£$%&*()}{@#~?><>,|=_+¬-]/', $string)) {
          // one or more of the 'special characters' found in $string
          // echo "found";
          $pic = $userqueryoutput->profile_pic;
        } else {
          // echo "not found";
          $pic = base_url() . 'uploads/profile_image/' . $userqueryoutput->profile_pic;
        }
      } else {
        // echo "not found";
        $pic = base_url() . 'uploads/profile_image/user.png';
      }
      $userdata[] = array(
        'userid' => $result['userid'],
        'username' => $userqueryoutput->name,
        'profile_pic' => $pic,
        'fan_count' => $result['count']
      );
    }
    $finaldata = $userdata;
    // print_r(array_slice($finaldata, 0, 99));//to get only 100 users
    $top100_array = array_slice($finaldata, 0, 99);
    // print_r($finaldata);
    // die();
    return $top100_array;
  }
  public function BannerSearch()
  {
    $userid = $this->input->post('userid');
    $searchcategory = $this->input->post('category');
    $query = $this->db->query("select * from tb_match WHERE (rival_id='$userid' or opponent_id='$userid') and invitation_status='accept'");
    $result_array =  $query->result_array();
    $data = array();
    foreach ($result_array as $result) {
      $matchid = $result['matchid'];
      $rivalid = $result['rival_id']; //rival
      $oppoid = $result['opponent_id']; //opponent
      // echo"select contestent_id from tb_like WHERE user_liked='$userid' and matchid='$matchid'";die();
      $userlike = $this->db->query("select contestent_id from tb_like WHERE user_liked='$userid' and matchid='$matchid'");
      if ($userlike->num_rows() > 0) {
        $userlikes = $userlike->row();
        // print_r($userlikes);die();
        $contid = $userlikes->contestent_id;
        // echo $contid;die();
        if ($contid == $rivalid) {
          // echo "rival match";
          $userrivallike = '1';
          $useroppolike = '0';
          $usercommonlike = '0';
          $agree = '0';
          $disagree = '0';
        }
        if ($contid == 0) {
          // echo "rival match";
          $userrivallike = '0';
          $useroppolike = '0';
          $usercommonlike = '1';
          $commonquerylike = $this->db->query("select count(*) as common_like from tb_like WHERE contestent_id='0' and matchid='$matchid' and like_status='like'");
          $commonquerylikeoutput = $commonquerylike->row();
          $commonquerydislike = $this->db->query("select count(*) as common_dislike from tb_like WHERE contestent_id='0' and matchid='$matchid' and like_status='dislike'");
          $commonquerydislikeoutput = $commonquerydislike->row();
          $agree = $commonquerylikeoutput->common_like;
          $disagree = $commonquerydislikeoutput->common_dislike;
        }
        if ($contid == $oppoid) {
          // echo "oppo match";
          $userrivallike = '0';
          $useroppolike = '1';
          $usercommonlike = '0';
          $agree = '0';
          $disagree = '0';
        }
      } else {
        $userrivallike = '0';
        $useroppolike = '0';
        $usercommonlike = '0';
        $agree = '0';
        $disagree = '0';
      }
      $likequery = $this->db->query("select count(*) as sender_like from tb_like WHERE contestent_id='$rivalid' and matchid='$matchid'");
      $likeoutput = $likequery->row();
      $sender_like = $likeoutput->sender_like;
      $queryresult = $this->db->query("select * from tb_user WHERE id='$rivalid'");
      $outputresult = $queryresult->row();

      if (!empty($outputresult->profile_pic)) {
        $string = $outputresult->profile_pic;
        if (preg_match('/[\'^£$%&*()}{@#~?><>,|=_+¬-]/', $string)) {
          // one or more of the 'special characters' found in $string
          // echo "found";
          $pic = $outputresult->profile_pic;
        } else {
          // echo "not found";
          $pic = base_url() . 'uploads/profile_image/' . $outputresult->profile_pic;
        }
      } else {
        // echo "not found";
        $pic = base_url() . 'uploads/profile_image/user.png';
      }
      $likeoppquery = $this->db->query("select count(*) as receiver_like from tb_like WHERE contestent_id='$oppoid' and matchid='$matchid'");
      $likeoppoutput = $likeoppquery->row();
      $receiver_like = $likeoppoutput->receiver_like;
      $query = $this->db->query("select * from tb_user WHERE id='$oppoid'");
      $output = $query->row();

      if (!empty($output->profile_pic)) {
        $string = $output->profile_pic;
        if (preg_match('/[\'^£$%&*()}{@#~?><>,|=_+¬-]/', $string)) {
          // one or more of the 'special characters' found in $string
          // echo "found";
          $picture = $output->profile_pic;
        } else {
          // echo "not found";
          $picture = base_url() . 'uploads/profile_image/' . $output->profile_pic;
        }
      } else {
        // echo "not found";
        $pic = base_url() . 'uploads/profile_image/user.png';
      }
      $commentquery = $this->db->query("select count(*) as total_comments from tb_comment WHERE match_id='$matchid' and contestent_id!='0'");
      $commentoutput = $commentquery->row();
      $commoncommentquery = $this->db->query("select count(*) as total_commoncomments from tb_comment WHERE match_id='$matchid' AND `contestent_id` = 0");
      $commoncommentoutput = $commoncommentquery->row();
      $data[] =  array(
        'match_id'        => $result['matchid'],
        'senderid'        => $result['rival_id'],
        'sender_name' => $outputresult->name,
        'sender_profile' => $pic,
        'sender_email' => $outputresult->email,
        'receiverid'      => $result['opponent_id'],
        'receiver_name' => $output->name,
        'receiver_profile' => $picture,
        'receiver_email' => $output->email,
        'description'       => $result['description'],
        'time_duration'        => $result['time_duration'],
        'caption'      => $result['caption'],
        'category'       => $result['category'],
        'match_start' => $result['replied_at'],
        'match_end' => $result['match_end'],
        'match_invitationsend' => $result['created_at'],
        'sender_image' => base_url() . 'assets/images/splash.jpg',
        'receiver_image' => base_url() . 'assets/images/splash.jpg',
        'sender_likecount' => $sender_like,
        'sender_likecount' => $sender_like,
        'receiver_likecount' => $receiver_like,
        'total_likecount' => $sender_like + $receiver_like,
        'userliked_sender' => $userrivallike,
        'userliked_receiver' => $useroppolike,
        'userliked_common' => $usercommonlike,
        'agree_count' => $agree,
        'disagree_count' => $disagree,
        'total_comment' => $commentoutput->total_comments,
        'total_commoncomments' => $commoncommentoutput->total_commoncomments
      );
    }
    $finaldata = $data;
    $data = array_slice($finaldata, 0, 10);
    return $data;
  }
  public function winners_of_the_moment()
  {
    date_default_timezone_set('Asia/Kolkata');
    $current_date    = date('Y-m-d H:i:s');
    $user_id = $this->input->post('userid');
    $result = $this->db->query("select * from tb_match WHERE (rival_id='$user_id' or opponent_id='$user_id') and match_status='1'");
    $result_array = $result->result_array();
    $data = array();
    foreach ($result_array as $result) {
      $uid = $result['rival_id']; //rival 
      // echo $uid;
      $oppouid = $result['opponent_id']; //opponent
      // echo $oppouid;
      $matchid = $result['matchid'];
      $query = $this->db->query("select * from tb_user WHERE id='$uid'");
      $output = $query->row();
      $likequery = $this->db->query("select count(*) as sender_like from tb_like WHERE contestent_id='$uid' and matchid='$matchid'");
      $likeoutput = $likequery->row();
      $sender_like = $likeoutput->sender_like;
      $resultquery = $this->db->query("select * from tb_user WHERE id='$oppouid'");
      $resultoutput = $resultquery->row();
      $likeoppquery = $this->db->query("select count(*) as receiver_like from tb_like WHERE contestent_id='$oppouid' and matchid='$matchid'");
      $likeoppoutput = $likeoppquery->row();
      $receiver_like = $likeoppoutput->receiver_like;
      // echo $sender_like.'sender like';echo $receiver_like.'receiver like';
      // die();
      if ($sender_like > $receiver_like) {
        // echo "sender won";
        $winnerid = $uid;
        $likes = $sender_like;
      } else {
        // echo "receiver won";
        $winnerid = $oppouid;
        $likes = $receiver_like;
      }
      // echo $winnerid.'userid';echo $likes.'like count';die();
      $datawinner[] = array(
        'matchid' => $matchid,
        'winner' => $winnerid,
        'like' => $likes,
      );
      //  print_r($datawinner);
      foreach ($datawinner as $winner) {
        $winneruserid = $winner['winner'];
        // echo $winneruserid;
        $winnerquery = $this->db->query("select * from tb_user WHERE id='$winneruserid'");
        $winnerqueryoutput = $winnerquery->row();

        if (!empty($winnerqueryoutput->profile_pic)) {
          $string = $winnerqueryoutput->profile_pic;
          if (preg_match('/[\'^£$%&*()}{@#~?><>,|=_+¬-]/', $string)) {
            // one or more of the 'special characters' found in $string
            // echo "found";
            $pic = $winnerqueryoutput->profile_pic;
          } else {
            // echo "not found";
            $pic = base_url() . 'uploads/profile_image/' . $winnerqueryoutput->profile_pic;
          }
        } else {
          // echo "not found";
          $pic = base_url() . 'uploads/profile_image/user.png';
        }
        $datafinal[] =  array(
          'match_id'        => $winner['matchid'],
          'winner_name' => $winnerqueryoutput->name,
          'profile_pic' => $pic,
          'winner_email' => $winnerqueryoutput->email,
          'total_likecount' => $winner['like']
        );
      }
      $data = $datafinal;
    }
    // print_r($data);
    $unique = array_map("unserialize", array_unique(array_map("serialize", $data)));
    // print_r($unique);die();
    // print_r(array_unique($data))/;die();
    return $unique;
  }

  /* -------------------crone function start----------------------------*/
  public function matchend_notificationcrone()
  {
    date_default_timezone_set('Asia/Kolkata');
    $current_date    = date('Y-m-d H:i:s');
    // echo $current_date.'current_date <br/>';
    $result = $this->db->query("select * from tb_match WHERE match_status='1'");
    $result_array = $result->result_array();
    foreach ($result_array as $result) {
      $mend = $result['match_end'];
      // echo $mend.'end <br/>';
      if ($mend < $current_date) {
        // echo "match over";
        $matchid = $result['matchid'];
        // echo $matchid;
        $check = $this->db->query("update tb_match set match_status=0 WHERE matchid='$matchid'");
        $results = $this->db->query("select * from tb_match WHERE matchid='$matchid'");
        $output =  $results->row();
        $from = $output->rival_id;
        $to = $output->opponent_id;
        $query =  $this->db->query("select * from tb_user where id='$from'");
        $queryto =  $this->db->query("select * from tb_user where id='$to'");
        $result_array =  $query->row();
        $resultarray =  $queryto->row();
        $senderdevtoken = $result_array->device_token;
        $sendermessage = 'Your Match with ' . $resultarray->name . ' is over';
        $senderdevicetype = $result_array->device_type;
        $data = array(
          'sender_id' => $from,
          'receiver_id' => $to,
          'message' => 'Your Match with ' . $resultarray->name . ' is over',
          'notification_status' => 'match_reply',
          'request_id' => $matchid
        );
        $this->db->insert('tb_notification', $data);
        $this->push($senderdevtoken, $sendermessage, $senderdevicetype);
        $receiverdevtoken = $resultarray->device_token;
        $receivermessage = 'Your Match with ' . $result_array->name . ' is over';
        $receiverdevicetype = $resultarray->device_type;
        $datas = array(
          'sender_id' => $to,
          'receiver_id' => $from,
          'message' => 'Your Match with ' . $result_array->name . ' is over',
          'notification_status' => 'match_reply',
          'request_id' => $matchid
        );
        $this->db->insert('tb_notification', $datas);
        $this->push($receiverdevtoken, $receivermessage, $receiverdevicetype);
      }
      // else{
      //   echo "match ongoing";

      // }
    }
  }
  /* -------------------crone function end----------------------------*/
  public function Recommended_for_you()
  {
    $userid = $this->input->post('userid');
    $result = $this->db->query("select * from tb_user");
    //  print_r($result->num_rows());die();
    $output = $result->result_array();
    // $i=1;
    foreach ($output as $result) {
      $id = $result['id'];
      // echo $id;
      if ($id != $userid) {
        $query = $this->db->query("SELECT * FROM `tb_bestie` WHERE ((req_from='$userid' and req_to='$id') or (req_from='$id' and req_to='$userid'))");
        $secondquery = $this->db->query("SELECT * FROM `tb_fans` WHERE ((req_from='$userid' and req_to='$id') or (req_from='$id' and req_to='$userid'))");
        if (($query->num_rows() == 0) && ($secondquery->num_rows() == 0)) {
          // echo $id; echo "not bestie and fan,";
          $userquery =  $this->db->query("select * from tb_user where id='$id'");
          $userqueryoutput = $userquery->row();

          if (!empty($userqueryoutput->profile_pic)) {
            $string = $userqueryoutput->profile_pic;
            if (preg_match('/[\'^£$%&*()}{@#~?><>,|=_+¬-]/', $string)) {
              // one or more of the 'special characters' found in $string
              // echo "found";
              $pic = $userqueryoutput->profile_pic;
            } else {
              // echo "not found";
              $pic = base_url() . 'uploads/profile_image/' . $userqueryoutput->profile_pic;
            }
          } else {
            // echo "not found";
            $pic = base_url() . 'uploads/profile_image/user.png';
          }
          $userdata[] = array(
            // 'index'=>$i,
            'userid'        => $id,
            'name' => $userqueryoutput->name,
            'profile_pic' => $pic,
            'email' => $userqueryoutput->email
          );
          // $i++;
        }
        //  else 
        //  {
        //   echo "bestie or fan ,";
        // }
      }
    }
    // print_r($userdata);die();
    // print_r(array_chunk($userdata, 4));
    // die();
    $final = array_chunk($userdata, 4);
    return $final;
  }
  public function chat()
  {
    $userid_from = $this->input->post('userid_from');
    $userid_to = $this->input->post('userid_to');
    $message = $this->input->post('message');
    date_default_timezone_set('Asia/Kolkata');
    $current_date    = date('Y-m-d H:i:s');
    $query =  $this->db->query("SELECT *  FROM `tb_userchat` WHERE ((`userid_from` = $userid_from) and (`userid_to` = $userid_to) or (`userid_from` = $userid_to) and (`userid_to` = $userid_from))");
    if ($this->db->affected_rows() > 0) {
      $output = $query->row();
      $chattoken = $output->chattoken;
    } else {
      $chattoken = 'chat' . $userid_from . $userid_to;
    }
    $data = array(
      'userid_from' => $userid_from,
      'userid_to' => $userid_to,
      'message' => $message,
      'chattoken' => $chattoken,
      'created_at' => $current_date
    );
    $this->db->insert('tb_userchat', $data);
    if ($this->db->affected_rows() > 0) {
      return "success";
    } else {
      return "fail";
    }
  }
  public function getchat()
  {
    $userid = $this->input->post('userid');
    $query =  $this->db->query("SELECT *  FROM `tb_userchat` WHERE (`userid_from` = $userid) or (`userid_to` = $userid)  group by chattoken ");
    if ($query->num_rows() > 0) {
      $output = $query->result_array();
      foreach ($output as $result) {
        $userid_from = $result['userid_from'];
        $userid_to = $result['userid_to'];
        if ($userid_from == $userid) {
          $chatuser = $userid_to;
        } else {
          $chatuser = $userid_from;
        }
        $chattoken = $result['chattoken'];
        $chatquery = $this->db->query("SELECT * FROM `tb_userchat` WHERE chattoken='$chattoken' ORDER BY `tb_userchat`.`created_at` DESC");
        $chatoutput = $chatquery->row();
        $userdetails = $this->db->query("SELECT * FROM `tb_user` WHERE id='$chatuser' ");
        $userdetailsoutput = $userdetails->row();

        if (!empty($userdetailsoutput->profile_pic)) {
          $string = $userdetailsoutput->profile_pic;
          if (preg_match('/[\'^£$%&*()}{@#~?><>,|=_+¬-]/', $string)) {
            // one or more of the 'special characters' found in $string
            // echo "found";
            $pic = $userdetailsoutput->profile_pic;
          } else {
            // echo "not found";
            $pic = base_url() . 'uploads/profile_image/' . $userdetailsoutput->profile_pic;
          }
        } else {
          // echo "not found";
          $pic = base_url() . 'uploads/profile_image/user.png';
        }
        if ($userdetailsoutput->online_offline_status == 0) {
          $onoffstatus = "online";
        } else {
          $onoffstatus = "offline";
        }
        $data[] = array(
          'userid' => $userdetailsoutput->id,
          'name' => $userdetailsoutput->name,
          'profile_pic' => $pic,
          'last_message' => $chatoutput->message,
          'send_at' => $chatoutput->created_at,
          'online_offline_status' => $onoffstatus,
          'last_seen' => $userdetailsoutput->last_seen,
        );
      }
    } else {
      $data = array();
    }
    return $data;
  }
  public function getdetailchat()
  {
    $loggeduserid = $this->input->post('loggeduserid');
    $chatuserid = $this->input->post('chatuserid');
    $chatquery = $this->db->query("SELECT * FROM `tb_userchat` WHERE ((`userid_from` = $loggeduserid) and (`userid_to` = $chatuserid) or (`userid_from` = $chatuserid) and (`userid_to` = $loggeduserid))");
    if ($chatquery->num_rows() > 0) {
      $userdetails = $this->db->query("SELECT * FROM `tb_user` WHERE id='$chatuserid' ");
      $userdetailsoutput = $userdetails->row();
      if ($userdetailsoutput->online_offline_status == 0) {
        $onoffstatus = "online";
      } else {
        $onoffstatus = "offline";
      }
      $chatoutput = $chatquery->result_array();
      foreach ($chatoutput as $result) {
        $data[] = array(
          'userid_from' => $result['userid_from'],
          'userid_to' => $result['userid_to'],
          'message' => $result['message'],
          'send_at' => $result['created_at'],
          'online_offline_status' => $onoffstatus,
          'last_seen' => $userdetailsoutput->last_seen,
        );
      }
    } else {
      $data = array();
    }
    return $data;
  }
  public function changechatstatus()
  {
    date_default_timezone_set('Asia/Kolkata');
    $current_date    = date('Y-m-d H:i:s');
    $chatstatus = $this->input->post('status');
    $userid = $this->input->post('userid');
    $check = $this->db->query("update tb_user set online_offline_status='$chatstatus',last_seen='$current_date' WHERE id='$userid'");
    if ($this->db->affected_rows() > 0) {
      return "success";
    } else {
      return "fail";
    }
  }
  public function BestMoment()
  {
    $caption = $this->input->post('Caption');
    $userid = $this->input->post('userid');
    $data = array(
      'caption' => $caption,
      'userid' => $userid
    );
    $this->db->insert('tb_bestmoment', $data);
    if ($this->db->affected_rows() > 0) {
      $moment_id = $this->db->insert_id();
      return $moment_id;
    } else {
      return "fail";
    }
  }
  public function uploadedbestmomentfile($image)
  {
    $momentid = $this->input->post('momentid');
    $data = array(
      'momentid' => $momentid,
      'filename' => $image
    );
    $this->db->insert('tb_bestmomentupload', $data);
    if ($this->db->affected_rows() > 0) {
      return "success";
    } else {
      return "fail";
    }
  }
  public function getBestMoment()
  {
    $userid = $this->input->post('userid');
    $query =  $this->db->query("select * from tb_bestmoment where userid='$userid'");
    if ($this->db->affected_rows() > 0) {
      $result_array =  $query->result_array();
      $data = array();
      foreach ($result_array as $result) {
        $momentid = $result['momentid'];
        $momentquery =  $this->db->query("select *,count(*) as total from tb_bestmomentupload where momentid='$momentid'");
        $result_query =  $momentquery->row();
        if (!empty($result_query->filename)) {
          $file = base_url() . 'uploads/Useruploads/' . $result_query->filename;
        } else {
          $file = base_url() . 'uploads/Useruploads/default.jpg';
        }
        $momentlikequery =  $this->db->query("select count(*) as totallike from tb_momentlike where momentid='$momentid' and like_status='like'");
        $result_likequery =  $momentlikequery->row();
        $momentcommentquery =  $this->db->query("select count(*) as totalcomment from tb_momentcomment where momentid='$momentid'");
        $result_commentquery =  $momentcommentquery->row();
        $data[] =  array(
          'momentid' => $result['momentid'],
          'caption' => $result['caption'],
          'Like_count' => $result_likequery->totallike,
          'comment_count' => $result_commentquery->totalcomment,
          'media_count' => $result_query->total,
          'created_at' => $result['created_at'],
          'file' => $file
        );
      }
      // $data = array_merge($datas, $link);
      return $data;
    }
  }
  public function getBestMomentFile()
  {
    $userid = $this->input->post('userid');
    $query =  $this->db->query("select * from tb_bestmoment where userid='$userid'");
    if ($this->db->affected_rows() > 0) {
      $result_array =  $query->result_array();
      $data = array();
      foreach ($result_array as $result) {
        $momentid = $result['momentid'];
        $momentquery =  $this->db->query("select * from tb_bestmomentupload where momentid='$momentid'");
        if ($this->db->affected_rows() > 0) {
          $momentresult_array =  $momentquery->result_array();
          foreach ($momentresult_array as $outputresult)
            // $link[]
            $data[]  =  array(
              'momentid' => $momentid,
              'file' => base_url() . 'uploads/Useruploads/' . $outputresult['filename']
            );
        } else {
          $data[]  =  array(
            'momentid' => $momentid,
            'file' => base_url() . 'uploads/Useruploads/default.jpg'
          );
        }
      }
      // $data = array_merge($datas, $link);
      return $data;
    }
  }
  public function uploadedchatfile($filename)
  {
    $utid = $this->input->post('userid_to');
    $ufid = $this->input->post('userid_from');
    if ((empty($utid)) || (empty($ufid))) {
      return "empty";
    } else {
      $data = array(
        'userid_to' => $utid,
        'userid_from' => $ufid,
        'filename' => $filename
      );
      $this->db->insert('tb_userchatupload', $data);
      if ($this->db->affected_rows() > 0) {
        return "success";
      } else {
        return "fail";
      }
    }
  }
  public function MomentLike()
  {
    date_default_timezone_set('Asia/Kolkata');
    $current_date    = date('Y-m-d H:i:s');
    $uid = $this->input->post('userid');
    $mid = $this->input->post('momentid');
    $result = $this->db->query("select * from tb_bestmoment WHERE momentid='$mid'");
    if ($this->db->affected_rows() > 0) {
      $result = $this->db->query("select * from tb_momentlike WHERE userid='$uid' and momentid='$mid'");
      if ($this->db->affected_rows() > 0) {
        $checkresult = $this->db->query("select * from tb_momentlike WHERE userid='$uid' and momentid='$mid' and like_status='dislike'");
        if ($this->db->affected_rows() > 0) {
          $check = $this->db->query("update tb_momentlike set like_status='like' WHERE userid='$uid' and momentid='$mid'");
          if ($this->db->affected_rows() > 0) {
            return "success";
          } else {
            return "fail";
          }
        } else {
          $check = $this->db->query("update tb_momentlike set like_status='dislike' WHERE userid='$uid' and momentid='$mid'");
          if ($this->db->affected_rows() > 0) {
            return "successful";
          } else {
            return "fail";
          }
        }
      } else {
        $data = array(
          'userid' => $this->input->post('userid'),
          'momentid' => $this->input->post('momentid'),
          'like_status' => 'like',
          'updated_at' => $current_date
        );
        $this->db->insert('tb_momentlike', $data);
        if ($this->db->affected_rows() > 0) {
          return "success";
        } else {
          return "fail";
        }
      }
    } else {
      return "notexist";
    }
  }
  public function addmomentcomment()
  {
    date_default_timezone_set('Asia/Kolkata');
    $current_date    = date('Y-m-d H:i:s');
    $uid = $this->input->post('userid');
    $mid = $this->input->post('momentid');
    $cid = $this->input->post('comment');
    $result = $this->db->query("select * from tb_bestmoment WHERE momentid='$mid'");
    if ($this->db->affected_rows() > 0) {
      $data = array(
        'userid' => $this->input->post('userid'),
        'momentid' => $this->input->post('momentid'),
        'comment' => $this->input->post('comment'),
        'updated_at' => $current_date
      );
      $this->db->insert('tb_momentcomment', $data);
      if ($this->db->affected_rows() > 0) {
        return "success";
      } else {
        return "fail";
      }
    } else {
      return "notexist";
    }
  }
  public function getmomentcomment()
  {
    $userid = $this->input->post('userid');
    $momentid = $this->input->post('momentid');
    $result_query = $this->db->query("SELECT * FROM `tb_momentcomment` WHERE momentid='$momentid' ");
    $output = $result_query->result_array();
    // print_r($output);die();
    $data = array();
    foreach ($output as $result) {
      $uid = $result['userid'];
      $resultuser = $this->db->query("SELECT * FROM `tb_user` WHERE id='$uid'");
      $output = $resultuser->row();

      if (!empty($output->profile_pic)) {
        $string = $output->profile_pic;
        if (preg_match('/[\'^£$%&*()}{@#~?><>,|=_+¬-]/', $string)) {
          // one or more of the 'special characters' found in $string
          // echo "found";
          $pic = $output->profile_pic;
        } else {
          // echo "not found";
          $pic = base_url() . 'uploads/profile_image/' . $output->profile_pic;
        }
      } else {
        // echo "not found";
        $pic = base_url() . 'uploads/profile_image/user.png';
      }
      $data[] =  array(
        'id'        => $result['mcomment_id'],
        'commented_userid'      => $result['userid'],
        'commented_username'      => $output->name,
        'commented_userprofile'      => $pic,
        'comment'       => $result['comment'],
        'commented_at'       => $result['updated_at'],
        // 'like' => '',
        // 'reply' => ''
      );
    }
    // print_r($data);die();
    return $data;
  }
  public function match_fileupload($imagename)
  {
    date_default_timezone_set('Asia/Kolkata');
    $current_date    = date('Y-m-d H:i:s');
    $mid = $this->input->post('matchid');
    $upid = $this->input->post('upload_id');
    // print_r($this->input->post('userid'));die();
    if (!empty($mid)) {
      //  echo "match not empty" ;die();
      $data = array(
        'matchid' => $this->input->post('matchid'),
        'user_uploaded' => $this->input->post('userid'),
        'filename' => $imagename,
        'filetype' => 'file',
        'created_at' => $current_date
      );
      $result_query =  $this->db->query("select * from tb_match where matchid= $mid");
      if ($this->db->affected_rows() > 0) {
        $this->db->insert('tb_matchupload', $data);
        if ($this->db->affected_rows() > 0) {

          // return "success";
          $imagedata = array(
            'filename' => base_url() . 'uploads/Matchuploads/' . $imagename
          );
          return $imagedata;
        } else {
          return "fail";
        }
      } else {
        return "notexist";
      }
    } else {
      // echo "match empty" ;die();
      //this is the code for which uploading matchfile without matchid
      $result_query =  $this->db->query("select * from tb_matchupload where mup_id= $upid");
      if ($this->db->affected_rows() > 0) {
        $check = $this->db->query("update tb_matchupload set filename='$imagename',created_at='$current_date' WHERE mup_id= $upid ");
        $imagedata = array(
          'uploaded_id' => $upid,
          'filename' => base_url() . 'uploads/Matchuploads/' . $imagename
        );
        return $imagedata;
      } else {
        $data = array(
          'matchid' => $this->input->post('matchid'),
          'user_uploaded' => $this->input->post('userid'),
          'filename' => $imagename,
          'filetype' => 'file',
          'created_at' => $current_date
        );
        $this->db->insert('tb_matchupload', $data);
        if ($this->db->affected_rows() > 0) {
          $up_id = $this->db->insert_id();
          $imagedata = array(
            'uploaded_id' => $up_id,
            'filename' => base_url() . 'uploads/Matchuploads/' . $imagename
          );
          return $imagedata;
        } else {
          return "fail";
        }
      }
    }
  }
  public function GetUserdetails()
  {
    $email = $this->input->post('email');
    $checkemail = $this->db->query("select * from tb_user where email='$email' ");
    if ($checkemail->num_rows() > 0) {
      $result_array = $checkemail->row();
      // print_r($output);die();
      $data = array();
      $userid = $result_array->id;
      $squad = $this->db->query("select count(*) as squad_count from tb_bestie where (req_from='$userid' or req_to='$userid') and category='squad'");
      $result_squad = $squad->row();
      // print_r($result_squad);
      // echo ;die();
      $bestie = $this->db->query("select count(*) as bestie_count from tb_bestie where (req_from='$userid' or req_to='$userid') and category='bestie'");
      $result_bestie = $bestie->row();
      $fan = $this->db->query("select count(*) as fan_count from tb_fans where (req_from='$userid' or req_to='$userid') and category='fan'");
      $result_fan = $fan->row();
      $fanof = $this->db->query("select count(*) as fanof_count from tb_fans where (req_from='$userid' or req_to='$userid') and category='fan_of'");
      $result_fanof = $fanof->row();
      date_default_timezone_set('Asia/Kolkata');
      $current_date    = date('Y-m-d H:i:s');
      $matches = $this->db->query("select count(*) as match_count from tb_match where invitation_status='accept' and (rival_id='$userid' or opponent_id='$userid')");
      $result_matches = $matches->row();
      // print_r($result_matches);die();
      if (!empty($result_array->profile_pic)) {
        $string = $result_array->profile_pic;
        if (preg_match('/[\'^£$%&*()}{@#~?><>,|=_+¬-]/', $string)) {
          // one or more of the 'special characters' found in $string
          // echo "found";
          $pic = $result_array->profile_pic;
        } else {
          // echo "not found";
          $pic = base_url() . 'uploads/profile_image/' . $result_array->profile_pic;
        }
      } else {
        // echo "not found";
        $pic = base_url() . 'uploads/profile_image/user.png';
      }
      if ($result_array->online_offline_status == 0) {
        $onoffstatus = "online";
      } else {
        $onoffstatus = "offline";
      }
      $data[] =  array(
        'userid'        => $result_array->id,
        'name'      => $result_array->name,
        'email'       => $result_array->email,
        'university_name' => $result_array->university_name,
        'profile_pic'      => $pic,
        'squad_count' => $result_squad->squad_count,
        'bestie_count' => $result_bestie->bestie_count,
        'fans_count' => $result_fan->fan_count,
        'fans_of_count' => $result_fanof->fanof_count,
        'matches_count' => $result_matches->match_count,
        'online_offline_status' => $onoffstatus,
        'last_seen' => $result_array->last_seen
      );
    }
    // print_r($data);die();
    return $data;
  }
  public function addreplycomment()
  {
    $uid = $this->input->post('userid');
    $mid = $this->input->post('matchid');
    $cid = $this->input->post('comment');
    $contestentid = $this->input->post('contestentid');
    $result = $this->db->query("select * from tb_match WHERE matchid='$mid'");
    if ($this->db->affected_rows() > 0) {
      // $result = $this->db->query("select * from tb_like WHERE user_liked='$uid' and matchid='$mid'");
      // if ($this->db->affected_rows() > 0) {
      //  $check = $this->db->query("update tb_like set contestent_id='$cid',like_status='$status' WHERE user_liked='$uid' and matchid='$mid'"); 
      //  if ($this->db->affected_rows() > 0) {
      //   return "success";
      // } else {
      //   return "fail";
      // }
      // }
      // else{
      $data = array(
        'userid' => $this->input->post('userid'),
        'match_id' => $this->input->post('matchid'),
        'comment' => $this->input->post('comment'),
        'contestent_id' => $this->input->post('contestentid'),
        'replied_commentid' => $this->input->post('replied_commentid')
      );
      $this->db->insert('tb_comment', $data);
      if ($this->db->affected_rows() > 0) {
        return "success";
      } else {
        return "fail";
      }
      // } 
    } else {
      return "notexist";
    }
  }
  public function comment_like()
  {
    $cid = $this->input->post('commentid');
    $uid = $this->input->post('userid');
    $valid = $this->db->query("select * from tb_comment WHERE comment_id='$cid' ");
    if ($this->db->affected_rows() > 0) {
      $check = $this->db->query("select * from tb_commentlike WHERE commentid='$cid' and userliked='$uid'");
      if ($this->db->affected_rows() > 0) {
        $result = $this->db->query("select * from tb_commentlike WHERE commentid='$cid' and userliked='$uid' and likestatus='like'");
        if ($this->db->affected_rows() > 0) {
          //dislike
          $update = $this->db->query("update tb_commentlike set likestatus='dislike' WHERE commentid='$cid' and userliked='$uid'");
          if ($this->db->affected_rows() > 0) {
            return "successful";
          } else {
            return "fail";
          }
        } else {
          //like
          $update = $this->db->query("update tb_commentlike set likestatus='like' WHERE commentid='$cid' and userliked='$uid'");
          if ($this->db->affected_rows() > 0) {
            return "success";
          } else {
            return "fail";
          }
        }
      } else {
        $data = array(
          'commentid' => $this->input->post('commentid'),
          'userliked' => $this->input->post('userid'),
          'likestatus' => 'like',
        );
        $this->db->insert('tb_commentlike', $data);
        if ($this->db->affected_rows() > 0) {
          return "success";
        } else {
          return "fail";
        }
      }
    } else {
      return "notexist";
    }
  }
  public function MatchUpload()
  {
    date_default_timezone_set('Asia/Kolkata');
    $current_date    = date('Y-m-d H:i:s');
    $mid = $this->input->post('matchid');
    $upid = $this->input->post('upload_id');
    $text = $this->input->post('text');
    $type = $this->input->post('filetype');
    // print_r($this->input->post('userid'));die();

    // $result_query =  $this->db->query("select * from tb_matchupload where mup_id= $upid");
    // if ($this->db->affected_rows() > 0) {
    //   $check = $this->db->query("update tb_matchupload set filename='$imagename',created_at='$current_date' WHERE mup_id= $upid ");
    //   $imagedata = array(
    //     'uploaded_id' =>$upid,
    //     'filename' =>base_url() . 'uploads/Matchuploads/'.$imagename
    //   );
    //   return $imagedata;
    // }else{
    $data = array(
      'matchid' => $this->input->post('matchid'),
      'user_uploaded' => $this->input->post('userid'),
      'filename' => $text,
      'filetype' => $type,
      'created_at' => $current_date
    );
    $this->db->insert('tb_matchupload', $data);
    if ($this->db->affected_rows() > 0) {
      $up_id = $this->db->insert_id();
      $imagedata = array(
        'uploaded_id' => $up_id,
        // 'filename' =>base_url() . 'uploads/Matchuploads/'.$imagename
      );
      return  $imagedata;
    } else {
      return "fail";
    }
  }
  // }
  public function push($devtoken, $message, $devicetype)
  {
    // echo $devtoken;echo $devicetype;echo $message;die();
    if ($devicetype == "android") {
      $token = $devtoken;
      $fcmUrl = 'https://fcm.googleapis.com/fcm/send';
      $notification = [
        'title' => 'iMatch Notification',
        'body' => $message
      ];
      $extraNotificationData = ["message" => $notification, "notificationid" => '2'];

      $fcmNotification = [
        'to' => $token, //single token
        'notification' => $notification,
        'data' => $extraNotificationData
      ];
      //server api key for iMatch app
      $headers = [
        'Authorization: key=AAAAsKYPTls:APA91bGxeIwygCIeecMI8Q-huiJJSFVNRUnHXP5QoI4qIpnOFvamcMwkh_lguVtMmcfbI1FNWG7PIAKgEpKTp86jt_V2bBpg82lrMsQK8xj8hHh8UfpYMK55EZz2Bt8SnIrs7bR0iu5a',
        'Content-Type: application/json'
      ];


      $ch = curl_init();
      curl_setopt($ch, CURLOPT_URL, $fcmUrl);
      curl_setopt($ch, CURLOPT_POST, true);
      curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
      curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
      curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
      curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fcmNotification));
      $result = curl_exec($ch);
      curl_close($ch);
      $final = json_decode($result);
      $check = $final->success;
      if ($check == 1) {
        $notify['status'] = true;
        $notify['message'] = 'Success';
      } else {
        $notify['status'] = false;
        $notify['userid'] = 'Fail';
      }
      // print_r($notify);
      //echo json_encode($notification);

    }
  }
}
