<?php
/**
 * Created by PhpStorm.
 * User: lxw
 * Date: 2017/11/29
 * Time: 16:29
 */

namespace app\home\controller;
use app\home\model\Order;
use think\Db;
use think\Request;
use think\Validate;
class Service extends Base
{
    //获取分类导航
    public function index()
    {
        $data= Db::name('admin_menu')->where(['pid'=>66])->field(['id','pid','title','url','nav'])->select();
        return resultArray(['data' => $data]);
    }

    //banner
    public function serviceBanner()
    {
        $pid=66;
        $field=array('id','pid','title','backimage');
        $data=$this->getBanner($pid,$field);
        return resultArray(['data'=>$data]);
    }
    //学院
    public function serviceSchool()
    {
        $data=Db::name('service')->field(['banner','create_time','order','vice_title'],true)->where(['group'=>88])->select();
        return resultArray(['data' => $data]);
    }
    //定制服务
    public function customized()
    {
        $data=Db::name('service')->field(['banner','create_time','order','content'],true)->where(['group'=>90])->select();
        return resultArray(['data' => $data]);
    }  
    //预约测量
    public function measure()
    {
        $request = Request::instance();
        $data=$request->param();
//        dump($data);die;
//        $data=array(
//          'name'=>'坎方法坷',
//          'tel'=>182318570301,
//          'address'=>'北京',
//          'ordertime'=>'2017-12-28 11:28'
//        );

        $validate =validate('Service');
        if(!$validate->check($data)){
            return resultArray(['data' => $validate->getError()]);
        }

//        $rule=[
//            'name'=>'require|chs|max:4',
//            'tel'=>['regex'=>'/^((0\d{2,3}-\d{7,8})|(1[3584]\d{9}))$/'],
//            'ordertime'=>'date'
//        ];
//        $field=[
//            'name'=>'名字',
//            'tel'=>'电话',
//            'date'=>'预约时间',
//        ];
//        $validate = new Validate($rule, [] , $field);
//        if (!$validate->check($data)) {
//            return resultArray(['data' => $validate->getError()]);
//        }
        //field过滤非数据表字段
        $res=db('measure')->field('name,tel,address,ordertime')->insert($data);

       if ($res) return resultArray(['data' => '预约成功']);


    }

    //订单查询
    public function search()
    {
        $request = Request::instance();
        $data=$request->param();
//        dump($data);die;
        $order=trim(strip_tags($data['order_id']));
        if($order){
            $res=\db('order')->where(['order_id'=>$order])->find();
            if ($res){
                return resultArray(['data' => '该订单已发货！']);
            } else{
                return resultArray(['data' => '该订单不存在！']);
            }
        }else{
            return resultArray(['data' => '订单号不能为空！']);
        }

//        dump($order);
//        $datas=['order_id'=>$order];
//        $res=db('order')->field('order_id')->insert($datas);
//        if ($res) return resultArray(['data' => '添加成功']);

    }

    //预约测量的表单，后期删除
    public function test()
    {
        return $this->fetch('test',['name'=>'thinkphp']);
    }

    //    获取器
    public function status()
    {
//        $order = Order::get(2);
//        echo $order->status;
        $order = Order::get(2);
        echo $order->status_text;
        dump($order->toArray());
        dump($order->getData());
    }
    //修改器
    public function status2()
    {
        $order=new Order();
//        $order->order_id='thinkphp';
        $order->status ='sdddd';
        $data['order_id']='lxw';
//        $data['status'] ='123';
        $order->save($data);
        echo $order->id.'<br>';
        echo $order->order_id.'<br>';
        echo $order->status.'<br>';
//        echo date('Y-m-d H:i:s',$order->time).'<br>';

    }

    public function status3()
    {
        $order= Db::name('order');
//        $data['status']='44';
//        $res= $order->where(['id'=>3])->save($data);
//        dump($res);
//        $order = Order::find(1);
//        $order->status = 'THINKPHP';
//        $order->save();
//        $res=$order->update(['status' => 'thi3hp','id'=>2]);
//        $res=$order->where(['id'=>2])->setField('status', 'thinkphp');
        $res=$order->where(['id'=>2])->update(['num'=>['exp','num+1']]);
        if ($res)
        {
            $order = Order::find(2);
            $order->status = 'THINKPHP';
             $order->save();
        }
        dump($res);
        echo $order->status.'<br>';
        echo $order->login_ip.'<br>';
    }

}