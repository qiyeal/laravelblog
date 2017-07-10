<?php

namespace App\Http\Controllers\Admin;

use App\Http\Model\User;
use Illuminate\Http\Request;
use App\Http\Requests;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Input;

class LoginController extends CommonController
{
    public function login()
    {
        if ($input = Input::all()) {
            $code = new \Code;
            $_code = $code->get();
            if(strtolower($input['code']) != strtolower($_code)){
                return view('admin.login')->with('msg', '验证码错误');
            }
            $users = User::where('user_name', $input['user_name'])->get();
            $user = $users->toArray();
            if(empty($user)){
                return view('admin.login')->with('msg', '用户名或密码错误');
            }else{
                if (Hash::check($input['user_pass'], $user[0]['user_pass'])) {
                    session(['user' => $user[0]]);
                    return redirect('admin/index');
                }else{
                    return view('admin.login')->with('msg', '用户名或密码错误');
                }
            }
        } else {
            return view('admin.login');
        }
    }

    public function quit()
    {
        session(['user'=>null]);
        return redirect('admin/login');
    }

    public function code()
    {
        $code = new \Code;
        $code->make();
    }

    public function getcode()
    {
        $code = new \Code;
        echo $code->get();
    }

}
