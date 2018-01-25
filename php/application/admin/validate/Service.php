<?php

namespace app\admin\validate;
use think\Validate;
/**
 * 设置模型
 */
class Service extends Validate{

    protected $rule = array(
        'main_title'   => 'require',
    );
    protected $message = array(
        'main_title.require'    => '服务名称必须填写',
    );
}