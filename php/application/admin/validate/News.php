<?php

namespace app\admin\validate;
use think\Validate;
/**
 * 设置模型
 */
class News extends Validate{

    protected $rule = array(
        'title'   => 'require',
    );
    protected $message = array(
        'title.require'    => '案例名称必须填写',
    );
}