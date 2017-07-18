@extends("layouts.weixin")
@section("content")
<div class="wrapper">
    <div class="breadcrumbs" id="breadcrumbs">
        <ol class="breadcrumb">
            <li><a href=""><i class="fa fa-home"></i>首页>>编辑文本回复</a></li>
        </ol>
    </div>
    <section class="content">
    <!-- Main content -->
    <!--<div class="container-fluid">-->
    <div class="row">
        <div class="panel panel-default">
            <div class="panel-heading row">
                <div class="pull-right">
                    <a href="javascript:history.go(-1)" data-toggle="tooltip" title="" class="btn btn-default" data-original-title="返回"><i class="fa fa-reply"></i></a>
                </div>
            </div>

        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title text-center">编辑文本回复</h3>
            </div>
            <div class="panel-body">
                <form action="{{url('weixin/text/edit')}}" method="post">
                    {{csrf_field()}}
                    <input type="hidden" name="text_id" value="{{$text->text_id}}">
                    <table class="table table-bordered">
                        <tbody>
                        <tr>
                            <div class="row">
                                <td class="text-right col-sm-2">关键词：</td>
                                <td colspan="3">
                                    <input type="text" name="keyword" value="{{$text->keyword}}" placeholder="请输入回复内容">
                                </td>
                            </div>
                        </tr>
                        <tr>
                            <div class="row">
                                <td class="text-right col-sm-2">回复内容：</td>
                                <td colspan="3">
                                    <textarea name="text" placeholder="请输入回复内容" rows="3" class="form-control">{{$text->text}}</textarea>
                                </td>
                            </div>
                        </tr>
                        <tr>
                            <div class="row">
                                <td class="text-right col-sm-2"></td>
                                <td colspan="3">
                                    <div class="form-group">
                                        <button class="btn btn-default" type="submit" id="cancel">保存</button>
                                    </div>
                                </td>
                            </div>
                        </tr>
                        </tbody>
                    </table>

                </form>

            </div>
        </div>


    </div>    <!-- /.content -->
        </section>
</div>
@endsection
