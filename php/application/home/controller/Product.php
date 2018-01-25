<?php
/**
 * Created by PhpStorm.
 * User: lxw
 * Date: 2017/11/29
 * Time: 16:29
 */

namespace app\home\controller;

use think\Db;
//use app\home\model\Product as Products;
class Product extends Base
{

    //产品列表
    public function index()
    {
        $productModel =model('Product');
//        $productModel = new \app\home\model\Product();
//        $productModel = new Products();
        $res=Db::name('admin_menu')->where(['id'=>64])->find();
        $param =$this->param;
        $page = !empty($param['page'])?$param['page']:'';
        $limit = !empty($param['limit'])?$param['limit']:'';
        $pid = !empty($param['pid'])?$param['pid']:$res['id'];
        $data=$productModel->getDataList($page,$limit,$pid);
        return resultArray(['data'=>$data]);
    }

    //产品banner
    public function banner()
    {
//        $data=DB::name('shou_ye')->field(['id','pid','title','backimage'])->where(['pid'=>64])->select();
        $pid=64;
        $field=array('id','pid','title','backimage');
        $data=$this->getBanner($pid,$field);
        return resultArray(['data'=>$data]);
    }

    //产品分类名称
    public function productName()
    {
        $productInfo= Db::name('admin_menu')
            ->field(['id','pid','title','en_title','url','nav','icon'])
            ->order(['sort'])
            ->where(['pid'=>64])
            ->select();
        return resultArray(['data' => $productInfo]);
    }

    //产品详情
    public function productDetail()
    {
        $param=$this->param;
        $data=DB::name('product')->field(['status','order','create_time'],true)->where(['id'=>$param['id']])->find();
        return resultArray(['data'=>$data]);
    }
}