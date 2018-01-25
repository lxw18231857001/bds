<?php
/**
 * Created by PhpStorm.
 * User: lxw
 * Date: 2018/1/5
 * Time: 11:39
 */

namespace app\home\validate;

use think\Validate;
class Service extends  Validate
{
    protected $rule =   [
        'name'=>'require|chs|max:4',
        'tel'=>['regex'=>'/^((0\d{2,3}-\d{7,8})|(1[3584]\d{9}))$/'],
        'ordertime'=>'date',
        'address'=>'require',
    ];

    protected $message  =   [
        'name.require' => '名称必须',
        'name.max'     => '名称最多不能超过4个字符',
        'name.chs'     => '名称只能是中文',
        'tel.regex'    => '电话格式不合法',
        'ordertime'    => '预约时间格式错误',
        'address'      =>'预约地址不能为空',
    ];
}