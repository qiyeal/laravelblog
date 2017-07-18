@extends("layouts.weixin")
@section("content")
<div class="wrapper">
  <!-- Content Header (Page header) -->
    <div class="breadcrumbs" id="breadcrumbs">
        <ol class="breadcrumb">
            <li><a href=""><i class="fa fa-home"></i>首页>>文本回复</a></li>
        </ol>
    </div>
  
  <!-- Main content -->
  <section class="content">
    <div class="container-fluid">
      <div class="panel panel-default">
        <div class="panel-heading">
          <h3 class="panel-title"><i class="fa fa-list"></i> 文本回复
              <a href="{{url('admin/add_text')}}"><button type="button" class="btn btn-info">
                  <i class="ace-icon fa fa-plus bigger-110"></i>
              </button></a> </h3>
        </div>
        <div class="panel-body">
          <div id="ajax_return">
              <div class="table-responsive">
                  <table class="table table-bordered table-hover">
                      <thead>
                      <tr>
                          <td class="text-center">
                              关键词
                          </td>
                          <td class="text-center">
                              回答
                          </td>

                          <td class="text-center">操作</td>
                      </tr>
                      </thead>
                      <tbody>

                      @foreach($text as $v)
                          <tr>
                              <td class="text-center">{{$v->keyword}}</td>
                              <td class="text-center">{{$v->text}}</td>
                              <td class="text-center">
                                  <a href="{{url('weixin/text/edit')."/".$v->text_id}}" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="编辑"><i class="fa fa-pencil"></i></a>
                                  <a href="{{url('weixin/text/del')."/".$v->text_id}}" data-href="{:U('Admin/Wechat/del_text',array('id'=>$list['id']))}"  id="button-delete6" data-toggle="tooltip" title="" class="btn btn-danger" data-original-title="删除"><i class="fa fa-trash-o"></i></a>
                              </td>
                          </tr>
                      @endforeach

                      </tbody>
                  </table>
              </div>
              <div class="row">
                  <div class="col-sm-6 text-left"></div>
                  <div class="col-sm-6 text-right">{$page}</div>
              </div>
          </div>
        </div>
      </div>
    </div>
    <!-- /.row --> 
  </section>
  <!-- /.content --> 
</div>
<!-- /.content-wrapper --> 

@endsection
