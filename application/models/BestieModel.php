<?php
defined('BASEPATH') or exit('No direct script access allowed');
class BestieModel  extends AbstractModel
{
    var $_table = 'tb_bestie';
    var $_pk = "bestie_id";
    var $_sort = "bestie_id";

    public function getInvitation($filter){

        $this->db->select("tb_user.*");
        $this->db->join("tb_user","tb_bestie.req_to = tb_user.id","LEFT");
    
        $data = parent::all($filter);
        foreach($data as $index =>$user){
            $data[$index]->pic = getProfileImage((array)$user);
        }
        return $data;
    }
    public function getSquadList($id){
        $filter["req_from"] = $id;
        $filter["req_status"] = 1;
        $filter["category"] = "squad";
        $this->db->select("tb_user.*");
        $this->db->join("tb_user","tb_bestie.req_to = tb_user.id","LEFT");
        $squad_list = parent::all($filter);
        
        foreach($squad_list as $index =>$squad){
            $matchs = $this->MatchUser->all(array("user_id"=> $squad->req_from, "opponent_id"=> $squad->req_to, "accept_status"=>"accept"));
            $squad->match_count = count($matchs);
            $compare_data = array();
            foreach($matchs as $match){
                $medias = array();
                $mediafiles = $this->Upload->all(array("user_uploaded"=> $squad->req_from, "matchid"=>$match->match_id));
                foreach($mediafiles as $index=> $media){
                    $media = (array)$media;
                    $filename = $media['filename'];
                    $filetype = $media['filetype'];
                    if ($filetype == 'file') {
                        $file = base_url() . 'uploads/Matchuploads/' . $filename;
                        $mediafiles[$index]->media_type = getFileType($media['filename']);
                    } else {
                        $file = $filename;
                        $mediafiles[$index]->media_type = $media['filetype'];
                    }
                    $mediafiles[$index]->file_path = $file;
                }
                array_push($medias, $mediafiles);

                $mediafiles = $this->Upload->all(array("user_uploaded"=> $squad->req_to, "matchid"=>$match->match_id));
                foreach($mediafiles as $index=> $media){
                    $media = (array)$media;
                    $filename = $media['filename'];
                    $filetype = $media['filetype'];
                    if ($filetype == 'file') {
                        $file = base_url() . 'uploads/Matchuploads/' . $filename;
                        $mediafiles[$index]->media_type = getFileType($media['filename']);
                    } else {
                        $file = $filename;
                        $mediafiles[$index]->media_type = $media['filetype'];
                    }
                        $mediafiles[$index]->file_path = $file;
                    }
                array_push($medias, $mediafiles);
                array_push($compare_data, $medias);
            }
            $squad->compare_data = $compare_data;
            $squad->show = false;
        }
        return $squad_list;
    }
}
