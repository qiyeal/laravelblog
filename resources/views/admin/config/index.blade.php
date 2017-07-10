@extends('layouts.admin')
@section('content')
    <!--面包屑配置项 开始-->
    <div class="crumb_warp">
        <!--<i class="fa fa-bell"></i> 欢迎使用登陆网站后台，建站的首选工具。-->
        <i class="fa fa-home"></i> <a href="{{url('admin/info')}}">首页</a> &raquo; 配置项管理
    </div>
    <!--面包屑配置项 结束-->

    <!--搜索结果页面 列表 开始-->
    <div class="result_wrap">
        <div class="result_title">
            <h3>配置项列表</h3>
            @if(count($errors)>0)
                <div class="mark">
                    @foreach($errors->all() as $error)
                        <p>{{$error}}</p>
                    @endforeach
                </div>
            @endif
        </div>
        <!--快捷配置项 开始-->
        <div class="result_content">
            <div class="short_wrap">
                <a href="{{url('admin/config/create')}}"><i class="fa fa-plus"></i>添加配置项</a>
                <a href="{{url('admin/config')}}"><i class="fa fa-recycle"></i>全部配置项</a>
            </div>
        </div>
        <!--快捷配置项 结束-->
    </div>

    <div class="result_wrap">
        <div class="result_content">
            <form action="{{url('admin/config/changecontent')}}" method="post">
                {{csrf_field()}}
                <table class="list_tab">
                    <tr>
                        <th class="tc">排序</th>
                        <th class="tc">ID</th>
                        <th>标题</th>
                        <th>名称</th>
                        <th>内容</th>
                        <th>操作</th>
                    </tr>
                    @foreach($data as $v)
                        <tr>
                            <td class="tc">
                                <input type="text" value="{{$v->conf_order}}"
                                       onchange="changeOrder(this, {{$v->id}})">
                            </td>
                            <td class="tc">{{$v->id}}</td>
                            <td>
                                <a href="#">{{$v->conf_title}}</a>
                            </td>
                            <td>{{$v->conf_name}}</td>
                            <td>
                                <input type="hidden" name="id[]" value="{{$v->id}}">
                                {!! $v->_html !!}
                            </td>
                            <td>
                                <a href="{{url('admin/config/'.$v->id.'/edit')}}">修改</a>
                                <a href="javascript:;" onclick="delLinks({{$v->id}})">删除</a>
                            </td>
                        </tr>
                    @endforeach
                </table>
                <div class="btn_group">
                    <input type="submit" value="提交">
                    <input type="button" class="back" onclick="history.go(-1)" value="返回">
                </div>
            </form>
        </div>
    </div>
    <!--搜索结果页面 列表 结束-->

    <script>
        function changeOrder(obj, id) {
            var conf_order = $(obj).val();
            $.post("{{url('admin/config/changeorder')}}", {
                '_token': '{{csrf_token()}}',
                'conf_id': id,
                'conf_order': conf_order
            }, function (data) {
                if (data.status) {
                    layer.msg(data.msg, {icon: 6});
                } else {
                    layer.msg(data.msg, {icon: 5});
                }
            });
        }

        //删除配置项
        function delLinks(id) {
            layer.msg('您确定要删除么？', {
                time: 0 //不自动关闭
                , btn: ['确定', '取消']
                , yes: function (index) {
                    $.post("{{'config/'}}" + id, {
                        '_method': 'delete',
                        '_token': "{{csrf_token()}}"
                    }, function (data) {
                        if (data.status) {
                            layer.close(index);
                            layer.msg(data.msg, {icon: 6});
                            location.href = location.href;
                        } else {
                            layer.msg(data.msg, {icon: 5});
                        }
                    });
                }
            });
        }
    </script>

@endsection
