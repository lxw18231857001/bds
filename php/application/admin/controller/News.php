<?php
// +----------------------------------------------------------------------
// | Description: 新闻设置
// +----------------------------------------------------------------------
// | Author: linchuangbin <linchuangbin@honraytech.com>
// +----------------------------------------------------------------------

namespace app\admin\controller;
use think\Db;
class News extends ApiCommon
{
    //get:获取新闻列表
    public function index()
    {
       $newsModel = model('News');
        $param = $this->param;
        $keywords = !empty($param['keywords']) ? $param['keywords']: '';
        $page = !empty($param['page']) ? $param['page']: '';
        $limit = !empty($param['limit']) ? $param['limit']: '';
        $data =$newsModel->getDataList($keywords, $page, $limit);
        return resultArray(['data' => $data]);
    }

    //get:获取分类
    public function newType()
    {
        $data=DB::name("admin_menu")->where(['pid'=>67])->select();
        return resultArray(['data' => $data]);
    }
    //get: 通过ID获取新闻的详细信息
    public function read()
    {
       $newsModel = model('News');
        $param = $this->param;
        $data =$newsModel->getDataById($param['id']);
        if (!$data) {
            return resultArray(['error' =>$newsModel->getError()]);
        }
        return resultArray(['data' => $data]);
    }

    //post:添加新闻
    public function save()
    {
       $newsModel = model('News');
        $param = $this->param;
        if($param['listpic']){
            $param['listpic']=addSeverPath($param['listpic']);
        }else{
            $param['listpic']= '';
        }
        $data =$newsModel->createData($param);
        if (!$data) {
            return resultArray(['error' =>$newsModel->getError()]);
        }
        return resultArray(['data' => '添加成功']);
    }

    //put:() 修改新闻
    public function update()
    {
       $newsModel = model('News');
        $param = $this->param;
        $str=substr($param['listpic'],0,7);
        if($str=='uploads'){
            $param['listpic']=addSeverPath($param['listpic']);
        }
        $data =$newsModel->updateDataById($param, $param['id']);
        if (!$data) {
            return resultArray(['error' =>$newsModel->getError()]);
        }
        return resultArray(['data' => '修改成功']);
    }

    //   删除新闻
    public function delete()
    {
       $newsModel = model('News');
        $param = $this->param;
        $data =$newsModel->delDataById($param['id']);
        if (!$data) {
            return resultArray(['error' =>$serviceModel->getError()]);
        }
        return resultArray(['data' => '删除成功']);
    }


    public function deletes()
    {
       $newsModel = model('News');
        $param = $this->param;
        $data =$newsModel->delDatas($param['ids']);
        if (!$data) {
            return resultArray(['error' =>$newsModel->getError()]);
        }
        return resultArray(['data' => '删除成功']);
    }

    public function enables()
    {
       $newsModel = model('News');
        $param = $this->param;
        $data =$newsModel->enableDatas($param['ids'], $param['status']);
        if (!$data) {
            return resultArray(['error' =>$newsModel->getError()]);
        }
        return resultArray(['data' => '操作成功']);
    }

}
