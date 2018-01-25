<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/11/28
 * Time: 16:17
 */

namespace app\home\controller;
//use app\common\controller\Common;
use think\Request;
use think\Controller;
use think\Log;
use think\Db;
class Base extends controller
{
    // 初始化
    public $param;
    public  function _initialize()
    {

        parent::_initialize();
        /*防止跨域*/
        header('Access-Control-Allow-Origin: '.$_SERVER['HTTP_ORIGIN']);
        header('Access-Control-Allow-Credentials: true');
        header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
        header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept, authKey, sessionId");

        $header=$this->request->domain();
        if($header == ALLOW_IP) {
            $param =  Request::instance()->param();
            $this->param = $param;
        }else{
           $ip= Request::instance()->ip();
            $msg=$ip."这是非法访问的IP";
            Log::write($msg,'notice');
            exit(json_encode(['code'=>403, 'error'=>'非法访问']));
            exit;
        }
    }

//    //获得二级页面的banner
    public  function getBanner($pid,$field)
        {
            $data=DB::name('shou_ye')->field($field)->where(['pid'=>$pid])->select();
            return $data;
        }

// miss 路由：处理没有匹配到的路由规则
    public function miss()
    {
        if (Request::instance()->isOptions()) {
            return router_error;
        } else {
            echo 'Home/base/miss接口';
        }

    }

//    const TOKEN = 'API';
//
//    //响应前台的请求
//    public function respond(){
//        //验证身份
//        $timeStamp = $_GET['t'];
//        $randomStr = $_GET['r'];
//        $signature = $_GET['s'];
//        $str = $this -> arithmetic($timeStamp,$randomStr);
//        if($str != $signature){
//            echo "-1";
//            exit;
//        }
//    }

                    /**
        * @param $timeStamp 时间戳
        * @param $randomStr 随机字符串
        * @return string 返回签名
        */
            //    public function arithmetic($timeStamp,$randomStr){
            //        $arr['timeStamp'] = $timeStamp;
            //        $arr['randomStr'] = $randomStr;
            //        $arr['token'] = self::TOKEN;
            //        //按照首字母大小写顺序排序
            //        sort($arr,SORT_STRING);
            //        //拼接成字符串
            //        $str = implode($arr);
            //        //进行加密
            //        $signature = sha1($str);
            //        $signature = md5($signature);
            //        //转换成大写
            //        $signature = strtoupper($signature);
            //        return $signature;
            //    }
}