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
class Joins extends Base
{
    //分类导航
    public function index()
    {
        $data= Db::name('admin_menu')
            ->field(['id','pid','title','en_title','url','nav'])
            ->order(['sort'])
            ->where(['pid'=>68])
            ->select();
        return resultArray(['data' => $data]);
    }

    //banner
    public function joinsBanner()
    {
        $pid=68;
        $field=array('id','pid','title','backimage');
        $data=$this->getBanner($pid,$field);
        return resultArray(['data'=>$data]);
    }

    //优势
    public function joinsAdv()
    {
        $data=Db::name('joins')->field(['create_time','order','en_title'],true)->where(['pid'=>96])->select();
        return resultArray(['data' => $data]);
    }
    //加盟条件
    public function joinsCondition()
    {
        $data=Db::name('joins')->field(['content','create_time','order','en_title'],true)->where(['pid'=>97])->select();
        return resultArray(['data' => $data]);
    }
    //加盟流程
    public function process()
    {
        $data=Db::name('joins')->field(['content','create_time','order','en_title','pic','img'],true)->where(['pid'=>98])->select();
        return resultArray(['data' => $data]);
    }  
    //加盟支持
    public function support()
    {
        $data=Db::name('joins')->field(['create_time','order','en_title'],true)->where(['pid'=>99])->select();
        return resultArray(['data' => $data]);
    }    

}