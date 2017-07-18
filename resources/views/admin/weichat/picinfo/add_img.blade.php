<include file="Public/min-header"/>

<div class="wrapper">
    <include file="Public/breadcrumb"/>
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
                <h3 class="panel-title text-center">信息</h3>
            </div>
            <div class="panel-body">
                <form action="" method="post">
                    <input type="hidden" value="{$keyword.id}" name="kid">
                    <table class="table table-bordered">
                        <tbody>
                        <tr>                            
                                <td class="col-sm-2">关键词：</td>
                                <td class="col-sm-4">
                                    <input type="text" name="keyword" value="{$keyword.keyword}"  class="form-control" />
                                </td>                            
                                <td class="col-sm-4"></td>
                        </tr>
                        <tr>                            
                                <td>标题：</td>
                                <td>
                                    <input type="text" name="title" value="{$keyword.title}"  class="form-control" />
                                </td>         
                                <td class="col-sm-4"></td>
                        </tr>
                        <tr>
                                <td>URL：</td>
                                <td>
                                    <input type="text" name="url" value="{$keyword.url}" class="form-control"/>
                                   <!-- <button class="btn btn-primary btn-sm" type="button" onclick="selectgoods()">选择商品</button> -->
                                </td>
                                <td class="col-sm-4"></td>
                        </tr>
                        <tr>                            
                                <td>封面图片：</td>
                                <td>
                                    <input type="text" name="pic" id="pic" value="{$keyword.pic}" class="form-control"/>
                                </td>
                                <td class="col-sm-4">
                                    <button class="btn btn-info btn-sm" type="button" onclick="GetUploadify(1,'pic','weixin');">上传图片</button>
                                    <button class="btn btn-info btn-sm" type="button" onclick="preview('pic')">预览</button>                                    
                                </td>
                        </tr>
                        <tr>
                                <td>简介：</td>
                                <td>
                                    <textarea name="desc" placeholder="简介" rows="3" class="form-control">{$keyword.desc}</textarea>
                                </td>
                                <td class="col-sm-4"></td>
                        </tr>
                        <tr>
                                <td class="col-sm-2"></td>
                                <td class="col-sm-4">                                    
                                        <button class="btn btn-default" type="submit" id="cancel">保存</button>                                    
                                </td>
                                <td class="col-sm-4"></td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </div>    <!-- /.content -->
        </section>
</div>
<script>
    function preview(id){
        layer.open({
            type: 1,
            title: false,
            closeBtn: false,
            area: ['300px', '300px'],
            skin: 'layui-layer-nobg', //没有背景色
            shadeClose: true,
            content: "<img width='300' height='300' src='"+$('#'+id).val()+"'>"
        });
    }
    function selectgoods(){
        //iframe层
        layer.open({
            type: 2,
            title: '选择商品',
            shadeClose: true,
            shade: 0.8,
            area: ['60%', '90%'],
            content: '{:U("Admin/Wechat/select_goods")}' //iframe的url
        });

//        layer.msg("还没有做呢，亲");
    }

    function selected(img,url){
        $('#url').val(url);
        $('#pic').val(img);
        layer.closeAll();
    }
</script>
</body>
</html>