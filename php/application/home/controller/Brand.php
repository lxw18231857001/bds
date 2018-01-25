<?php
/**
 * Created by PhpStorm.
 * User: lxw
 * Date: 2017/11/29
 * Time: 16:29
 */

namespace app\home\controller;

use think\Db;
use app\home\common;
class Brand extends Base
{
    //分类导航
    public function index()
    {
        $data= Db::name('admin_menu')->where(['pid'=>65])->field(['id','pid','title','url','nav'])->order(['sort'])->select();
        return resultArray(['data' => $data]);
    }

    //品牌banner
    public function banner()
    {
        $pid=65;
        $field=array('id','pid','title','backimage','content');
        $data=$this->getBanner($pid,$field);
        return resultArray(['data'=>$data]);
    }

    //品牌历程
    public function brandCourse()
    {
        $data=Db::name('brand')->where(['pid'=>85])->field(['type','status','order'],true)->select();
        foreach ($data as $k=>$vv){
            $time=date('Y',strtotime($vv['create_time']));
            $data[$k]['create_time']=$time;
        }
        return resultArray(['data'=>$data]);
    }
    //品牌故事，文化，荣誉
    public function brandStory()
    {
        $data=Db::name('brand')->where('pid','in',[84,86,87])->field(['type','status','order'],true)->select();
        return resultArray(['data'=>$data]);
    }

}