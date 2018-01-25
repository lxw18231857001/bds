<?php
// +----------------------------------------------------------------------
// | Description: 首页信息设置
// +----------------------------------------------------------------------
// | Author: linchuangbin <linchuangbin@honraytech.com>
// +----------------------------------------------------------------------

namespace app\admin\controller;

use think\Db;

class ShouYe extends ApiCommon
{
    //get:获取首页信息列表
    public function index()
    {
        $shouYeModel = model('ShouYe');
        $data = $shouYeModel->getDataList( );
        return resultArray(['data' => $data]);
    }

    public function mainType()
    {
        $data=Db::name('admin_menu')->where(['pid'=>63])->select();
        return resultArray(['data'=>$data]);
    }
    //get: 通过ID获取首页信息的详细信息
    public function read()
    {
        $shouYeModel = model('ShouYe');
        $param = $this->param;
        $data = $shouYeModel->getDataById($param['id']);
        if (!$data) {
            return resultArray(['error' => $shouYeModel->getError()]);
        }
        return resultArray(['data' => $data]);
    }

    //post:添加首页信息
    public function save()
    {
        $shouYeModel = model('ShouYe');
        $param = $this->param;
        $param['pid']= !empty($param['pid'])?$param['pid']:'0';
        if($param['backimage']){
            $param['backimage']=addSeverPath($param['backimage']);
        }else{
            $param['backimage']= '';
        }
        $data = $shouYeModel->createData($param);
        if (!$data) {
            return resultArray(['error' => $shouYeModel->getError()]);
        }
        return resultArray(['data' => '添加成功']);
    }

    //put:() 修改首页信息
    public function update()
    {
        $shouYeModel = model('ShouYe');
        $param = $this->param;
        $param['pid']= !empty($param['pid'])?$param['pid']:'0';
        $str=substr($param['backimage'],0,7);
        if($str=='uploads'){
            $param['backimage']=addSeverPath($param['backimage']);
        }
        $data = $shouYeModel->updateDataById($param, $param['id']);
        if (!$data) {
            return resultArray(['error' => $shouYeModel->getError()]);
        }
        return resultArray(['data' => '修改成功']);
    }

    //   删除首页信息
    public function delete()
    {
        $shouYeModel = model('ShouYe');
        $param = $this->param;
        $data = $shouYeModel->delDataById($param['id']);
        if (!$data) {
            return resultArray(['error' =>$serviceModel->getError()]);
        }
        return resultArray(['data' => '删除成功']);
    }


    public function deletes()
    {
        $shouYeModel = model('ShouYe');
        $param = $this->param;
        $data = $shouYeModel->delDatas($param['ids']);
        if (!$data) {
            return resultArray(['error' => $shouYeModel->getError()]);
        }
        return resultArray(['data' => '删除成功']);
    }

    public function enables()
    {
        $shouYeModel = model('ShouYe');
        $param = $this->param;
        $data = $shouYeModel->enableDatas($param['ids'], $param['status']);
        if (!$data) {
            return resultArray(['error' => $shouYeModel->getError()]);
        }
        return resultArray(['data' => '操作成功']);
    }

}
