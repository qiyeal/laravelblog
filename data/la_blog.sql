-- MySQL dump 10.13  Distrib 5.5.53, for Win32 (AMD64)
--
-- Host: localhost    Database: la_blog
-- ------------------------------------------------------
-- Server version	5.5.53

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `blog_article`
--

DROP TABLE IF EXISTS `blog_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `art_title` varchar(100) NOT NULL,
  `art_tag` varchar(100) NOT NULL,
  `art_description` varchar(255) NOT NULL,
  `art_thumb` varchar(255) NOT NULL,
  `art_content` text NOT NULL,
  `art_time` int(11) NOT NULL DEFAULT '0',
  `art_editor` varchar(50) NOT NULL,
  `art_view` int(11) NOT NULL DEFAULT '0',
  `cate_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article`
--

LOCK TABLES `blog_article` WRITE;
/*!40000 ALTER TABLE `blog_article` DISABLE KEYS */;
INSERT INTO `blog_article` VALUES (1,'配置samba的完整步骤','Linux、samba','Samba是在Linux和UNIX系统或者Window实现文件共享的免费软件。Samba只能在局域网内使用。','uploads/20170614103407283.jpg','<p>1、<span style=\"font-size: 13px;font-family: 宋体\">yum &nbsp;-y &nbsp;install &nbsp;samba</span></p><p><span style=\"font-size: 13px;font-family: 宋体\">2、<span style=\"font-size: 13px;font-family: 宋体\">vi &nbsp;/etc/samba/smb.conf&nbsp;&nbsp;</span><span style=\"font-size: 13px;font-family: 宋体\">在文件末尾添加以下内容：</span></span><span style=\"font-family: 宋体; font-size: 13px;\">&nbsp; </span></p><p><span style=\"font-size: 13px;font-family: 宋体\">&nbsp;&nbsp;&nbsp;&nbsp;[pub] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//</span><span style=\"font-size: 13px;font-family: 宋体\">到时候在window下看到目录名</span></p><p><span style=\"font-size: 13px;font-family: 宋体\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; browseable = yes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //</span><span style=\"font-size: 13px;font-family: 宋体\">这个目录是否可以读</span></p><p><span style=\"font-size: 13px;font-family: 宋体\">&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;path = /pub &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;//</span><span style=\"font-size: 13px;font-family: 宋体\">这就是我们要共享的目录路径</span></p><p><span style=\"font-size: 13px;font-family: 宋体\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; writable = yes &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;//</span><span style=\"font-size: 13px;font-family: 宋体\">这个目录是否可以写</span></p><p><span style=\"font-size: 13px;font-family: 宋体\">&nbsp;&nbsp;&nbsp;&nbsp;[soft]</span></p><p><span style=\"font-size: 13px;font-family: 宋体\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; browseable = yes</span></p><p><span style=\"font-size: 13px;font-family: 宋体\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; path = /soft</span></p><p><span style=\"font-size: 13px;font-family: 宋体\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; writable = yes</span></p><p><span style=\"font-size: 13px;font-family: 宋体\">3、<span style=\"font-size: 10pt; font-family: 宋体;\">按照这个命令继续设置</span></span></p><p><span style=\"font-family: 宋体; font-size: 13px;\">&nbsp;&nbsp;&nbsp;&nbsp;mkdir&nbsp; /pub</span></p><p><span style=\"font-size: 13px;font-family: 宋体\">&nbsp; &nbsp; &nbsp;mkdir&nbsp; /soft</span></p><p><span style=\"font-size: 13px;font-family: 宋体\">&nbsp; &nbsp; &nbsp;chmod &nbsp;777 &nbsp;/pub</span></p><p><span style=\"font-size: 13px;font-family: 宋体\">&nbsp; &nbsp; &nbsp;chmod &nbsp;700 &nbsp;/soft</span></p><p><span style=\"font-size: 13px;font-family: 宋体\">&nbsp; &nbsp; &nbsp;useradd &nbsp;aa </span></p><p><span style=\"font-size: 13px;font-family: 宋体\">&nbsp; &nbsp; &nbsp;passwd &nbsp;aa</span></p><p><span style=\"font-size: 13px;font-family: 宋体\">&nbsp; &nbsp; &nbsp;chown &nbsp;aa&nbsp; /soft</span></p><p><span style=\"font-size: 13px; font-family: 宋体;\">4、</span><span style=\"font-size: 13px; font-family: 宋体; color: red;\">s</span><span style=\"font-size: 13px; font-family: 宋体; color: red;\">mbpasswd&nbsp; -a&nbsp; aa</span> <span style=\"font-size: 13px; font-family: 宋体; color: red;\">&nbsp;&nbsp;//</span><span style=\"font-size: 13px; font-family: 宋体; color: red;\">将aa这个系统用户声明为samba用户</span></p><p><span style=\"font-size: 13px; font-family: 宋体; color: red;\"></span></p><p style=\"margin-left: 0;text-indent: 0\"><span style=\"font-size: 13px;font-family: 宋体\">5、</span><span style=\"font-size: 13px;font-family: 宋体\">重启服务</span></p><p style=\"margin-left: 0;text-indent: 0\"><span style=\"text-indent: 28px; font-size: 13px; font-family: 宋体;\">&nbsp;&nbsp;&nbsp;&nbsp;service&nbsp; </span><span style=\"text-indent: 28px; font-size: 13px; font-family: 宋体;\">smb&nbsp; </span><span style=\"text-indent: 28px; font-size: 13px; font-family: 宋体;\">restart</span></p><p><span style=\"font-size: 13px;font-family: 宋体\">&nbsp; &nbsp; &nbsp;service&nbsp; nmb&nbsp; restart</span></p><p style=\"margin-left: 0;text-indent: 0\"><span style=\"font-size: 13px;font-family: 宋体\">6、</span><span style=\"font-size: 13px; font-family: 宋体;\">访问samba服务器</span></p><p style=\"margin-left: 0;text-indent: 0\"><span style=\"font-size: 13px; font-family: 宋体;\">&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-size: 13px;font-family: 宋体\">到windows系统下，</span></span><img src=\"/ueditor/php/upload/image/20170614/1497405603.png\" title=\"1497405603.png\" alt=\"blob.png\"/></p><p style=\"margin-left: 0;text-indent: 0\">7、<span style=\"font-size: 10pt; font-family: 宋体;\">把系统用户声明为samba用户</span></p><p style=\"margin-left: 0;text-indent: 0\"><span style=\"font-family: 宋体; font-size: 13px;\">&nbsp;&nbsp;&nbsp;&nbsp;smbpasswd&nbsp; -a&nbsp; 系统用户名</span></p><p><span style=\"font-size: 13px;font-family: 宋体\">&nbsp; &nbsp; &nbsp;smbpasswd&nbsp; -a&nbsp; aa</span><span style=\"font-size: 13px;font-family: 宋体\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//</span><span style=\"font-size: 13px;font-family: 宋体\">将aa这个系统用户声明为samba用户</span></p><p><span style=\"font-size: 13px;font-family: 宋体\">&nbsp; &nbsp; &nbsp;smbpasswd&nbsp; -x&nbsp; 用户名 &nbsp; &nbsp; &nbsp; &nbsp; //删除samba用户</span></p><p><span style=\"font-size: 13px;font-family: 宋体\">&nbsp; &nbsp; &nbsp;pdbedit&nbsp; -L &nbsp;查看samba用户</span></p><p style=\"margin-left: 0;text-indent: 0\"><span style=\"font-size: 10pt; font-family: 宋体;\">8、</span><span style=\"font-family: 宋体; font-size: 13px;\">重启服务</span></p><p style=\"margin-left: 0;text-indent: 0\"><span style=\"font-family: 宋体; font-size: 13px;\">&nbsp;&nbsp;&nbsp;&nbsp;service&nbsp; smb&nbsp; restart</span></p><p><span style=\"font-size: 13px;font-family: 宋体\">&nbsp; &nbsp; &nbsp;service&nbsp; nmb&nbsp; restart</span></p><p><span style=\"font-family: 宋体; font-size: 13px;\">注意：samba权限和系统权限取最严格权限</span></p><p><span style=\"font-size: 13px;font-family: 宋体\">&nbsp;&nbsp;&nbsp;</span><span style=\"font-size: 13px;font-family: 宋体\">samba用户必须是系统用户</span></p><p><span style=\"font-size: 13px;font-family: 宋体\">&nbsp; &nbsp;</span><span style=\"font-size: 13px;font-family: 宋体\">启动的服务名是smb</span></p><p><span style=\"font-size: 13px;font-family: 宋体\"><br/></span><br/></p><p style=\"margin-left: 0;text-indent: 0\"><span style=\"font-family: 宋体; font-size: 13px;\"><br/></span><br/></p><p style=\"margin-left: 0;text-indent: 0\"><span style=\"font-size: 10pt; font-family: 宋体;\"></span><br/></p><p><span style=\"font-size: 13px; font-family: 宋体; color: red;\"></span><br/></p><p><span style=\"font-size: 13px;font-family: 宋体\"></span><br/></p><p><span style=\"font-size: 13px;font-family: 宋体\">&nbsp;</span></p><p><span style=\"font-size: 13px;font-family: 宋体\"><span style=\"font-size: 10pt; font-family: 宋体;\"><br/></span></span><br/></p><p><span style=\"font-size: 13px;font-family: 宋体\"><span style=\"font-size: 13px;font-family: 宋体\"><br/></span></span><br/></p>',1497405718,'丶林晓',13,1),(2,'MySQL优化建议','MySQL、优化','MySQL优化建议','uploads/20170614103846984.jpg','<p>MySQL优化建议：</p><p>1、设计数据表的时候要遵守三范式，但是不要严格遵守，可以适度打破范式。</p><p>2、一个表字段不适合过多。</p><p>3、常用表中只要保留常用的字段。</p><p>4、尽量给每个字段添加NOT NULL。</p><p>5、根据表的特点来选择合适的表引擎，如果这个表经常被写，应该选择Innodb，但是MySQL5.6后一般都选择Innodb。</p><p>6、根据表存放的数据来决定字符集，一般选择utf8，但是如果想要存放emoji表情，就要选择utf8mb4。</p><p>7、尽量选择更加小的数据类型，但是要考虑扩展性。</p><p>8、尽量使用数字类型、时间类型。</p><p>9、尽量减少使用文本类型。</p><p>10、最好不要使用*，尽量只查需要的字段，可以减少传输数据的大小。</p><p>11、给每条查询SQL语句添加LIMIT，可以加快传输数据的速度。</p><p>12、尽量根据索引来检索数据。</p><p>13、尽量减少在MySQL中使用内置函数，减少在MySQL中进行运算。</p><p>14、减少多表联查，可以适度冗余字段。也可以通过切分多表联查语句，变成多条单表查询。</p><p>15、不要在核心业务的代码中使用子查询。</p><p>16、给经常作为WHERE / ORDER BY / LEFT JOIN ON / DISTINCT 字段添加索引。</p><p>17、合理添加联合索引。</p><p>18、建立联合索引时，区分度大的字段要放到前面。</p><p>19、OR前后字段都必须有索引。</p><p>20、不要使用LIKE，因为LIKE会导致索引失效。比如可以用全文搜索引擎来替换LIKE，如xunsearch。</p>',1497408667,'丶林晓',3,2),(3,'Memcache扩展安装','Memcache、扩展安装','Memcache扩展安装','uploads/20170614111752256.jpg','<p>1、安装libevent</p><p>&nbsp;&nbsp;&nbsp;&nbsp;tar -zxvf libevent-2.1.8-stable.tar.gz&nbsp;</p><p><br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;cd /lamp/libevent-2.1.8-stable</p><p><br/>&nbsp; &nbsp; &nbsp;./configure&nbsp;&nbsp;--prefix=/usr/local/libevent</p><p><br/>&nbsp; &nbsp; &nbsp;make</p><p><br/>&nbsp; &nbsp; &nbsp;make install<br/>&nbsp;&nbsp;&nbsp;&nbsp;<br/>2、安装memcache扩展（https://github.com/websupport-sk/pecl-memcache）<br/>&nbsp;&nbsp;&nbsp;&nbsp;cd /lamp/pecl-memcache-NON_BLOCKING_IO_php7/</p><p><br/>&nbsp; &nbsp; &nbsp;//生成configure文件<br/>&nbsp; &nbsp; &nbsp;/usr/local/php/bin/phpize<br/><br/>&nbsp; &nbsp; &nbsp;//以后安装php的扩展，都是一下这条命令来检查环境的<br/>&nbsp; &nbsp; &nbsp;./configure --with-php-config=/usr/local/php/bin/php-config<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;make</p><p>&nbsp;&nbsp;<br/>&nbsp; &nbsp; &nbsp;make install<br/><br/>&nbsp; &nbsp; &nbsp;vim /usr/local/php/etc/php.ini&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//在php.ini加入<br/>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;extension=&quot;memcache.so&quot;;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/usr/local/apache2/bin/apachectl restart<br/><br/><br/>&nbsp; &nbsp; &nbsp; //检查一下memcache扩展是否开启<br/>&nbsp; &nbsp; &nbsp; # php -m &nbsp;</p><p><br/></p><p><span style=\"color: rgb(255, 0, 0);\">注意：相关压缩包可自行去&nbsp;<a href=\"https://github.com/leejrhuei/Memcache.git\" _src=\"https://github.com/leejrhuei/Memcache.git\">https://github.com/leejrhuei/Memcache.git</a>&nbsp;下载。</span></p>',1497410278,'丶林晓',4,3),(4,'Memcache服务器软件安装','Memcache、服务器软件暗转','Memcache服务器软件安装','uploads/20170614112055515.jpg','<p><span style=\"color: rgb(0, 0, 0);\">&gt; 前提是安装好libevent &nbsp; 具体安装步</span><span style=\"color: rgb(0, 0, 0);\">骤可以参考“Memcache扩展安装”这篇文章。</span></p><p><br/></p><p><span style=\"color: rgb(0, 0, 0);\">&nbsp; &nbsp; &nbsp;tar -zxvf memcached-1.4.17.tar.gz&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp;cd /lamp/memcached-1.4.17<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;./configure --prefix=/usr/local/memcache --with-libevent=/usr/local/libevent/<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;make &amp;&amp; make install<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;useradd memcache<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;/usr/local/memcache/bin/memcached -umemcache &amp;&nbsp;<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;vi /etc/rc.d/rc.local<br/><br/>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;//加入自启动<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/usr/local/memcache/bin/memcached -umemcache &amp;&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\"><br/></span></p><p><span style=\"color: rgb(0, 0, 0);\"><span style=\"color: rgb(255, 0, 0); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px;\">注意：相关压缩包可自行去&nbsp;</span><a href=\"https://github.com/leejrhuei/Memcache.git\" _src=\"https://github.com/leejrhuei/Memcache.git\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(51, 51, 51); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; white-space: normal;\">https://github.com/leejrhuei/Memcache.git</a>&nbsp;<span style=\"color: rgb(255, 0, 0); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px;\">下载。</span></span></p>',1497410561,'丶林晓',6,3),(5,'Redis服务器端安装','Redis、服务器端安装','Redis服务器端安装','uploads/20170614113057135.jpg','<p><span style=\"color: #b22222; \">## Redis服务器端安装</span><br/><span style=\"color: #b22222; \">### 环境说明</span><br/><br/><span style=\"color: #808080; \">1.&nbsp;</span>系统： CentOS6.8<br/><br/><span style=\"color: #b22222; \">### 安装步骤</span><br/><br/><span style=\"color: #808080; \">1.&nbsp;</span>下载Redis<br/><br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;地址：&nbsp;&nbsp;http://redis.io/download</span><br/><br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;Linux命令下载：</span><br/><br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;wget http://download.redis.io/releases/redis-3.2.8.tar.gz</span><br/><br/><span style=\"color: #808080; \">2.&nbsp;</span>移到解压后的Redis到/usr/local/redis-3.2.8<br/><br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;tar -zxvf redis-3.2.8.tar.gz</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mv redis-3.2.8 /usr/local/<br/><br/><span style=\"color: #808080; \">3.&nbsp;</span>编译以及安装<br/><br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cd /usr/local/redis-3.2.8</span><br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;make</span><br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;make install</span><br/><br/><span style=\"color: #808080; \">4.&nbsp;</span>将Redis加入自启动<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;vim /etc/rc.local<br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;</span><br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/usr/local/bin/redis-server &amp;</span><br/><br/><br/><span style=\"color: #b22222; \">## 启动Redis</span><br/><br/><span style=\"color: #b22222; \">&nbsp;&nbsp;&nbsp;&nbsp;# redis-server</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//Redis服务器默认会使用6379端口，通过 --port参数可以自动以端口号：<br/><br/><span style=\"color: #b22222; \">&nbsp;&nbsp;&nbsp;&nbsp;# redis-server --port 6378</span><br/><br/><span style=\"color: #b22222; \">## 停止Redis</span><br/><br/><span style=\"color: #b22222; \">&nbsp;&nbsp;&nbsp;&nbsp;# redis-cli SHUTDOWN</span><br/><br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;或者在redis命令行中：</span><br/><br/><span style=\"color: #b22222; \">&nbsp;&nbsp;&nbsp;&nbsp;# redis-cli</span><br/><br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;redis&gt; shutdown</span><br/><br/><span style=\"color: #b22222; \">## 小实例</span><br/><br/>&nbsp;&nbsp;&nbsp;进入Redis命令行<br/><br/><span style=\"color: #b22222; \">&nbsp;&nbsp;&nbsp;&nbsp;# redis-cli</span><br/><br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;//将a这个值存放到n这个键中</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;127.0.0.1:6379&gt; set n a<br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;OK</span><br/><br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;//get命令拿出刚刚的值</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;127.0.0.1:6379&gt; get n<br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;&quot;a&quot;</span><br/><br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;//exit退出redis命令行</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;127.0.0.1:6379&gt; exit<br/><br/>&nbsp; &nbsp;&nbsp;</p>',1497411060,'丶林晓',2,4),(6,'PHP操作Redis扩展安装','Redis、predis','PHP操作Redis扩展安装','uploads/20170614113211888.jpg','<p><span style=\"color: #b22222; \">## PHP操作Redis扩展安装</span><br/><br/>&gt; PHP操作Redis常用的扩展有phpredis,predis。前者是C语言编写，predis是PHP编写的。<br/><br/><span style=\"color: #808080; \">1.&nbsp;</span>phpredis<br/><br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;速度相对快，但是需要编译安装</span><br/><br/><span style=\"color: #808080; \">2.&nbsp;</span>predis<br/><br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;速度相对phpredis慢，但是不需要编译安装，直接将predis放到项目目录即可</span><br/><br/><span style=\"color: #b22222; \">## phpredis安装步骤</span><br/><br/><span style=\"color: #808080; \">&nbsp;&nbsp;&nbsp;1.&nbsp;</span>下载<br/><br/><span style=\"color: #b22222; \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# wget https://github.com/nicolasff/phpredis/archive/master.tar.gz</span><br/>&nbsp;&nbsp;<br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;或者使用window系统下载好，然后使用winscp软件上传到centos系统</span><br/><br/><span style=\"color: #808080; \">&nbsp;&nbsp;&nbsp;2.&nbsp;</span>解压<br/><br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;tar -zxvf phpredis-master.tar.gz</span><br/><br/><span style=\"color: #808080; \">&nbsp;&nbsp;&nbsp;3.&nbsp;</span>将phpredis移到到php的扩展目录<br/><br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mv phpredis-master /usr/local/php/include/php/ext/phpredis</span><br/><br/><span style=\"color: #008000; \">&nbsp; &nbsp; &nbsp; 注意：你的环境php的拓展目录不一定是/usr/local/php/include/php/ext/ ，请根据你的环境修改</span><br/><br/><span style=\"color: #808080; \">&nbsp;&nbsp;&nbsp;4.&nbsp;</span>编译phpredis<br/><br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cd /usr/local/php/include/php/ext/phpredis</span><br/><br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/usr/local/php/bin/phpize&nbsp;</span><br/><br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;./configure&nbsp;&nbsp;--with-php-config=/usr/local/php/bin/php-config</span><br/><br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;make &amp;&amp; make install</span><br/><br/><span style=\"color: #808080; \">&nbsp;&nbsp;&nbsp;5.&nbsp;</span>修改php.ini,让php加载phpredis扩展<br/>&nbsp;&nbsp;&nbsp;<br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;vim /usr/local/php/etc/php.ini&nbsp;&nbsp;&nbsp;#路径根据具体地环境而定</span><br/><br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在php.ini加入extension=&quot;redis.so&quot;;&nbsp;</span><br/><br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;![](./images/phpredis.png)</span><br/><br/><span style=\"color: #808080; \">&nbsp;&nbsp;&nbsp;6.&nbsp;</span>重启apache服务器<br/><br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/usr/local/apache2/bin/apachectl stop</span><br/><br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/usr/local/apache2/bin/apachectl start</span><br/><br/><span style=\"color: #808080; \">&nbsp;&nbsp;&nbsp;7.&nbsp;</span>检查是否有redis扩展<br/><br/><span style=\"color: #b22222; \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# php -m | grep redis</span><br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;</span><br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当输出redis，就说明redis扩展安装成功了</span><br/><br/><br/><span style=\"color: #808080; \">&nbsp;&nbsp;&nbsp;8.&nbsp;</span>测试例子<br/><br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在apache的根目录写一个demo.php</span><br/><br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;?php</span><br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$redis = new Redis();</span><br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$redis-&gt;connect(‘127.0.0.1’,6379);</span><br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$redis-&gt;set(‘name’,’test’);</span><br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var_dump($redis-&gt;get(‘name’));//如果输出test,说明成功</span><br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?&gt;</span><br/><br/><br/><br/><span style=\"color: #b22222; \">## phpredis手册</span><br/><br/><span style=\"color: #008000; \">&nbsp;&nbsp;&nbsp;&nbsp;https://github.com/phpredis/phpredis#usage</span><br/><br/><br/><br/>&nbsp;&nbsp;<br/></p>',1497411170,'丶林晓',3,4),(7,'Node.js在centos系统安装','Node.js、centos系统','Node.js在centos系统安装','uploads/20170614113557833.jpg','<p>### &nbsp;Node.js在centos系统安装<br/><br/>## 说明<br/>&gt; 不建议下载源码包，然后自己编译安装。因为在centos6.8编译安装会出现各种问题，相当难解决。<br/><br/>*&nbsp;准备工作(下载的二进制包)<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;在window下使用浏览器下载node.js<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;//node-6.9.5 国内镜像地址<br/><br/>&nbsp; &nbsp; &nbsp; &nbsp;https://npm.taobao.org/mirrors/node/v6.9.5/node-v6.9.5-linux-x86.tar.gz<br/><br/>## node.js安装步骤<br/><br/>&nbsp;&nbsp;1.&nbsp;将在window下载好的node二进制包上传到centos<br/><br/>&nbsp;&nbsp;2.&nbsp;解压<br/><br/>&nbsp; &nbsp; &nbsp; &nbsp; tar -zxvf node-v6.9.5-linux-x86.tar.gz<br/><br/>&nbsp;&nbsp;3.&nbsp;移动到安装目录并重命名<br/><br/>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mv node-v6.9.5-linux-x86&nbsp;&nbsp;/usr/local/node-v6.9.5<br/><br/>&nbsp;&nbsp;4.&nbsp;配置环境变量<br/><br/>&nbsp; &nbsp; &nbsp; &nbsp; vim /etc/profile<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在文件最后增加下面内容<br/><br/>&nbsp; &nbsp; &nbsp; &nbsp;export NODE_HOME=/usr/local/node-v6.9.5<br/>&nbsp; &nbsp; &nbsp; &nbsp;export PATH=$NODE_HOME/bin:$PATH<br/><br/>&nbsp;&nbsp;5.&nbsp;使环境变量生效<br/>&nbsp;<br/>&nbsp; &nbsp; &nbsp; &nbsp;source /etc/profile<br/><br/><br/>&nbsp;&nbsp;6.&nbsp;安装成功，最后检查node版本<br/><br/>&nbsp; &nbsp; &nbsp; &nbsp;[root@localhost ~]# node -v<br/>&nbsp; &nbsp; &nbsp; &nbsp;v6.9.5<br/>&nbsp; &nbsp; &nbsp; &nbsp;[root@localhost ~]# npm -v<br/>&nbsp; &nbsp; &nbsp; &nbsp;3.10.10<br/><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/><br/><br/><br/><br/>&nbsp;&nbsp;<br/><br/><br/><br/><br/><br/><br/><br/>&nbsp; &nbsp;&nbsp;</p>',1497411466,'丶林晓',0,5);
/*!40000 ALTER TABLE `blog_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_category`
--

DROP TABLE IF EXISTS `blog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(50) NOT NULL,
  `cate_title` varchar(255) NOT NULL,
  `cate_keywords` varchar(255) NOT NULL,
  `cate_description` varchar(255) NOT NULL,
  `cate_view` int(10) NOT NULL DEFAULT '0',
  `cate_order` tinyint(4) NOT NULL DEFAULT '0',
  `cate_pid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_category`
