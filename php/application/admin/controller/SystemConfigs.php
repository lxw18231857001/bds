<?php
// +----------------------------------------------------------------------
// | Description: 系统配置
// +----------------------------------------------------------------------
// | Author: linchuangbin <linchuangbin@honraytech.com>
// +----------------------------------------------------------------------

namespace app\admin\controller;

class SystemConfigs extends ApiCommon
{
    //get: 获取系统基本信息
    public function read()
    {
        $configModel = model('SystemConfig');
        $param = $this->param;
        $data = $configModel->getDataList($param);
        if (!$data) {
            return resultArray(['error' => $configModel->getError()]);
        }
        return resultArray(['data' => $data]);
    }

    //post: 添加系统信息
    public function save()
    {
        $configModel = model('SystemConfig');
        $param = $this->param;
//        dump($param);
        // 给SYSTEM_LOGO添加上服务器（域名）地址
        $str=substr($param['SYSTEM_LOGO'],0,7);
        if($str=='uploads'){
            $param['SYSTEM_LOGO']=addSeverPath($param['SYSTEM_LOGO']);
        }
        $str2=substr($param['SYSTEM_LOGO_M'],0,7);
        if($str2=='uploads'){
            $param['SYSTEM_LOGO_M']=addSeverPath($param['SYSTEM_LOGO_M']);
        }
//        dump($param);die;
        $data = $configModel->createData($param);
        if (!$data) {
            return resultArray(['error' => $configModel->getError()]);
        } 
        return resultArray(['data' => '添加成功']);
    }
}
 