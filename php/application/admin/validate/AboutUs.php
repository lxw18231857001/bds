<?php

namespace app\admin\validate;
use think\Validate;
/**
 * 设置模型
 */
class AboutUs extends Validate{

    protected $rule = array(
        'news_title'   => 'require',
    );
    protected $message = array(
        'news_title.require'    => '标题必须填写',
    );
}