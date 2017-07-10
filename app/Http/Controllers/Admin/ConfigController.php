<?php

namespace App\Http\Controllers\Admin;

use App\Http\Model\Config;
use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Validator;

class ConfigController extends CommonController
{
    //get过来的admin/config
    //全部配置项列表
    public function index()
    {
        $data = Config::orderBy('conf_order')->get();
        foreach ($data as $k => $v) {
            switch ($v->field_type) {
                case 'input':
                    $data[$k]->_html = '<input type="text" class="lg" name="conf_content[]" value="' . $v->conf_content . '">';
                    break;
                case 'textarea':
                    $data[$k]->_html = '<textarea class="lg" name="conf_content[]">' . $v->conf_content . '</textarea>';
                    break;
                case 'radio':
                    //1|开启，0|关闭
                    $arr = explode(',', $v->field_value);
                    $str = '';
                    foreach ($arr as $m => $n) {
                        $r = explode('|', $n);
                        $c = $v->conf_content == $r[0] ? ' checked ' : '';
                        $str .= '<label><input type="radio" name="conf_content[]" value="' . $r[0] . '"' . $c . '>' . $r[1] . '</label>';
                    }
                    $data[$k]->_html = $str;
                    break;
            }
        }
        return view('admin.config.index', compact('data'));
    }

    public function changeOrder()
    {
        $input = Input::all();
        $config = Config::find($input['conf_id']);
        $config->conf_order = $input['conf_order'];
        $re = $config->update();
        if ($re) {
            $data = [
                'status' => 1,
                'msg' => '配置项排序更新成功！'
            ];
        } else {
            $data = [
                'status' => 0,
                'msg' => '配置项排序更新失败！'
            ];
        }
        return $data;
    }

    public function changeContent()
    {
        $input = Input::except('_token');
        foreach ($input['id'] as $k => $v) {
            Config::where('id', $v)->update(['conf_content' => $input['conf_content'][$k]]);
        }
        $this->putFile();
        $errors = '配置项更新成功';
        return back()->withErrors(compact('errors'));
    }

    public function putFile()
    {
        $config = Config::pluck('conf_content', 'conf_name')->all();
        $path = base_path() . '\config\web.php';
        $str = '<?php return '.var_export($config, true).';';
        file_put_contents($path, $str);
    }

    //get过来的admin/config/{config}
    //显示单个配置项信息
    public function show()
    {

    }

    //get过来的admin/config/create
    //添加配置项
    public function create()
    {
        return view('admin.config.add');
    }

    //post过来的admin/config
    //添加配置项提交
    public function store()
    {
        $input = Input::except('_token');
        $rules = [
            'conf_name' => 'required',
            'conf_title' => 'required',
        ];
        $message = [
            'conf_name.required' => '配置项名称不能为空',
            'conf_title.required' => '配置项标题不能为空',
        ];
        $v = Validator::make($input, $rules, $message);
        if ($v->passes()) {
            $re = Config::create($input);
            if ($re) {
                return redirect('admin/config');
            } else {
                $errors = '未知错误，请重试';
                return back()->withErrors(compact('errors'));
            }
        } else {
            return back()->withErrors($v);
        }
    }

    //get过来的admin/config/{config}/edit
    //编辑配置项
    public function edit($id)
    {
        $field = Config::find($id);
        return view('admin.config.edit', compact('field'));
    }

    //put过来的admin/config/{config}
    //更新配置项
    public function update($id)
    {
        $input = Input::except('_token', '_method');
        $re = Config::where('id', $id)->update($input);
        if ($re) {
            $this->putFile();
            return redirect('admin/config');
        } else {
            $errors = '配置项信息更新失败，请重试';
            return back()->withErrors(compact('errors'));
        }
    }

    //delete过来的admin/config/{config}
    //删除单个配置项
    public function destroy($id)
    {
        $re = Config::where('id', $id)->delete();
        if ($re) {
            $this->putFile();
            $data = [
                'status' => 1,
                'msg' => '配置项删除成功'
            ];
        } else {
            $data = [
                'status' => 0,
                'msg' => '配置项删除失败'
            ];
        }
        return $data;
    }
}
