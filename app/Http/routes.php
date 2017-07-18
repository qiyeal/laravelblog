<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

Route::get('/', 'Home\IndexController@index');
Route::get('/cate/{cate_id}', 'Home\IndexController@cate');
Route::get('/a/{art_id}', 'Home\IndexController@article');







Route::any('admin/login', 'Admin\LoginController@login');
Route::get('admin/code', 'Admin\LoginController@code');
Route::get('admin/getcode', 'Admin\LoginController@getcode');

Route::group(['middleware' => ['admin.login'], 'prefix' => 'admin', 'namespace' => 'Admin'], function () {
    Route::get('index', 'IndexController@index');
    Route::get('info', 'IndexController@info');
    Route::get('quit', 'LoginController@quit');
    Route::any('pass', 'IndexController@pass');

    Route::post('cate/changeorder', 'CategoryController@changeOrder');
    Route::resource('category', 'CategoryController');

    Route::resource('article', 'ArticleController');
    Route::any('upload', 'CommonController@upload');

    Route::post('links/changeorder', 'LinksController@changeOrder');
    Route::resource('links', 'LinksController');

    Route::post('navs/changeorder', 'NavsController@changeOrder');
    Route::resource('navs', 'NavsController');

    Route::post('config/changecontent', 'ConfigController@changeContent');
    Route::post('config/changeorder', 'ConfigController@changeOrder');
    Route::get('config/putfile', 'ConfigController@putFile');
    Route::resource('config', 'ConfigController');
    
});

//文本消息
Route::any("admin/text", "Admin\Weixin\WeixinTextController@index");
//添加文本消息
Route::any("admin/add_text", "Admin\Weixin\WeixinTextController@addText");
//编辑文本消息
Route::any("weixin/text/edit/{text_id?}", "Admin\Weixin\WeixinTextController@edit");
//删除文本消息
Route::get("weixin/text/del/{text_id}", "Admin\Weixin\WeixinTextController@del");

//图文消息
Route::any("weixin/pic", "Admin\Weixin\WeixinPicController@index");
//添加图文消息
Route::any("weixin/add_pic", "Admin\Weixin\WeixinPicController@addPic");
//编辑图文消息
Route::any("weixin/pic/edit/{pic_id?}", "Admin\Weixin\WeixinPicController@edit");
//删除图文消息
Route::get("weixin/pic/del/{pic_id}", "Admin\Weixin\WeixinPicController@del");



//验证接口
Route::any("admin/weixin/api", "Admin\Weixin\WeichatController@api");

