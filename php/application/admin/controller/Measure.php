<?php
// +----------------------------------------------------------------------
// | Description: 组织架构
// +----------------------------------------------------------------------
// | Author: linchuangbin <linchuangbin@honraytech.com>
// +----------------------------------------------------------------------

namespace app\admin\controller;

class Measure extends ApiCommon
{

    public function index()
    {
        $measureModel = model('Measure');
        $data = $measureModel->getDataList();
        return resultArray(['data' => $data]);
    }

//    public function read()
//    {
//        $measureModel = model('Measure');
//        $param = $this->param;
//        $data = $measureModel->getDataById($param['id']);
//        if (!$data) {
//            return resultArray(['error' => $measureModel->getError()]);
//        }
//        return resultArray(['data' => $data]);
//    }
//
//    public function save()
//    {
//        $measureModel = model('Measure');
//        $param = $this->param;
//        $data = $measureModel->createData($param);
//        if (!$data) {
//            return resultArray(['error' => $measureModel->getError()]);
//        }
//        return resultArray(['data' => '添加成功']);
//    }

//    public function update()
//    {
//        $measureModel = model('Measure');
//        $param = $this->param;
//        $data = $measureModel->updateDataById($param, $param['id']);
//        if (!$data) {
//            return resultArray(['error' => $measureModel->getError()]);
//        }
//        return resultArray(['data' => '编辑成功']);
//    }
    //public function delDataById($id = '', $delSon = false)中第二个参数，若没有子孙则应设为false(默认)
    public function delete()
    {
        $measureModel = model('Measure');
        $param = $this->param;
        $data = $measureModel->delDataById($param['id'],false);
        if (!$data) {
            return resultArray(['error' => $measureModel->getError()]);
        }
        return resultArray(['data' => '删除成功']);
    }

    public function deletes()
    {
        $measureModel = model('Measure');
        $param = $this->param;
        $data = $measureModel->delDatas($param['ids'], false);
        if (!$data) {
            return resultArray(['error' => $measureModel->getError()]);
        }
        return resultArray(['data' => '删除成功']);
    }

    public function enables()
    {
        $measureModel = model('Measure');
        $param = $this->param;
        $data = $measureModel->enableDatas($param['ids'], $param['status'], true);
        if (!$data) {
            return resultArray(['error' => $measureModel->getError()]);
        }
        return resultArray(['data' => '操作成功']);
    }
}
 