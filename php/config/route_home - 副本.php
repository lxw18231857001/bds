<?php
// +----------------------------------------------------------------------
// | Description: 基础框架路由配置文件
//Route::rule('路由表达式','路由地址','请求类型','路由参数（数组）','变量规则（数组）');
//Route::get('/',function(){   return 'Hello,world!';});
// | Author: linchuangbin <linchuangbin@honghaiweb.com>
// +----------------------------------------------------------------------
use think\Route;
//首页
Route::controller('home/index','home/Index');

return [
    //服务
    'home/service'          => ['home/service/index',['method' => 'get']],
    //【案例】案例列表
    'home/cases'            => ['home/cases/index',['method' => 'get']],
    //【案例】案例详情
    'home/case/:id'          => ['home/cases/caseInfo',['method' => 'get'],['id' => '\d+']],
    //【案例】案例分类
    'home/case/type/:id'    => ['home/cases/caseType',['method' => 'get'],['id' => '\d+']],
    //【案例】案例分类名称
    'home/case/name'         => ['home/cases/caseName',['method' => 'get']],

    'home/case/test'         => ['home/cases/test',['method' => 'get']],
//    'home/case/casegetid'         => ['home/cases/caseGetId',['method' => 'get']],
//    'home/today/[:year]/[:month]'   => ['home/cases/today',['method' => 'get'],['year' => '\d+','month' => '\d+']],

    //【我们】叶晟荣介绍
    'home/aboutus'           => ['home/aboutUs/index',['method' => 'get']],
    //【我们】叶晟荣banner
    'home/aboutus/banner'    => ['home/aboutUs/banner',['method' => 'get']],
    //【我们】我们的优势
    'home/aboutus/advandages' => ['home/aboutUs/advandages',['method' => 'get']],
    //【我们】我们的团队
    'home/aboutus/team'     => ['home/aboutUs/team',['method' => 'get']],
    //【我们】我们的轮播长图
    'home/aboutus/slider'   => ['home/aboutUs/slider',['method' => 'get']],
    //【观点/动态】新闻列表
    'home/news'             =>['home/news/index',['method'=>'get']],
    //【观点/动态】新闻列表
    'home/newsDetails/:id'   =>['home/news/newsDetails',['method'=>'get'],['id' => '\d+']],
    //【联系】总分部
    'home/contact'          =>['home/contact/index',['method'=>'get']],
    //【联系】中间横图
    'home/contact/middle'   =>['home/contact/middle',['method'=>'get']],



//    'home/service/:id'   => ['home/service/update',['method' => 'get'], ['id' => '\d+']],
    // 【案例】批量启用/禁用
//    'admin/cases/enables' => ['admin/cases/enables', ['method' => 'POST']],

    '__miss__'  => 'home/base/miss',
];


