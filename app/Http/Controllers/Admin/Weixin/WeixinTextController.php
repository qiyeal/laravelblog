<?php

namespace App\Http\Controllers\Admin\Weixin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Requests;
use App\Http\Controllers\Controller;

class WeixinTextController extends Controller
{

    /**
     * 文本消息展示
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index()
    {
        $text = DB::table("wx_text")->get();
        return view("admin.weichat.text", compact("text"));
    }


    /**
     * 添加文本消息
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View|void
     */
    public function addText(Request $request)
    {
        if($request->isMethod("post")){
            $all = $request->except("_token");
            DB::table("wx_text")->insert($all);
            return redirect("admin/text");
        }
        return view("admin.weichat.add_text");

    }

    /**
     * 文本消息编辑
     * @param Request $request
     * @return
     */
    public function edit(Request $request)
    {
        if($request->isMethod("post")){

            $edit = $request->except("_token");
            DB::table("wx_text")->where("text_id",$edit["text_id"])->update($edit);
            return redirect("admin/text");
        }

        $id = $request->text_id;
        $text = DB::table("wx_text")->where("text_id", $id)->first();
        return view("admin.weichat.edit_text", compact("text"));
    }

    /**
     * 删除文本消息
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function del(Request $request)
    {
        $id = $id = $request->text_id;
        DB::table("wx_text")->where("text_id", $id)->delete();
        return redirect("admin/text");
    }

}
