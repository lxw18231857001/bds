<?php

namespace app\admin\validate;
use think\Validate;
/**
 * 设置模型
 */
class Friend extends Validate{

    protected $rule = array(
        'title'   => 'require',
    );
    protected $message = array(
        'title.require'    => '友情链接名称必须填写',
    );
}