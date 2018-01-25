<?php
/**
 * 首页内容获取
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/11/28
 * Time: 10:02
 */
namespace app\home\controller;
use app\home\model\Product;
use think\Db;
use think\Request;
class Index extends Base
{
    //导航菜单栏
    public function getNav()
    {
        $data=Db::name('admin_menu')->field(['id','pid','title','url','nav'])->order(['sort'])->where(['pid'=>63])->select();
        foreach ($data as $k=>$vo){
            $data[$k]['child']=Db::name('admin_menu')
                              ->field(['id','pid','title','en_title','url','nav','icon'])
                              ->order(['sort'])
                              ->where(['pid'=>$vo['id']])
                              ->select();
        }
//        dump($data);die;
        return resultArray(['data'=>$data]);
    }

    //banner轮播图及简述说明
    public function getBanner()
    {
        $data=Db::name('product')->field(['content','create_time','order','pid'],true)->where(['status'=>1])->select();
        return resultArray(['data'=>$data]);
    }

    //中部产品
    public function getProduct()
    {
        $product= new Product();
        $data=$product
            ->alias('product')
            ->join('__ADMIN_MENU__ am','product.pid = am.id')
            ->field('product.id,product.litpic,product.title,am.title as am_title')
            ->where(['product.status'=>2])
            ->select();
        return resultArray(['data'=>$data]);
    }

    //首页背景图（产品分类列表，服务部分，品牌部分）
    public function getBackImage()
    {
        $data=DB::name('shou_ye')->where(['pid'=>0])->field(['id','backimage','title'])->select();
        return resultArray(['data'=>$data]);
    }
    //友情连接
    public function getFriend()
    {
        $data=DB::name('friend')->field(['url','title'])->select();
        return resultArray(['data'=>$data]);
    }
    //页脚导航
    public function getFootNav()
    {
        $data=Db::name('admin_menu')->field(['id','pid','title','url','nav'])->where(['pid'=>63])->select();
        return resultArray(['data'=>$data]);
    }
    //关键字，描述，版权，备案号,logo,热线
    public function getSys()
    {
        $data=Db::name('system_config')->select();
        $hotLine=DB::name('contact')->field('hotline')->select();
        $data['hotline']=$hotLine;
        return resultArray(['data'=>$data]);

    }

}