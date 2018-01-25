<?php
/**
 * Created by PhpStorm.
 * User: lxw
 * Date: 2017/12/28
 * Time: 11:38
 */

namespace app\home\model;
use think\Model;
class Product extends Model
{
    protected $name = 'product';

    public function getDataList($page,$limit,$pid)
    {
        $dataCount=$this->where(['pid'=>$pid])->count('id');

    //若有分页
        if($page&&$limit)
        {
            $list=$this
                ->page($page,$limit)
                ->field(['status','order','create_time','desc','content','pid'],true)
                ->where(['pid'=>$pid])
                ->select();
        }
        $data['list']=$list;
        $data['dataCount']=$dataCount;
        return $data;
    }
}