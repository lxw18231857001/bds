<?php
// +----------------------------------------------------------------------
// | Description: 基础框架路由配置文件
// +----------------------------------------------------------------------
// | Author: linchuangbin <linchuangbin@honghaiweb.com>
// +----------------------------------------------------------------------
//批量注册.定义路由配置文件,除了支持动态注册，也可以直接在应用目录下面的route.php 的最后通过返回数组的方式直接定义路由规则
return [
    // 定义资源路由
    '__rest__'=>[
        'admin/rules'		   =>'admin/rules',
        'admin/groups'		   =>'admin/groups',
        'admin/users'		   =>'admin/users',
        'admin/menus'		   =>'admin/menus',
        'admin/structures'	   =>'admin/structures',
        'admin/posts'          =>'admin/posts',
        'admin/product'        =>'admin/product',
        'admin/service'        =>'admin/service',
        'admin/brand'          =>'admin/brand',
        'admin/news'           =>'admin/news',
        'admin/contact'        =>'admin/contact',
        'admin/systemConfigs'  =>'admin/systemConfigs',
        'admin/shouYe'         =>'admin/shouYe',
        'admin/friend'         =>'admin/friend',
        'admin/joins'         =>'admin/joins',
        'admin/mysqls'         =>'admin/mysqls',
        'admin/Measure'       =>'admin/Measure',
    ],

    // 【基础】登录
    'admin/base/login' => ['admin/base/login', ['method' => 'POST']],
    // 【基础】记住登录
    'admin/base/relogin'	=> ['admin/base/relogin', ['method' => 'POST']],
    // 【基础】修改密码
    'admin/base/setInfo' => ['admin/base/setInfo', ['method' => 'POST']],
    // 【基础】退出登录
    'admin/base/logout' => ['admin/base/logout', ['method' => 'POST']],
    // 【基础】获取配置
    'admin/base/getConfigs' => ['admin/base/getConfigs', ['method' => 'POST']],
    // 【基础】获取验证码
    'admin/base/getVerify' => ['admin/base/getVerify', ['method' => 'GET']],
    // 【基础】上传图片
    'admin/upload' => ['admin/upload/index', ['method' => 'POST']],
    // 保存系统配置
    'admin/systemConfigs' => ['admin/systemConfigs/save', ['method' => 'POST']],
    // 【规则】批量删除
    'admin/rules/deletes' => ['admin/rules/deletes', ['method' => 'POST']],
    // 【规则】批量启用/禁用
    'admin/rules/enables' => ['admin/rules/enables', ['method' => 'POST']],
    // 【用户组】批量删除
    'admin/groups/deletes' => ['admin/groups/deletes', ['method' => 'POST']],
    // 【用户组】批量启用/禁用
    'admin/groups/enables' => ['admin/groups/enables', ['method' => 'POST']],
    // 【用户】批量删除
    'admin/users/deletes' => ['admin/users/deletes', ['method' => 'POST']],
    // 【用户】批量启用/禁用
    'admin/users/enables' => ['admin/users/enables', ['method' => 'POST']],
    // 【菜单】批量删除
    'admin/menus/deletes' => ['admin/menus/deletes', ['method' => 'POST']],
    // 【菜单】批量启用/禁用
    'admin/menus/enables' => ['admin/menus/enables', ['method' => 'POST']],
    // 【组织架构】批量删除
    'admin/structures/deletes' => ['admin/structures/deletes', ['method' => 'POST']],
    // 【组织架构】批量启用/禁用
    'admin/structures/enables' => ['admin/structures/enables', ['method' => 'POST']],
    // 【部门】批量删除
    'admin/posts/deletes' => ['admin/posts/deletes', ['method' => 'POST']],
    // 【部门】批量启用/禁用
    'admin/posts/enables' => ['admin/posts/enables', ['method' => 'POST']],
    // 【产品】批量删除
    'admin/product/deletes' => ['admin/product/deletes', ['method' => 'POST']],
    // 【产品】批量启用/禁用
    'admin/product/enables' => ['admin/product/enables', ['method' => 'POST']],
    // 【产品分类】
    'admin/productType' => ['admin/product/productType', ['method' => 'GET']],
    // 【服务】批量删除
    'admin/service/deletes' => ['admin/service/deletes', ['method' => 'POST']],
    // 【服务】批量启用/禁用
    'admin/service/enables' => ['admin/service/enables', ['method' => 'POST']],
    // 【服务】批量启用/禁用
    'admin/serviceGroup' => ['admin/service/serviceGroup', ['method' => 'Get']],
    // 【品牌】批量删除
    'admin/brand/deletes' => ['admin/brand/deletes', ['method' => 'POST']],
    // 【品牌】批量启用/禁用
    'admin/brand/enables' => ['admin/brand/enables', ['method' => 'POST']],
    // 【品牌分类】
    'admin/brandType' => ['admin/brand/brandType', ['method' => 'GET']],

    // 【新闻】批量删除
    'admin/news/deletes' => ['admin/news/deletes', ['method' => 'POST']],
    // 【新闻】批量启用/禁用
    'admin/news/enables' => ['admin/news/enables', ['method' => 'POST']],
    // 【新闻分类】
    'admin/newType' => ['admin/news/newType', ['method' => 'GET']],
    // 【联系】批量删除
    'admin/contact/deletes' => ['admin/contact/deletes', ['method' => 'POST']],
    // 【联系】批量启用/禁用
    'admin/contact/enables' => ['admin/contact/enables', ['method' => 'POST']],
    // 【首页】批量删除
    'admin/shouye/deletes' => ['admin/shouye/deletes', ['method' => 'POST']],
    // 【首页】批量启用/禁用
    'admin/shouye/enables' => ['admin/shouye/enables', ['method' => 'POST']],
    // 【banner 分类】
    'admin/mainType'      => ['admin/shouYe/mainType', ['method' => 'GET']],
    // 【友情链接】批量删除
    'admin/friend/deletes' => ['admin/friend/deletes', ['method' => 'POST']],
    // 【友情链接】批量启用/禁用
    'admin/friend/enables' => ['admin/friend/enables', ['method' => 'POST']],
    // 【招商加盟】批量删除
    'admin/joins/deletes' => ['admin/joins/deletes', ['method' => 'POST']],
    // 【招商加盟】批量启用/禁用
    'admin/joins/enables' => ['admin/joins/enables', ['method' => 'POST']],
    // 【招商分类】
    'admin/joinsType'      => ['admin/joins/joinsType', ['method' => 'GET']],
    // 【数据库管理】批量删除
    'admin/mysqls/deletes' => ['admin/mysqls/deletes', ['method' => 'POST']],
    // 【数据库管理】导出
    'admin/mysqls/download' => ['admin/mysqls/download', ['method' => 'GET']],
    // 【预约测量】批量删除
    'admin/measure/deletes' => ['admin/measure/deletes', ['method' => 'POST']],

    // MISS路由
    '__miss__'  => 'admin/base/miss',
];