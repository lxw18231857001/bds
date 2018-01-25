<?php
/**
 * Created by PhpStorm.
 * User: lxw
 * Date: 2017/12/8
 * Time: 10:37
 */

namespace app\home\controller;

use think\Db;
use think\Request;
use think\db\Query;
class News extends Base
{
    //观点动态列表
    public function index()
    {
        $newsModel = model('News');
        $param = $this->param;
        $page = !empty($param['page']) ? $param['page'] : '';
        $limit = !empty($param['limit']) ? $param['limit'] : '';
        $pid   =!empty($param['pid'])?$param['pid']:'';
        $data = $newsModel->getDataList($page, $limit,$pid);
        return resultArray(['data' => $data]);
    }

    //banner
    public function newsBanner()
    {
        $pid=67;
        $field=array('id','pid','title','backimage');
        $data=$this->getBanner($pid,$field);
        return resultArray(['data'=>$data]);
    }

    //新闻分类名称
    public function newName()
    {
        $newList= Db::name('admin_menu')
            ->field(['id','pid','title','en_title','url','nav','icon'])
            ->order(['sort'])
            ->where(['pid'=>67])
            ->select();
        return resultArray(['data' => $newList]);
    }
    //新闻详情
    public function newsDetails()
    {
        $param=$this->param;
        $data=Db::name('news')
            ->where(['pid'=>$param['pid']])
            ->where(['id'=>$param['id']])
            ->field(['listpic','order','status'],true)
            ->find();
        if ($data) \db('news')->where(['id'=>$param['id']])->update(['read_num'=>['exp','read_num+1']]);
        return resultArray(['data'=>$data]);
    }
    //    上一篇下一篇(同一个分类下,先确定该分类的pid)
    public function frontAfter()
    {
        $param=$this->param;
        $front=Db::name('news')->where(['pid'=>$param['pid']])->where('id','<',$param['id'])->field(['id','pid'])->order(['id'=>'desc'])->find();
        $after=Db::name('news')->where(['pid'=>$param['pid']])->where('id','>',$param['id'])->field(['id','pid'])->order(['id'=>'asc'])->find();
        $front=empty($front)?'null':$front['id'];
        $after=empty($after)?'null':$after['id'];
        $data=[$front,$after];
        return resultArray(['data'=>$data]);
    }

    public function fenye()
    {
        $param=$this->param;
////        dump($param);
        $front=Db::name('news')->where(['pid'=>$param['pid']])->where('id','<',$param['id'])->order(['id'=>'desc'])->find();
        $after=Db::name('news')->where(['pid'=>$param['pid']])->where('id','>',$param['id'])->order(['id'=>'asc'])->find();
//        echo Db::name('news')->getLastSql();

        dump($front);
        dump($after);

        $f_url= $front['id'];
        $a_url=$after['id'];
        $front=empty($front)?'没有了':$front;
        $after=empty($after)?'没有了':$after;

        $this->assign('front',$front);
        $this->assign('after',$after);

        $this->assign('f_url',$f_url);
        $this->assign('a_url',$a_url);
        return $this->fetch('index');
    }

    public function explain()
    {
//        $mysql_server="localhost";
//        $mysql_username="root";
//        $mysql_password="root";
//        $mysql_database="bds";
//        $conn = mysql_connect($mysql_server,$mysql_username,$mysql_password) or die("数据库链接错误");
//        mysql_select_db($mysql_database,$conn);
//        mysql_query("set names 'utf8'");
//            $result=mysql_query("   SELECT * FROM bds_news");
//           $row=mysql_fetch_array($result,MYSQL_ASSOC);//MYSQL_NUM
//           dump($row);
//        $dsn='mysql:host='.$mysql_server.';dbname='.$mysql_database.';';
//        $dbh=new \PDO($dsn,$mysql_username,$mysql_password);
//        $stmt=$dbh->query(' explain SELECT * FROM bds_product');
//        $row=$stmt->fetch();
//    dump($row);

        $con = mysql_connect("localhost", "root", "root");
        if (!$con)
        {
            die('Could not connect: ' . mysql_error());
        }

         mysql_select_db("bds",$con);
        $sql = "SELECT * FROM bds_product";
        $result = mysql_query($sql,$con);
       var_dump(mysql_fetch_array($result,MYSQL_ASSOC));

        mysql_close($con);


    }
}