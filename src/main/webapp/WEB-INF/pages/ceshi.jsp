<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head> 
    <%@include file="include.inc.jsp" %>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <style>
        .module {
            margin-bottom: 30px;
        }
        .tags {
            line-height: 30px;
        }
        .posts>li {
            margin-bottom: 50px;
        }
        .footer {
            padding: 20px;
            border-top: 1px solid #ddd;
        }
    </style>
</head>
<body>
<div class="jumbotron">
    <div class="container">
        <h1>经典的左侧边栏+右内容栏</h1>
    </div>
</div>
<div class="container">

    <div class="row">
        <div class="col-md-3">

            <div class="module">
                <div class="input-group">
                    <input type="text" name="" id="" placeholder="搜索" class="form-control">
                    <div class="input-group-btn">
                        <button class="btn btn-primary">搜索</button>
                    </div>
                </div>
            </div>

            <div class="module">
                <div class="list-group">
                    <a href="#" class="list-group-item active" id="">
                        <h4 class="list-group-item-heading">前端开发</h4>
                        <p class="list-group-item-text">包括HTML、CSS、JS、PS、AS、jQuery、grunt、glup、bower等单词的拼写。</p>
                    </a>
                    <a href="#" class="list-group-item" id="">
                        <h4 class="list-group-item-heading">后端开发</h4>
                        <p class="list-group-item-text">包括PHP、Net、JAVA、C#、NodeJs等单词的拼写。</p>
                    </a>
                    <a href="#" class="list-group-item" id="">
                        <h4 class="list-group-item-heading">闲言碎语</h4>
                        <p class="list-group-item-text">闲说乱言碎话滥语，非小说，只讲那些发生在我们生命中的故事。</p>
                    </a>
                </div>
            </div>

            <div class="module">
                <div class="list-group">
                    <a href="#" class="list-group-item">云淡然
                        <span class="badge">123</span>
                    </a>
                    <a href="#" class="list-group-item">王九禾
                        <span class="badge">100</span>
                    </a>
                    <a href="#" class="list-group-item">涵丹尼
                        <span class="badge">60</span>
                    </a>
                    <a href="#" class="list-group-item">霜痕累累
                        <span class="badge">22</span>
                    </a>
                </div>
            </div>

            <div class="module panel panel-default">
                <div class="panel-heading">热门标签</div>
                <div class="panel-body tags">
                    <a href="#" class="label label-info">身边的故事</a>
                    <a href="#" class="label label-success">谈谈情</a>
                    <a href="#" class="label label-warning">说说爱</a>
                    <a href="#" class="label label-danger">HTML</a>
                    <a href="#" class="label label-default">CSS</a>
                    <a href="#" class="label label-primary">PHP</a>
                    <a href="#" class="label label-danger">JS</a>
                    <a href="#" class="label label-info">nodeJs</a>
                    <a href="#" class="label label-default">Net</a>
                    <a href="#" class="label label-warning">JAVA</a>
                </div>
            </div>

        </div>
        <div class="col-md-9">
            <ol class="breadcrumb">
                <li><a href="#">Home</a>
                </li>
                <li><a href="#">Library</a>
                </li>
                <li class="active">Data</li>
            </ol>
            <ul class="list-unstyled posts">
                <li>
                    <h2>这么近，那么远—移动互联网人性拷问</h2>
                    <div class="content">
                        <p>
                            先问你两个问题：1.你有多久没有看过你最好的朋友了？ 2.你有多久没有看过手机了？对于第一个问题，大部分人也许要思考一下才能回答，而对于第二个问题，可能就要简单多了，因为此时此刻你正在用手机阅读这篇文章。
                        </p>
                        <p>
                            今天我们要讨论的话题是，在网络无所不在、业务无所不能的移动互联网时代，你丢了些什么？
                        </p>
                        <p>
                            在德国召开的一场数码科技会议公布的数据显示，2013年全球共有18.3亿部智能手机，每位手机用户平均每天查看 150次手机。换言之，除了休息时间外，每人平均每6分半钟查看一次手机。手机综合症正在成为社会的一种新型流行病，在公交车、地铁站、公园、餐厅、家里、单位……“低头族”、“屏奴”正在快速膨胀，迅速占领了世界的各个角落。很多人每隔一段时间就要按开密码看一眼手机，刷微博、刷微信，或者看照片，又或者什么都不干就看一眼再锁掉。
                        </p>
                    </div>
                </li>
                <li>
                    <h2>贫困不予温柔之名</h2>
                    <div class="content">
                        <p>
                            我的舅舅，是个穷人。
                        </p>
                        <p>
                            但其实，他并不是一个穷人。
                        </p>
                        <p>
                            人到中年，月薪近万，这样的收入，在一座西部城市，算是不错了。但联系到我外公家，就有些许寒颤。我舅舅从小被人介绍时的介绍语是 “这位是冷局长的二公子”，在那个年代，肉类在国人饭桌上还属于奢侈品的年代，外公家里就已经有彩电热水器，用上天然气了。于是，在长辈的眼里，我舅舅现在的“成就”，有点扶不起的阿斗的意思。
                        </p>
                    </div>
                </li>
                <li>
                    <h2>我们讨论的民主是什么</h2>
                    <div class="content">
                        <p>
                            似乎每隔几年，就会有一阵这样那样呀的风潮。例如，颜色革命。那时节，好像全世界就要变了天一样，各种艺术的名字，加上革命两个字。一个个着急忙慌的挤上各种媒体。现如今，新媒体已然十分发达。这类信息的传播速度，更是十分快捷，加之我朝日益开放，接触到这类信息的机会越来越多。
                        </p>
                        <p>
                            人到中年，月薪近万，这样的收入，在一座西部城市，算是不错了。但联系到我外公家，就有些许寒颤。我舅舅从小被人介绍时的介绍语是 初见那些来自异域的与国内媒体行文风格迥然不同的新闻，不说耳目一新，也算是感觉新鲜劲十足。看得多了。才发觉，所谓客观公正，在时事政治新闻里，是不可能真的做到的。为何要这样说？先撇开政治环境，意识形态之类的“上层”上的东西不说，最基本的民族文化，宗教文化以及自然环境下孕育出来的社会，怎么会有相同的价值理念？西方一直在推崇的所谓“普世”，真的是“放之四海而皆准”么？我虽不是什么高明的理论家，但是我隐约觉得，在一种文化背景下产生的理论，放到另外一个文化中去。真的大丈夫么?
                        </p>
                    </div>
                </li>
            </ul>
            <ul class="pagination pagination-lg">
                <li><a href="#">&laquo;</a>
                </li>
                <li><a href="#">1</a>
                </li>
                <li><a href="#">2</a>
                </li>
                <li class="active">
                    <span>3</span>
                </li>
                <li><a href="#">4</a>
                </li>
                <li><a href="#">5</a>
                </li>
                <li><a href="#">&raquo;</a>
                </li>
            </ul>
        </div>
    </div>

</div>
<ul class="footer list-inline">
    <li>&copy;2014 云淡然</li>
    <li><a href=" http://qianduanblog.com/3150.html" target="_blank">bootstrap3学习1：响应式布局layout</a>
    </li>
</ul>
</body>
</html>