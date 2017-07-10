<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;

class CommonController extends Controller
{
    //图片上传
    public function upload()
    {
        $file = Input::file('Filedata');
        if ($file->isValid()) {
            $extension = $file->getClientOriginalExtension();//上传文件的后缀
            $newName = date('YmdHis') . mt_rand(100, 999) . '.' . $extension;
            $path = $file->move(public_path().'/uploads', $newName);
            $filepath = 'uploads/'.$newName;
            return $filepath;
        }
    }
}
