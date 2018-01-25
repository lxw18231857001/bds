<?php
// +----------------------------------------------------------------------
// | Description: 联系我们设置
// +----------------------------------------------------------------------
// | Author: linchuangbin <linchuangbin@honraytech.com>
// +----------------------------------------------------------------------

namespace app\admin\controller;

class Contact extends ApiCommon
{
    //get:获取联系我们列表
    public function index()
    {
       $contactModel = model('Contact');
        $param = $this->param;
        $keywords = !empty($param['keywords']) ? $param['keywords']: '';
        $page = !empty($param['page']) ? $param['page']: '';
        $limit = !empty($param['limit']) ? $param['limit']: '';
        $data = $contactModel->getDataList($keywords, $page, $limit);
        return resultArray(['data' => $data]);
    }

    //get: 通过ID获取联系我们的详细信息
    public function read()
    {
       $contactModel = model('Contact');
        $param = $this->param;
        $data = $contactModel->getDataById($param['id']);
        if (!$data) {
            return resultArray(['error' => $contactModel->getError()]);
        }
        return resultArray(['data' => $data]);
    }

    //post:添加联系我们
    public function save()
    {
       $contactModel = model('Contact');
        $param = $this->param;
        if($param['backimage']){
            $param['backimage']=addSeverPath($param['backimage']);
        }else{
            $param['backimage']= '';
        }
        $data = $contactModel->createData($param);
        if (!$data) {
            return resultArray(['error' => $contactModel->getError()]);
        }
        return resultArray(['data' => '添加成功']);
    }

    //put:() 修改联系我们
    public function update()
    {
       $contactModel = model('Contact');
        $param = $this->param;
        $str=substr($param['backimage'],0,7);
        if($str=='uploads'){
            $param['backimage']=addSeverPath($param['backimage']);
        }
        $data = $contactModel->updateDataById($param, $param['id']);
        if (!$data) {
            return resultArray(['error' => $contactModel->getError()]);
        }
        return resultArray(['data' => '修改成功']);
    }

    //   删除联系我们
    public function delete()
    {
       $contactModel = model('Contact');
        $param = $this->param;
        $data = $contactModel->delDataById($param['id']);
        if (!$data) {
            return resultArray(['error' =>$serviceModel->getError()]);
        }
        return resultArray(['data' => '删除成功']);
    }


    public function deletes()
    {
       $contactModel = model('Contact');
        $param = $this->param;
        $data = $contactModel->delDatas($param['ids']);
        if (!$data) {
            return resultArray(['error' => $contactModel->getError()]);
        }
        return resultArray(['data' => '删除成功']);
    }

    public function enables()
    {
       $contactModel = model('Contact');
        $param = $this->param;
        $data = $contactModel->enableDatas($param['ids'], $param['status']);
        if (!$data) {
            return resultArray(['error' => $contactModel->getError()]);
        }
        return resultArray(['data' => '操作成功']);
    }

}
