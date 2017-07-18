<?php

namespace App\Http\Controllers\Admin\Weixin;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

class WeixinPicController extends Controller
{
    public function index()
    {
        return view("admin.weichat.picinfo.img");
    }
}
