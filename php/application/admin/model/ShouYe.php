<?php
// +----------------------------------------------------------------------
// | Description: 服务
// +----------------------------------------------------------------------
// | Author: linchuangbin <linchuangbin@honraytech.com>
// +----------------------------------------------------------------------

namespace app\admin\model;

use app\admin\model\Common;

class ShouYe extends Common
{

    /**
     * 为了数据库的整洁，同时又不影响Model和Controller的名称
     * 我们约定每个模块的数据表都加上相同的前缀，比如微信模块用weixin作为数据表前缀
     */
    protected $name       = 'ShouYe';
    protected $dateFormat = 'Y-m-d H:i';
    protected $type       = [ 'create_time'    =>'datetime',  ];


//    protected $createTime = 'create_time';
//    protected $updateTime = false;
//    protected $autoWriteTimestamp = true;


    /**
     * [getDataList 获取列表]
     * @linchuangbin
     * @DateTime  2017-02-10T21:07:18+0800
     * @return    [array]
     */
    public function getDataList()
    {

        $data = $this
            ->alias('ShouYe')
            ->join('__ADMIN_MENU__ am','ShouYe.pid = am.id')
            ->field('ShouYe.*,am.title as am_title')
            ->order(['order'])
            ->select();

        $res=$this->where(['pid'=>0])->order(['order'])->select();
        foreach ($res as $vv){
            $vv['am_title']='首页背景图';
            $data[]=$vv;
        }
        return $data;
    }
}