--

LOCK TABLES `blog_category` WRITE;
/*!40000 ALTER TABLE `blog_category` DISABLE KEYS */;
INSERT INTO `blog_category` VALUES (1,'Linux','Linux','Linux','Linux',15,1,0),(2,'MySQL','MySQL','MySQL','MySQL',11,2,0),(3,'Memcache','Memcache','Memcache','Memcache',11,3,0),(4,'Redis','Redis','Redis','Redis',6,4,0),(5,'Node.js','Node.js','Node.js','Node.js',11,5,0);
/*!40000 ALTER TABLE `blog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_config`
--

DROP TABLE IF EXISTS `blog_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conf_title` varchar(50) NOT NULL COMMENT '标题',
  `conf_name` varchar(50) NOT NULL COMMENT '变量名',
  `conf_content` text NOT NULL COMMENT '变量值',
  `conf_order` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `conf_tips` varchar(255) NOT NULL COMMENT '描述',
  `field_type` varchar(50) NOT NULL COMMENT '字段类型',
  `field_value` varchar(255) NOT NULL COMMENT '类型值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_config`
--

LOCK TABLES `blog_config` WRITE;
/*!40000 ALTER TABLE `blog_config` DISABLE KEYS */;
INSERT INTO `blog_config` VALUES (1,'网站标题','web_title','丶林晓',1,'网站标题','textarea',''),(2,'统计代码','web_count','百度统计',3,'网站访问情况统计','textarea',''),(3,'网站状态','web_status','1',2,'网站开启状态','radio','1|开启,0|关闭'),(5,'辅助标题','seo_title','PHPER',4,'对网站名称的补充','input',''),(6,'关键词','keywords','The programmer with feelings',5,'','input',''),(7,'描述','description','The programmer with feelings',6,'','textarea',''),(8,'版权信息','copyright','Design by  <a href=\"http://www.jrhuei.com\" target=\"_blank\">丶林晓</a>',7,'','textarea','');
/*!40000 ALTER TABLE `blog_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_links`
--

DROP TABLE IF EXISTS `blog_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `link_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '//名称',
  `link_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '//标题',
  `link_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '//链接',
  `link_order` int(11) NOT NULL DEFAULT '0' COMMENT '//排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_links`
--

LOCK TABLES `blog_links` WRITE;
/*!40000 ALTER TABLE `blog_links` DISABLE KEYS */;
INSERT INTO `blog_links` VALUES (1,'丶林晓','The programmer with feelings','http://www.jrhuei.com',1);
/*!40000 ALTER TABLE `blog_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_migrations`
--

DROP TABLE IF EXISTS `blog_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_migrations`
--

LOCK TABLES `blog_migrations` WRITE;
/*!40000 ALTER TABLE `blog_migrations` DISABLE KEYS */;
INSERT INTO `blog_migrations` VALUES ('2017_06_12_105800_create_links_table',1);
/*!40000 ALTER TABLE `blog_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_navs`
--

DROP TABLE IF EXISTS `blog_navs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_navs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nav_name` varchar(50) NOT NULL,
  `nav_alias` varchar(50) NOT NULL,
  `nav_url` varchar(255) NOT NULL,
  `nav_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_navs`
--

LOCK TABLES `blog_navs` WRITE;
/*!40000 ALTER TABLE `blog_navs` DISABLE KEYS */;
INSERT INTO `blog_navs` VALUES (1,'首页','Home','http://www.lalblog.com',0),(2,'Linux','linux','http://www.lalblog.com/cate/1',1),(3,'MySQL','MySQL','http://www.lalblog.com/cate/2',2),(4,'Memcache','Memcache','http://www.lalblog.com/cate/3',3),(5,'Redis','Redis','http://www.lalblog.com/cate/4',4),(6,'Node.js','Node.js','http://www.lalblog.com/cate/5',5);
/*!40000 ALTER TABLE `blog_navs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_user`
--

DROP TABLE IF EXISTS `blog_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL,
  `user_pass` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_user`
--

LOCK TABLES `blog_user` WRITE;
/*!40000 ALTER TABLE `blog_user` DISABLE KEYS */;
INSERT INTO `blog_user` VALUES (1,'林晓','$2y$10$9e5uLxqnaewBH7MKG.pI8OMMCV59nKq53rh2047y9IFmFJBnhPSte');
/*!40000 ALTER TABLE `blog_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-14 19:04:32
