<?php
// +----------------------------------------------------------------------
// | Description: 加盟设置
// +----------------------------------------------------------------------
// | Author: linchuangbin <linchuangbin@honraytech.com>
// +----------------------------------------------------------------------

namespace app\admin\controller;
use think\Db;

class Joins extends ApiCommon
{
    //get:获取加盟列表
    public function index()
    {

       $joinsModel = model('Joins');
        $data =$joinsModel->getDataList();
        return resultArray(['data' => $data]);
    }

    //get:获取加盟分类
    public function joinsType()
    {
        $data=Db::name("admin_menu")->where(['pid'=>68])->select();
        return resultArray(['data' => $data]);
    }


    //get: 通过ID获取加盟的详细信息
    public function read()
    {
       $joinsModel = model('Joins');
        $param = $this->param;
        $data =$joinsModel->getDataById($param['id']);
        if (!$data) {
            return resultArray(['error' =>$joinsModel->getError()]);
        }
        return resultArray(['data' => $data]);
    }

    //post:添加加盟
    public function save()
    {
       $joinsModel = model('Joins');
        $param = $this->param;

        if($param['pic']||$param['img']){
            $param['pic']=addSeverPath($param['pic']);
            $param['img']=addSeverPath($param['img']);
        }else{
            $param['pic']= '';
            $param['img']= '';
        }
        $data =$joinsModel->createData($param);
        if (!$data) {
            return resultArray(['error' =>$joinsModel->getError()]);
        }
        return resultArray(['data' => '添加成功']);
    }

    //put:() 修改加盟
    public function update()
    {
       $joinsModel = model('Joins');
        $param = $this->param;
        if(substr($param['pic'],0,7)=='uploads'){
            $param['pic']=addSeverPath($param['pic']);
        }
        if(substr($param['img'],0,7)=='uploads'){
            $param['img']=addSeverPath($param['img']);
        }
        $data =$joinsModel->updateDataById($param, $param['id']);
        if (!$data) {
            return resultArray(['error' =>$joinsModel->getError()]);
        }
        return resultArray(['data' => '修改成功']);
    }

    //   删除加盟
    public function delete()
    {
       $joinsModel = model('Joins');
        $param = $this->param;
        $data =$joinsModel->delDataById($param['id']);
        if (!$data) {
            return resultArray(['error' =>$serviceModel->getError()]);
        }
        return resultArray(['data' => '删除成功']);
    }


    public function deletes()
    {
       $joinsModel = model('Joins');
        $param = $this->param;
        $data =$joinsModel->delDatas($param['ids']);
        if (!$data) {
            return resultArray(['error' =>$joinsModel->getError()]);
        }
        return resultArray(['data' => '删除成功']);
    }

    public function enables()
    {
       $joinsModel = model('Joins');
        $param = $this->param;
        $data =$joinsModel->enableDatas($param['ids'], $param['status']);
        if (!$data) {
            return resultArray(['error' =>$joinsModel->getError()]);
        }
        return resultArray(['data' => '操作成功']);
    }

}
