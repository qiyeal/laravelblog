<?php

namespace App\Http\Controllers\Admin\Weixin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Requests;

use App\Http\Controllers\Controller;

class WeichatController extends Controller
{
    
    public $appID = "wx73536f1e0f6e29e1";
    public $appSecret = "563bd03d998003ff58795878bf187655";
    public $token = "weixin";



    public function api()
    {
        $this->fileput("123");
        $echostr = $_GET["echostr"];
        // echo $echostr;
        if($this->validEchostr()){
            echo $echostr;
            exit;
         }
    }

    //验证消息的确来自微信服务器
    public function validEchostr()
    {
        $this->fileput("456");
        $signature = $_GET["signature"];
        $time = $_GET["timestamp"];
        $nonce = $_GET["nonce"];
        $token = "weixin";
        //将token、timestamp、nonce三个参数进行字典序排序
        $tmp= array($token, $time, $nonce);
        sort($tmp, SORT_STRING);

        //将 $tmp 三个参数字符串拼接成一个字符串进行sha1加密
        $tmp = sha1(implode($tmp));

        //开发者获得加密后的字符串与signature对比，标识该请求来源于微信
        if($tmp == $signature){
            // $this->fileput("echostr");
            return true;
        }
        return false;
    }




    //将数据写入文件中，用来检查传输的数据
    public function fileput($data)
    {
        file_put_contents("a.txt", $data, FILE_APPEND );
    }
}
