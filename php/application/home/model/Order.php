<?php
/**
 * Created by PhpStorm.
 * User: lxw
 * Date: 2018/1/6
 * 测试代码
 * Time: 18:28
 */

namespace app\home\model;
use think\Model;

class Order extends Model
{
    //自动完成
    protected $name='order';
    protected $auto= ['time'];
    protected $insert= ['ip'];
    protected $update= ['login_ip','ip'];
    protected $createTime = 'create_time';
    protected $updateTime = false;
    protected $autoWriteTimestamp = true;
    //get+字段+Attr (驼峰命名) 获取器
//    public function getStatusTextAttr($value,$data)
//    {
//        $status = [-1=>'删除',0=>'禁用',1=>'正常',2=>'待审核'];
////        return $status[$value];
//        return $status[$data['status']];
//    }

//    public function getStatusAttr($value)
//    {
//        $status = [-1=>'删除',0=>'禁用',1=>'正常',2=>'待审核'];
//        return $status[$value];
//    }
    //修改器
    public function setOrderIdAttr($val)
    {
        return strtoupper($val);
    }

    public function setStatusAttr($val,$data)
    {
//        return md5($val);
        return $val;
//        return serialize($data);
    }

    protected function setTimeAttr()
    {
        return time();
    }

    protected function setIpAttr()
    {
        return request()->ip();
    }

    protected function setLoginIpAttr()
    {
        return request()->ip();
    }
}