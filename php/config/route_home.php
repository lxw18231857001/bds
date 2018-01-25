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


//    //【案例】案例分类
//    'home/case/type/:id'    => ['home/cases/caseType',['method' => 'get'],['id' => '\d+']],
//    //【观点/动态】新闻列表
//    'home/newsDetails/:id'   =>['home/news/newsDetails',['method'=>'get'],['id' => '\d+']],

    //【产品列表banner】
    'home/product/banner'        =>['home/product/banner',['method'=>'get']],
    //【产品分类名称】
    'home/productName'          =>['home/product/productName',['method'=>'get']],
    //【产品分类列表分页】
    'home/productList/:pid'      =>['home/product/index',['method'=>'get'],['pid'=>'\d+']],
    //【产品详情】
    'home/productDetail/:id'    =>['home/product/productDetail',['method'=>'get'],['id'=>'\d+']],

    //【品牌分类导航】
    'home/brand'                 =>['home/brand/index',['method'=>'get']],
    //【品牌banner】
    'home/brand/banner'         =>['home/brand/banner',['method'=>'get']],
    //【品牌历程】
    'home/brand/brandCourse'     =>['home/brand/brandCourse',['method'=>'get']],
    //【品牌故事文化荣誉】
    'home/brand/brandStory'       =>['home/brand/brandStory',['method'=>'get']],

    //【服务栏目分类】
    'home/service'                =>['home/service/index',['method'=>'get']],
    //【服务banner】
    'home/serviceBanner'          =>['home/service/serviceBanner',['method'=>'get']],
    //【服务学院】
    'home/serviceSchool'  =>['home/service/serviceSchool',['method'=>'get']],
    //【服务定制服务】
    'home/service/customized'  =>['home/service/customized',['method'=>'get']],
    //【服务预约测量】
    'home/service/measure'  =>['home/service/measure',['method'=>'post']],
    //【服务订单查询】
    'home/service/search'  =>['home/service/search',['method'=>'post']],

    //【新闻分类】
    'home/newName'      =>['home/news/newName',['method'=>'get']],
    //【新闻banner】
    'home/newsBanner'      =>['home/news/newsBanner',['method'=>'get']],
    //【新闻列表】
    'home/news/:pid'     => ['home/news/index',['method'=>'get'],['pid'=>'\d+']],
    //【新闻详情】
    'home/newsDetails/:pid/:id'     => ['home/news/newsDetails',['method'=>'get'],['id'=>'\d+'],['pid'=>'\d+']],
    //【新闻详情】
    'home/news/frontAfter/:pid/:id'     => ['home/news/frontAfter',['method'=>'get'],['id'=>'\d+'],['pid'=>'\d+']],

    //【招商banner】
    'home/joinsBanner'     => ['home/joins/joinsBanner',['method'=>'get']],
    //【招商分类名称】
    'home/joinsName'     => ['home/joins/index',['method'=>'get']],
    //【招商优势】
    'home/joins/joinsAdv'     => ['home/joins/joinsAdv',['method'=>'get']],
    //【加盟条件】
    'home/joins/condition'     => ['home/joins/joinsCondition',['method'=>'get']],
    //【加盟流程】
    'home/joins/process'     => ['home/joins/process',['method'=>'get']],
    //【加盟支持】
    'home/joins/support'     => ['home/joins/support',['method'=>'get']],
    //【联系我们】
    'home/contact'             => ['home/contact/index',['method'=>'get']],












    'home/service/test'  =>['home/service/test',['method'=>'get']],
    'home/service/status'  =>['home/service/status',['method'=>'get']],
    'home/service/status2'  =>['home/service/status2',['method'=>'get']],
    'home/service/status3'  =>['home/service/status3',['method'=>'get']],
    'home/news/fenye/:pid/:id'  =>['home/news/fenye',['method'=>'get'],['id'=>'\d+'],['pid'=>'\d+']],
    'home/news/explain'  =>['home/news/explain',['method'=>'get']],










    '__miss__'  => 'home/base/miss',
];


