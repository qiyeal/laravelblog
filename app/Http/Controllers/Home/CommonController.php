<?php

namespace App\Http\Controllers\Home;

use App\Http\Model\Article;
use App\Http\Model\Config;
use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Http\Model\Navs;
use Illuminate\Support\Facades\View;

class CommonController extends Controller
{
    public function __construct()
    {
        //点击量最高的5篇文章（排行榜）
        $hot = Article::orderBy('art_view', 'desc')->take(5)->get();

        //最新发布文章8篇
        $new = Article::orderBy('art_time', 'desc')->take(8)->get();

        $navs = Navs::orderBy('nav_order')->get();
        View::share('navs', $navs);
        View::share('hot', $hot);
        View::share('new', $new);
    }
}
