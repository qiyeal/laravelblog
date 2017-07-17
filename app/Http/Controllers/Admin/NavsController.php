<?php

namespace App\Http\Controllers\Admin;

use App\Http\Model\Navs;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Validator;

class NavsController extends CommonController
{
    //get过来的admin/navs
    //全部自定义导航列表
    public function index()
    {
        $data = Navs::orderBy('nav_order')->get();
        return view('admin.navs.index', compact('data'));
    }

    public function changeOrder()
    {
        $input = Input::all();
        $navs = Navs::find($input['nav_id']);
        $navs->nav_order = $input['nav_order'];
        $re = $navs->update();
        if ($re) {
            $data = [
                'status' => 1,
                'msg' => '自定义导航排序更新成功！'
            ];
        } else {
            $data = [
                'status' => 0,
                'msg' => '自定义导航排序更新失败！'
            ];
        }
        return $data;
    }

    //get过来的admin/navs/{navs}
    //显示单个自定义导航信息
    public function show()
    {

    }

    //get过来的admin/navs/create
    //添加自定义导航
    public function create()
    {
        return view('admin.navs.add');
    }

    //post过来的admin/navs
    //添加自定义导航提交
    public function store()
    {
        $input = Input::except('_token');
        $rules = [
            'nav_name' => 'required',
            'nav_url' => 'required',
        ];
        $message = [
            'nav_name.required' => '自定义导航名称不能为空',
            'nav_url.required' => '自定义导航地址不能为空',
        ];
        $v = Validator::make($input, $rules, $message);
        if ($v->passes()) {
            $re = Navs::create($input);
            if ($re) {
                return redirect('admin/navs');
            } else {
                $errors = '未知错误，请重试';
                return back()->withErrors(compact('errors'));
            }
        } else {
            return back()->withErrors($v);
        }
    }

    //get过来的admin/navs/{navs}/edit
    //编辑自定义导航
    public function edit($id)
    {
        $field = Navs::find($id);
        return view('admin.navs.edit', compact('field'));
    }

    //put过来的admin/navs/{navs}
    //更新自定义导航
    public function update($id)
    {
        $input = Input::except('_token', '_method');
        $re = Navs::where('id', $id)->update($input);
        if ($re) {
            return redirect('admin/navs');
        } else {
            $errors = '自定义导航信息更新失败，请重试';
            return back()->withErrors(compact('errors'));
        }
    }

    //delete过来的admin/navs/{navs}
    //删除单个自定义导航
    public function destroy($id)
    {
        $re = Navs::where('id', $id)->delete();
        if ($re) {
            $data = [
                'status' => 1,
                'msg' => '自定义导航删除成功'
            ];
        } else {
            $data = [
                'status' => 0,
                'msg' => '自定义导航删除失败'
            ];
        }
        return $data;
    }
}
