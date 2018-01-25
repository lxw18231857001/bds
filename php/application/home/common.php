<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/11/28
 * Time: 13:58
 */
use think\Db;
function getDataList($keywords)
{
    $map = [];
    if ($param['keywords']) {
        $map['name'] = ['like', '%'.$keywords.'%'];
    }
    $data = $this->where($map)->order(['order'])->select();
    return $data;
}

//获得二级页面的banner
 function getBanner($pid)
{
    $data=DB::name('shou_ye')->where(['pid'=>$pid])->select();
    return $data;
}