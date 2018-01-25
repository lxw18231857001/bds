<?php
// +----------------------------------------------------------------------
// | Description: 服务
// +----------------------------------------------------------------------
// | Author: linchuangbin <linchuangbin@honraytech.com>
// +----------------------------------------------------------------------

namespace app\admin\model;

use app\admin\model\Common;

class News extends Common
{

    /**
     * 为了数据库的整洁，同时又不影响Model和Controller的名称
     * 我们约定每个模块的数据表都加上相同的前缀，比如微信模块用weixin作为数据表前缀
     */
    protected $name = 'news';
    protected $dateFormat = 'Y-m-d';
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
//    public function getDataList()
//    {
//
//        $data = $this
//            ->alias('news')
//            ->where($map)
//            ->join('__ADMIN_MENU__ am','news.pid = am.id')
//            ->field('news.*,am.title as am_title')
//            ->order(['order'])
//            ->select();
//
//        return $data;
//    }
    public function getDataList($keywords,$page,$limit)
    {
        $map = [];
        if ($keywords) {
            $map['news.title'] = ['like', '%'.$keywords.'%'];
        }
        $dataCount = $this->alias('news')->where($map)->count('id');
        $list = $this
            ->alias('news')
            ->where($map)
            ->join('__ADMIN_MENU__ am','news.pid = am.id');

//        echo $list->getLastSql();
//        dump($list);
        // 若有分页
        if ($page && $limit) {
            $list = $list->page($page, $limit);
        }
        $list=$list
            ->field('news.*,am.title as am_title')
            ->order(['order'])
            ->select();
        $data['list'] = $list;
        $data['dataCount'] = $dataCount;

        return $data;
    }

}