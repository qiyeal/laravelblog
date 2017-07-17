<?php

namespace App\Http\Controllers\Admin;

use App\Http\Model\Links;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Validator;

class LinksController extends CommonController
{
    //get过来的admin/links
    //全部友情链接列表
    public function index()
    {
        $data = Links::orderBy('link_order')->get();
        return view('admin.links.index', compact('data'));
    }

    public function changeOrder()
    {
        $input = Input::all();
        $links = Links::find($input['link_id']);
        $links->link_order = $input['link_order'];
        $re = $links->update();
        if ($re) {
            $data = [
                'status' => 1,
                'msg' => '友情链接排序更新成功！'
            ];
        } else {
            $data = [
                'status' => 0,
                'msg' => '友情链接排序更新失败！'
            ];
        }
        return $data;
    }

    //get过来的admin/links/{links}
    //显示单个友情链接信息
    public function show()
    {

    }

    //get过来的admin/links/create
    //添加友情链接
    public function create()
    {
        return view('admin.links.add');
    }

    //post过来的admin/links
    //添加友情链接提交
    public function store()
    {
        $input = Input::except('_token');
        $rules = [
            'link_name' => 'required',
            'link_url' => 'required',
        ];
        $message = [
            'link_name.required' => '友情链接名称不能为空',
            'link_url.required' => '友情链接地址不能为空',
        ];
        $v = Validator::make($input, $rules, $message);
        if ($v->passes()) {
            $re = Links::create($input);
            if ($re) {
                return redirect('admin/links');
            } else {
                $errors = '未知错误，请重试';
                return back()->withErrors(compact('errors'));
            }
        } else {
            return back()->withErrors($v);
        }
    }

    //get过来的admin/links/{links}/edit
    //编辑友情链接
    public function edit($id)
    {
        $field = Links::find($id);
        return view('admin.links.edit', compact('field'));
    }

    //put过来的admin/links/{links}
    //更新友情链接
    public function update($id)
    {
        $input = Input::except('_token', '_method');
        $re = Links::where('id', $id)->update($input);
        if ($re) {
            return redirect('admin/links');
        } else {
            $errors = '友情链接信息更新失败，请重试';
            return back()->withErrors(compact('errors'));
        }
    }

    //delete过来的admin/links/{links}
    //删除单个友情链接
    public function destroy($id)
    {
        $re = Links::where('id', $id)->delete();
        if ($re) {
            $data = [
                'status' => 1,
                'msg' => '友情链接删除成功'
            ];
        } else {
            $data = [
                'status' => 0,
                'msg' => '友情链接删除失败'
            ];
        }
        return $data;
    }
}
