<?php
/**
 * Created by PhpStorm.
 * User: lxw
 * Date: 2018/1/8
 * Time: 13:54
 */

namespace app\home\model;


use think\Model;

class News extends Model
{
    protected $name = 'news';
    protected $dateFormat = 'Y年m月d日';
    protected $type       = [ 'create_time'    =>'datetime',  ];
    public function getDataList($page,$limit,$pid)
    {
        $dataCount=$this->where(['pid'=>$pid])->count('id');

        //若有分页
        if($page&&$limit)
        {
            $list=$this
                ->page($page,$limit)
                ->field(['status','order','read_num'],true)
                ->where(['pid'=>$pid])
                ->select();
        }
        foreach ($list as $k =>$vv){
            $list[$k]['content']=strip_tags(mb_substr($vv['content'],0,350,'utf-8')).'...';
        }
        $data['list']=$list;
        $data['dataCount']=$dataCount;
        return $data;
    }
}