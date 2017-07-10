<?php

namespace App\Http\Controllers\Admin;

use App\Http\Model\Category;
use App\Http\Model\User;
use Illuminate\Http\Request;
use App\Http\Requests;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Validator;

class CategoryController extends CommonController
{
    //get过来的admin/category
    //全部分类
    public function index()
    {
        $data = (new Category)->tree();
        return view('admin.category.index')->with('data', $data);
    }

    public function changeOrder()
    {
        $input = Input::all();
        $cate = Category::find($input['cate_id']);
        $cate->cate_order = $input['cate_order'];
        $re = $cate->update();
        if ($re) {
            $data = [
                'status' => 1,
                'msg' => '分类排序更新成功！'
            ];
        } else {
            $data = [
                'status' => 0,
                'msg' => '分类排序更新失败！'
            ];
        }
        return $data;
    }

    //get过来的admin/category/create
    //添加分类
    public function create()
    {
        $data = Category::where('cate_pid', 0)->get();
        return view('admin.category.add')->with('data', $data);
    }

    //post过来的admin/category
    //添加分类提交
    public function store()
    {
        $input = Input::except('_token');
        $rules = [
            'cate_name' => 'required',
        ];
        $message = [
            'cate_name.required' => '分类名称不能为空',
        ];
        $v = Validator::make($input, $rules, $message);
        if ($v->passes()) {
            $re = Category::create($input);
            if ($re) {
                return redirect('admin/category');
            } else {
                $errors = '未知错误，请重试';
                return back()->withErrors(compact('errors'));
            }
        } else {
            return back()->withErrors($v);
        }
    }

    //get过来的admin/category/{category}/edit
    //编辑分类
    public function edit($id)
    {
        $field = Category::find($id);
        $data = Category::where('cate_pid', 0)->get();
        return view('admin.category.edit', compact('field', 'data'));
    }

    //put过来的admin/category/{category}
    //更新分类
    public function update($id)
    {
        $input = Input::except('_token', '_method');
        $re = Category::where('id', $id)->update($input);
        if ($re) {
            return redirect('admin/category');
        } else {
            $errors = '分类信息更新失败，请重试';
            return back()->withErrors(compact('errors'));
        }
    }

    //get过来的admin/category/{category}
    //显示单个分类信息
    public function show()
    {

    }

    //delete过来的admin/category/{category}
    //删除单个分类
    public function destroy($id)
    {
        $re = Category::where('id', $id)->delete();
        Category::where('cate_pid', $id)->update(['cate_pid' => 0]);
        if ($re) {
            $data = [
                'status' => 1,
                'msg' => '分类删除成功'
            ];
        } else {
            $data = [
                'status' => 0,
                'msg' => '分类删除失败'
            ];
        }
        return $data;
    }
}
