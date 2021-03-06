<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="{{URL::asset('admin1/style/css/ch-ui.admin.css')}}">
    <link rel="stylesheet" href="{{URL::asset('admin1/style/font/css/font-awesome.min.css')}}">
</head>
<body style="background:#F3F3F4;">
<div class="login_box">
    <h1>Blog</h1>
    <h2>欢迎使用博客管理平台</h2>
    <div class="form">
        @if(isset($msg))
            <p style="color:red">{{$msg}}</p>
        @endif
        <form action="{{url('admin/login')}}" method="post">
            {{csrf_field()}}
            <ul>
                <li>
                    <input type="text" name="user_name" class="text"/>
                    <span><i class="fa fa-user"></i></span>
                </li>
                <li>
                    <input type="password" name="user_pass" class="text"/>
                    <span><i class="fa fa-lock"></i></span>
                </li>
                <li>
                    <input type="text" class="code" name="code"/>
                    <span><i class="fa fa-check-square-o"></i></span>
                    <img src="{{url('admin/code')}}" alt="" onclick="this.src='{{url('admin/code')}}?'+Math.random()">
                </li>
                <li>
                    <input type="submit" value="立即登陆"/>
                </li>
            </ul>
        </form>
        <p><a href="{{url('/')}}">返回首页</a> &copy; 2017 Powered by <a href="http://www.jrhuei.com"
                                                                     target="_blank">丶七夜</a>
        </p>
    </div>
</div>
</body>
</html>
