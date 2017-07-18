<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    @yield('info')
    <link href="{{URL::asset('home/css/base.css')}}" rel="stylesheet">
    <link href="{{URL::asset('home/css/index.css')}}" rel="stylesheet">
    <link href="{{URL::asset('home/css/style.css')}}" rel="stylesheet">
    <link href="{{URL::asset('home/css/new.css')}}" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="{{URL::asset('home/js/modernizr.js')}}"></script>
    <![endif]-->
</head>
<body>
<header>
    
    <nav class="topnav" id="topnav">
        @foreach($navs as $k=>$v)<a href="{{$v->nav_url}}"><span>{{$v->nav_name}}</span><span class="en">{{$v->nav_alias}}</span></a>@endforeach
    </nav>
</header>

@section('content')
    <h3>
        <p>最新<span>文章</span></p>
    </h3>
    <ul class="rank">
        @foreach($new as $n)
            <li><a href="{{url('a/'.$n->id)}}" title="{{$n->art_title}}" target="_blank">{{$n->art_title}}</a></li>
        @endforeach
    </ul>
    <h3 class="ph">
        <p>点击<span>排行</span></p>
    </h3>
    <ul class="paih">
        @foreach($hot as $h)
            <li><a href="{{url('a/'.$h->id)}}" title="{{$h->art_title}}" target="_blank">{{$h->art_title}}</a></li>
        @endforeach
    </ul>
@show

<footer>
    <p>{!! config('web.copyright') !!}</p>
</footer>
</body>
</html>
