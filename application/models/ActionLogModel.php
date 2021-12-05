<?php
defined('BASEPATH') or exit('No direct script access allowed');
class ActioinLogModel  extends AbstractModel
{
    var $_table = 'tb_actionlog';

    public function all($filter){
        $this->db->join("tb_bestie", "tb_bestie.req_from = tb_actionlog.user_id");
        $this->db->join("tb_user", "tb_actionlog.user_id = tb_user.id");
        $actions = parent::all($filter);
        foreach($actions as $index =>$user){
            $actions[$index]->pic = getProfileImage((array)$user);
        }
    }
}
