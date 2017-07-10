<?php

namespace App\Http\Controllers\Admin;

use App\Http\Model\Article;
use App\Http\Model\Category;
use Illuminate\Http\Request;

use App\Http\Requests;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Validator;

class ArticleController extends CommonController
{
    //get过来的admin/article
    //全部文章
    public function index()
    {
        $data = Article::orderBy('id', 'desc')->paginate(10);
        return view('admin.article.index', compact('data'));
    }

    //get过来的admin/article/create
    //添加文章
    public function create()
    {
        $data = (new Category)->tree();
        return view('admin.article.add', compact('data'));
    }

    //post过来的admin/article
    //添加文章提交
    public function store()
    {
        $input = Input::except('_token');
        $input['art_time'] = time();
        $rules = [
            'art_title' => 'required',
            'art_content' => 'required',
        ];
        $message = [
            'art_title.required' => '文章名称不能为空',
            'art_content.required' => '文章内容不能为空',
        ];
        $v = Validator::make($input, $rules, $message);
        if ($v->passes()) {
            $re = Article::create($input);
            if ($re) {
                return redirect('admin/article');
            } else {
                $errors = '未知错误，请重试';
                return back()->withErrors(compact('errors'));
            }
        } else {
            return back()->withErrors($v);
        }
    }

    //get过来的admin/article/{article}/edit
    //编辑文章
    public function edit($id)
    {
        $data = (new Category)->tree();
        $field = Article::find($id);
        return view('admin.article.edit', compact('data', 'field'));
    }

    //put过来的admin/article/{article}
    //更新文章
    public function update($id)
    {
        $input = Input::except('_token', '_method');
        $re = Article::where('id', $id)->update($input);
        if ($re) {
            return redirect('admin/article');
        } else {
            $errors = '文章信息更新失败，请重试';
            return back()->withErrors(compact('errors'));
        }
    }

    //delete过来的admin/article/{article}
    //删除单个文章
    public function destroy($id)
    {
        $re = Article::where('id', $id)->delete();
        if ($re) {
            $data = [
                'status' => 1,
                'msg' => '文章删除成功'
            ];
        } else {
            $data = [
                'status' => 0,
                'msg' => '文章删除失败'
            ];
        }
        return $data;
    }
}
