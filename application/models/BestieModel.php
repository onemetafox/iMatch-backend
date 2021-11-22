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
}
