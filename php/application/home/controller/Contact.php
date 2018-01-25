<?php
/**
 * Created by PhpStorm.
 * User: lxw
 * Date: 2018/1/9
 * Time: 10:04
 */

namespace app\home\controller;
use think\Db;
class Contact extends Base
{
    public function index()
    {
        $data=Db::name('contact')->find();
        return resultArray(['data'=>$data]);
    }
}