@extends('layouts.admin')
@section('content')
    <!--面包屑导航 开始-->
    <div class="crumb_warp">
        <!--<i class="fa fa-bell"></i> 欢迎使用登陆网站后台，建站的首选工具。-->
        <i class="fa fa-home"></i> <a href="{{url('admin/info')}}">首页</a> &raquo; 微信管理
    </div>
    <!--面包屑导航 结束-->

    <!--搜索结果页面 列表 开始-->
    <form action="#" method="post">
        <div class="result_wrap">
            <div class="result_title">
                <h3>文章列表</h3>
            </div>
            <!--快捷导航 开始-->
            <div class="result_content">
                <div class="short_wrap">
                    <a href="{{url('admin/weichat')}}"><i class="fa fa-recycle"></i>全部消息</a>
                </div>
            </div>
            <!--快捷导航 结束-->
        </div>

        <div class="result_wrap">
            <div class="result_content">
                <table class="list_tab">
                    <tr>
                        <th class="tc">ID</th>
                        <th>消息类型</th>
                        <th>消息</th>
                        <th>发布时间</th>
                        <th>操作</th>
                    </tr>
                    {{--@foreach($data as $v)--}}
                        <tr>
                            <td class="tc">1</td>
                            <td>文本消息</td>
                            <td>123</td>
                            <td>22</td>
                            <td>
                                <a href="">修改</a>
                            </td>
                        </tr>
                    {{--@endforeach--}}
                </table>

                <div class="page_list">
                    {{--{{$data->links()}}--}}
                </div>
            </div>
        </div>
    </form>
    <!--搜索结果页面 列表 结束-->
    <script>
        //删除分类
        function delArt(id) {
            layer.msg('您确定要删除么？', {
                time: 0 //不自动关闭
                , btn: ['确定', '取消']
                , yes: function (index) {
                    $.post("{{'article/'}}" + id, {
                        '_method': 'delete',
                        '_token': "{{csrf_token()}}"
                    }, function (data) {
                        if(data.status){
                            layer.close(index);
                            layer.msg(data.msg, {icon: 6});
                            location.href = location.href;
                        }else{
                            layer.msg(data.msg, {icon: 5});
                        }
                    });
                }
            });
        }
    </script>
@endsection
