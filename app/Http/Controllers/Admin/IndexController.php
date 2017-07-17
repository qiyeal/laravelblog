<?php

namespace App\Http\Controllers\Admin;

use App\Http\Model\User;
use Illuminate\Http\Request;
use App\Http\Requests;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Validator;

class IndexController extends CommonController
{
    public function index()
    {
        $session = session('user');
        $user_name = $session['user_name'];
        return view('admin.index',compact('user_name'));
    }

    public function info()
    {
        return view('admin.info');
    }

    //修改管理员密码
    public function pass()
    {
        if ($input = Input::all()) {
            $rules = [
                'password' => 'required | between:6,20 | confirmed',

            ];
            $message = [
                'password.required' => '新密码不能为空',
                'password.between' => '新密码必须6-20位',
                'password.confirmed' => '新密码和确认密码不一致',
            ];
            $v = Validator::make($input, $rules, $message);
            if ($v->passes()) {
                $user = session('user');
                $user_name = $user['user_name'];
                $user_pass = $user['user_pass'];
                $userObj = User::where('user_name', $user_name)->get();
                if (Hash::check($input['password_o'], $user_pass)) {
                    $newPass = Hash::make($input['password']);
                    $num = $userObj = User::where('user_name', $user_name)->update(
                        ['user_pass' => $newPass]
                    );
                    $errors = '密码修改成功';
                    return back()->withErrors(compact('errors'));
                } else {
                    $errors = '原密码错误';
                    return back()->withErrors(compact('errors'));
                }
            } else {
                return back()->withErrors($v);
            }
        } else {
            return view('admin.pass');
        }
    }
}
