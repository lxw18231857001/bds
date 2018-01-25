<?php
// +----------------------------------------------------------------------
// | Description: 服务
// +----------------------------------------------------------------------
// | Author: linchuangbin <linchuangbin@honraytech.com>
// +----------------------------------------------------------------------

namespace app\admin\model;

use app\admin\model\Common;

class Brand extends Common
{
    protected $name = 'Brand';
    protected $dateFormat = 'Y-m-d H:i';
    protected $type       = [ 'create_time'    =>'datetime',  ];

    /**
     * [getDataList 获取列表]
     * @linchuangbin
     * @DateTime  2017-02-10T21:07:18+0800
     * @return    [array]
     */
    public function getDataList( )
    {
        $data = $this
           ->alias('brand')
            ->join('__ADMIN_MENU__ am','brand.pid = am.id')
            ->field('brand.*,am.title as am_title')
            ->order(['order'])
            ->select();
//        dump($data);
        return $data;
    }

    //品牌分类
    public function getTypeList()
    {
        $data=$this->name("admin_menu")->where(['pid'=>65])->select();
        return $data;
    }

}