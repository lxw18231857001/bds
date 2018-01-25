<?php
// +----------------------------------------------------------------------
// | Description: 产品设置
// +----------------------------------------------------------------------
// | Author: linchuangbin <linchuangbin@honraytech.com>
// +----------------------------------------------------------------------

namespace app\admin\controller;

class Product extends ApiCommon
{
    //get:获取产品列表
    public function index()
    {

       $productModel = model('Product');
        $data =$productModel->getDataList();
        return resultArray(['data' => $data]);
    }

    //get:获取产品分类
    public function productType()
    {
        $productModel = model('Product');
        $data =$productModel->getTypeList();
        return resultArray(['data' => $data]);
    }


    //get: 通过ID获取产品的详细信息
    public function read()
    {
       $productModel = model('Product');
        $param = $this->param;
        $data =$productModel->getDataById($param['id']);
        if (!$data) {
            return resultArray(['error' =>$productModel->getError()]);
        }
        return resultArray(['data' => $data]);
    }

    //post:添加产品
    public function save()
    {
       $productModel = model('Product');
        $param = $this->param;

        if($param['litpic']){
            $param['litpic']=addSeverPath($param['litpic']);
        }else{
            $param['litpic']= '';
        }
        $data =$productModel->createData($param);
        if (!$data) {
            return resultArray(['error' =>$productModel->getError()]);
        }
        return resultArray(['data' => '添加成功']);
    }

    //put:() 修改产品
    public function update()
    {
       $productModel = model('Product');
        $param = $this->param;
        $str=substr($param['litpic'],0,7);
        if($str=='uploads'){
            $param['litpic']=addSeverPath($param['litpic']);
        }
        $data =$productModel->updateDataById($param, $param['id']);
        if (!$data) {
            return resultArray(['error' =>$productModel->getError()]);
        }
        return resultArray(['data' => '修改成功']);
    }

    //   删除产品
    public function delete()
    {
       $productModel = model('Product');
        $param = $this->param;
        $data =$productModel->delDataById($param['id']);
        if (!$data) {
            return resultArray(['error' =>$serviceModel->getError()]);
        }
        return resultArray(['data' => '删除成功']);
    }


    public function deletes()
    {
       $productModel = model('Product');
        $param = $this->param;
        $data =$productModel->delDatas($param['ids']);
        if (!$data) {
            return resultArray(['error' =>$productModel->getError()]);
        }
        return resultArray(['data' => '删除成功']);
    }

    public function enables()
    {
       $productModel = model('Product');
        $param = $this->param;
        $data =$productModel->enableDatas($param['ids'], $param['status']);
        if (!$data) {
            return resultArray(['error' =>$productModel->getError()]);
        }
        return resultArray(['data' => '操作成功']);
    }

}
