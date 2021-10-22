<?php
defined('BASEPATH') or exit('No direct script access allowed');
require APPPATH . '/core/BaseController.php';
class Match extends BaseController
{
    public function getOngoingMatch($id){
        $match = (array)$this->Match->select($id);
        $data = array();
        $compare_data = array();
        $user_id = $match['rival_id']; //rival 
        $match_id = $match['matchid'];
        $user = (array)$this->User->select($user_id);

        if (!empty($user['profile_pic'])) {
            $string = $user['profile_pic'];
            if (preg_match('/[\'^£$%&*()}{@#~?><>,|=_+¬-]/', $string)) {
            $pic = $user['profile_pic'];
            } else {
            $pic = base_url() . 'uploads/profile_image/' . $user['profile_pic'];
            }
        } else {
            $pic = base_url() . 'uploads/profile_image/user.png';
        }
        $user['pic'] = $pic;
        $user['like_count'] = $this->Like->count(array('matchid'=>$match_id, 'contestent_id'=>$user_id, 'like_status'=>'like'));
        $user['dislike_count'] = $this->Like->count(array('matchid'=>$match_id, 'contestent_id'=>$user_id, 'like_status'=>'dislike'));

        $mediafiles = $this->Upload->all(array('user_uploaded'=>$user_id,'matchid' => $match_id));
        foreach($mediafiles as $index=> $media){
            $filename = $media['filename'];
            $filetype = $media['filetype'];
            if ($filetype == 'file') {
                $file = base_url() . 'uploads/Matchuploads/' . $sfilename;
            } else {
                $file = $filename;
            }
            $mediafiles[$index]['file_path'] = $file;
        }
        $user['mediafiles'] = $mediafiles;
        array_push($compare_data, $user);

        $opponents = $this->MatchUser->all(array('match_id' => $match_id, 'accept_status'=> 'accept'));
        foreach($opponents as $oppoent){
            $user = (array)$this->User->select($oppoent['opponent_id']);

            if (!empty($user['profile_pic'])) {
                $string = $user['profile_pic'];
            if (preg_match('/[\'^£$%&*()}{@#~?><>,|=_+¬-]/', $string)) {
                $pic = $user['profile_pic'];
            } else {
                $pic = base_url() . 'uploads/profile_image/' . $user['profile_pic'];
            }
            } else {
                $pic = base_url() . 'uploads/profile_image/user.png';
            }
            $user['pic'] = $pic;
            $match_like_count = $this->Like->count(array('matchid'=>$match_id, 'contestent_id'=>$oppoent['opponent_id'], 'like_status'=>'like'));
            $match_dislike_count = $this->Like->count(array('matchid'=>$match_id, 'contestent_id'=>$oppoent['opponent_id'], 'like_status'=>'dislike'));
            $mediafiles = $this->Upload->all(array('user_uploaded'=>$oppoent['opponent_id'],'matchid' => $match_id));
            foreach($mediafiles as $index=> $media){
                $filename = $media['filename'];
                $filetype = $media['filetype'];
                if ($filetype == 'file') {
                    $file = base_url() . 'uploads/Matchuploads/' . $sfilename;
                } else {
                    $file = $filename;
                }
                $mediafiles[$index]['file_path'] = $file;
            }
            $user['mediafiles'] = $mediafiles;
            array_push($compare_data, $user);
        }
        $cmntcount = $this->Commnet->count(array('match_id'=>$match_id));
        $current_time = date('H:i:s');
        /* Send duration start */
        $stime = $match['replied_at'];
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
      
        $etime = $match['match_end'];
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
      
        $match['comment_count'] = $cmntcount;
        $match['compare_data'] = $compare_data;
        $match['send_duration'] = $sduration;
        $match['remaining_time'] = $rduration;
        array_push($data, $match);
        $this->response(array('success'=>true, $data));
    }
}