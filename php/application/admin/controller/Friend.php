<?php
// +----------------------------------------------------------------------
// | Description: 友情链接设置
// +----------------------------------------------------------------------
// | Author: linchuangbin <linchuangbin@honraytech.com>
// +----------------------------------------------------------------------

namespace app\admin\controller;

class Friend extends ApiCommon
{
    //get:获取友情链接列表
    public function index()
    {
       $friendModel = model('Friend');
        $param = $this->param;
        $keywords = !empty($param['keywords']) ? $param['keywords']: '';
        $page = !empty($param['page']) ? $param['page']: '';
        $limit = !empty($param['limit']) ? $param['limit']: '';
        $data =$friendModel->getDataList($keywords, $page, $limit);
        return resultArray(['data' => $data]);
    }

    //get: 通过ID获取友情链接的详细信息
    public function read()
    {
       $friendModel = model('Friend');
        $param = $this->param;
        $data =$friendModel->getDataById($param['id']);
        if (!$data) {
            return resultArray(['error' =>$friendModel->getError()]);
        }
        return resultArray(['data' => $data]);
    }

    //post:添加友情链接
    public function save()
    {
       $friendModel = model('Friend');
        $param = $this->param;
        $data =$friendModel->createData($param);
        if (!$data) {
            return resultArray(['error' =>$friendModel->getError()]);
        }
        return resultArray(['data' => '添加成功']);
    }

    //put:() 修改友情链接
    public function update()
    {
       $friendModel = model('Friend');
        $param = $this->param;
        $data =$friendModel->updateDataById($param, $param['id']);
        if (!$data) {
            return resultArray(['error' =>$friendModel->getError()]);
        }
        return resultArray(['data' => '修改成功']);
    }

    //   删除友情链接
    public function delete()
    {
       $friendModel = model('Friend');
        $param = $this->param;
        $data =$friendModel->delDataById($param['id']);
        if (!$data) {
            return resultArray(['error' =>$serviceModel->getError()]);
        }
        return resultArray(['data' => '删除成功']);
    }


    public function deletes()
    {
       $friendModel = model('Friend');
        $param = $this->param;
        $data =$friendModel->delDatas($param['ids']);
        if (!$data) {
            return resultArray(['error' =>$friendModel->getError()]);
        }
        return resultArray(['data' => '删除成功']);
    }

    public function enables()
    {
       $friendModel = model('Friend');
        $param = $this->param;
        $data =$friendModel->enableDatas($param['ids'], $param['status']);
        if (!$data) {
            return resultArray(['error' =>$friendModel->getError()]);
        }
        return resultArray(['data' => '操作成功']);
    }

}
