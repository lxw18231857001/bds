<?php

namespace app\admin\validate;
use think\Validate;
/**
 * 设置模型
 */
class Contact extends Validate{

    protected $rule = array(
        'title'   => 'require',
    );
    protected $message = array(
        'title.require'    => '服务名称必须填写',
    );
}