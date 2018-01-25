<?php
// +----------------------------------------------------------------------
// | Description: 服务
// +----------------------------------------------------------------------
// | Author: linchuangbin <linchuangbin@honraytech.com>
// +----------------------------------------------------------------------

namespace app\admin\model;

use app\admin\model\Common;

class Product extends Common
{

    /**
     * 为了数据库的整洁，同时又不影响Model和Controller的名称
     * 我们约定每个模块的数据表都加上相同的前缀，比如微信模块用weixin作为数据表前缀
     */
    protected $name = 'product';
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
            ->alias('product')
            ->join('__ADMIN_MENU__ am','product.pid = am.id')
            ->field('product.*,am.title as am_title')
            ->order(['order'])
            ->select();
        return $data;
    }

    public function getTypeList()
    {
        $data=$this->name("admin_menu")->where(['pid'=>64])->select();
        return $data;
    }



}