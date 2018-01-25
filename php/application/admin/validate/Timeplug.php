<?php

namespace app\admin\validate;
use think\Validate;
/**
 * 设置模型
 */
class Timeplug extends Validate{

    protected $rule = array(
        'title'   => 'require',
    );

}