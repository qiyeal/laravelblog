<?php

namespace App\Http\Controllers\Home;



use App\Http\Model\Article;
use App\Http\Model\Category;
use App\Http\Model\Links;

class IndexController extends CommonController
{
    public function index()
    {
        //点击量最高的6篇文章（站长推荐）
        $pics = Article::orderBy('art_view', 'desc')->take(6)->get();



        //图文列表3篇（带分页）
        $data = Article::orderBy('art_time', 'desc')->paginate(6);

        //友情链接
        $links = Links::orderBy('link_order', 'desc')->get();

        return view('home.index', compact('pics','hot', 'new', 'data', 'links'));
    }

    public function cate($cate_id)
    {
        //图文列表4篇（带分页）
        $data = Article::where('cate_id', $cate_id)->orderBy('art_time', 'desc')->paginate(4);

        //查看次数自增
        Category::where('id', $cate_id)->increment('cate_view');

        //当前分类的子分类
        $submenu = Category::where('cate_pid', $cate_id)->get();

        $field = Category::find($cate_id);
        return view('home.list', compact('field', 'data', 'submenu'));
    }

    public function article($art_id)
    {
        $field = Article::Join('category', 'article.cate_id', '=', 'category.id')->where('article.id', $art_id)->first();

        $article['prev'] = Article::where('id', '<', $art_id)->orderBy('id', 'desc')->first();
        $article['next'] = Article::where('id', '>', $art_id)->orderBy('id', 'asc')->first();

        $data = Article::where('cate_id', $field->cate_id)->orderBy('id', 'desc')->take(6)->get();

        //查看次数自增
        Article::where('id', $art_id)->increment('art_view');

        return view('home.new', compact('field', 'article', 'data'));
    }
}
