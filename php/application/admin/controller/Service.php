<?php
// +----------------------------------------------------------------------
// | Description: 服务设置
// +----------------------------------------------------------------------
// | Author: linchuangbin <linchuangbin@honraytech.com>
// +----------------------------------------------------------------------

namespace app\admin\controller;

use think\Validate;
use think\Db;
class Service extends ApiCommon
{
    //get:获取服务列表
    public function index()
    {
       $serviceModel = model('Service');
        $data =$serviceModel->getDataList();
//                dump($data);
        return resultArray(['data' => $data]);
    }

    public function serviceGroup()
    {
        $data=Db::name('admin_menu')->where(['pid'=>66])->select();
        return resultArray(['data'=>$data]);
    }
    //get: 通过ID获取服务的详细信息
    public function read()
    {
       $serviceModel = model('Service');
        $param = $this->param;
        $data =$serviceModel->getDataById($param['id']);
        if (!$data) {
            return resultArray(['error' =>$serviceModel->getError()]);
        }
        return resultArray(['data' => $data]);
    }

    //post:添加服务
    public function save()
    {
       $serviceModel = model('Service');
        $param = $this->param;
        if($param['photo']||$param['icon']){
            //给上传的背景图加上服务器路径
            $param['photo']=addSeverPath($param['photo']);
            $param['icon']=addSeverPath($param['icon']);
        }else{
            $param['photo']= '';
            $param['icon']= '';
        }
        $data =$serviceModel->createData($param);
        //echo $serviceModel->getLastSql();
        if (!$data) {
            return resultArray(['error' =>$serviceModel->getError()]);
        }
        return resultArray(['data' => '添加成功']);
    }

    //put:() 修改服务
    public function update()
    {
       $serviceModel = model('Service');
        $param = $this->param;
        if(substr($param['photo'],0,7)=='uploads'){
            $param['photo']=addSeverPath($param['photo']);
        }
        if(substr($param['icon'],0,7)=='uploads'){
            $param['icon']=addSeverPath($param['icon']);
        }
        $data =$serviceModel->updateDataById($param, $param['id']);
        if (!$data) {
            return resultArray(['error' =>$serviceModel->getError()]);
        }
        return resultArray(['data' => '修改成功']);
    }

    //   删除服务
    public function delete()
    {
       $serviceModel = model('Service');
        $param = $this->param;
        $data =$serviceModel->delDataById($param['id']);
        if (!$data) {
            return resultArray(['error' =>$serviceModel->getError()]);
        }
        return resultArray(['data' => '删除成功']);
    }


    public function deletes()
    {
       $serviceModel = model('Service');
        $param = $this->param;
        $data =$serviceModel->delDatas($param['ids']);
        if (!$data) {
            return resultArray(['error' =>$serviceModel->getError()]);
        }
        return resultArray(['data' => '删除成功']);
    }

    public function enables()
    {
       $serviceModel = model('Service');
        $param = $this->param;
        $data =$serviceModel->enableDatas($param['ids'], $param['status']);
        if (!$data) {
            return resultArray(['error' =>$serviceModel->getError()]);
        }
        return resultArray(['data' => '操作成功']);
    }

}
