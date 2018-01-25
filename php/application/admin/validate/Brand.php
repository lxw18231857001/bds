<?php

namespace app\admin\validate;
use think\Validate;
/**
 * 设置模型
 */
class Brand extends Validate{

    protected $rule = array(
        'title'   => 'require',
    );
    protected $message = array(
        'title.require'    => '品牌名称必须填写',
    );
}