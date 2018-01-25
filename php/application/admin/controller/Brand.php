<?php
// +----------------------------------------------------------------------
// | Description: 品牌设置
// +----------------------------------------------------------------------
// | Author: linchuangbin <linchuangbin@honraytech.com>
// +----------------------------------------------------------------------

namespace app\admin\controller;

class Brand extends ApiCommon
{
    //get:获取品牌列表
    public function index()
    {
       $brandModel = model('Brand');
        $data =$brandModel->getDataList( );
        return resultArray(['data' => $data]);
    }

    //get:获取品牌分类
    public function brandType()
    {
        $brandModel = model('Brand');
        $data =$brandModel->getTypeList();
        return resultArray(['data' => $data]);
    }

    //get: 通过ID获取品牌的详细信息
    public function read()
    {
       $brandModel = model('Brand');
        $param = $this->param;
        $data =$brandModel->getDataById($param['id']);
        if (!$data) {
            return resultArray(['error' =>$brandModel->getError()]);
        }
        return resultArray(['data' => $data]);
    }

    //post:添加品牌
    public function save()
    {
       $brandModel = model('Brand');
        $param = $this->param;
        if($param['pic']){
            $param['pic']=addSeverPath($param['pic']);
        }else{
            $param['pic']= '';
        }
        $data =$brandModel->createData($param);
        if (!$data) {
            return resultArray(['error' =>$brandModel->getError()]);
        }
        return resultArray(['data' => '添加成功']);
    }

    //put:() 修改品牌
    public function update()
    {
       $brandModel = model('Brand');
        $param = $this->param;
        $str=substr($param['pic'],0,7);
        if($str=='uploads'){
            $param['pic']=addSeverPath($param['pic']);
        }
        $data =$brandModel->updateDataById($param, $param['id']);
        if (!$data) {
            return resultArray(['error' =>$brandModel->getError()]);
        }
        return resultArray(['data' => '修改成功']);
    }

    //   删除品牌
    public function delete()
    {
       $brandModel = model('Brand');
        $param = $this->param;
        $data =$brandModel->delDataById($param['id']);
        if (!$data) {
            return resultArray(['error' =>$serviceModel->getError()]);
        }
        return resultArray(['data' => '删除成功']);
    }


    public function deletes()
    {
       $brandModel = model('Brand');
        $param = $this->param;
        $data =$brandModel->delDatas($param['ids']);
        if (!$data) {
            return resultArray(['error' =>$brandModel->getError()]);
        }
        return resultArray(['data' => '删除成功']);
    }

    public function enables()
    {
       $brandModel = model('Brand');
        $param = $this->param;
        $data =$brandModel->enableDatas($param['ids'], $param['status']);
        if (!$data) {
            return resultArray(['error' =>$brandModel->getError()]);
        }
        return resultArray(['data' => '操作成功']);
    }

}
