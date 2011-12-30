<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>向上下左右不间断无缝滚动图片的效果(兼容火狐和IE) 阿里西西整理收集 alixixi .com</title>

</head>

<body><!--下面是向上滚动代码-->
告诉你一个应有尽有的网页特效网址：<a href="http://js.alixixi.com">http://js.alixixi.com</a>
<hr />
<div id="colee" style="overflow:hidden;height:253px;width:410px;">
<div id="colee1">
<p><img src="http://www.alixixi.com/images/noimg.gif"></p>
<p><img src="http://www.alixixi.com/images/noimg.gif"></p>
<p><img src="http://www.alixixi.com/images/noimg.gif"></p>
<p><img src="http://www.alixixi.com/images/noimg.gif"></p>
<p><img src="http://www.alixixi.com/images/noimg.gif"></p>
<p><img src="http://www.alixixi.com/images/noimg.gif"></p>
<p><img src="http://www.alixixi.com/images/noimg.gif"></p>
<p><img src="http://www.alixixi.com/images/noimg.gif"></p>
<p><img src="http://www.alixixi.com/images/noimg.gif"></p>
</div>
<div id="colee2"></div>
</div>
<script>
var speed=30;
var colee2=document.getElementById("colee2");
var colee1=document.getElementById("colee1");
var colee=document.getElementById("colee");
colee2.innerHTML=colee1.innerHTML; //克隆colee1为colee2
function Marquee1(){
//当滚动至colee1与colee2交界时
if(colee2.offsetTop-colee.scrollTop<=0){
 colee.scrollTop-=colee1.offsetHeight; //colee跳到最顶端
 }else{
 colee.scrollTop++
}
}
var MyMar1=setInterval(Marquee1,speed)//设置定时器
//鼠标移上时清除定时器达到滚动停止的目的
colee.onmouseover=function() {clearInterval(MyMar1)}
//鼠标移开时重设定时器
colee.onmouseout=function(){MyMar1=setInterval(Marquee1,speed)}
</script>

<!--向上滚动代码结束-->

<br>

<!--下面是向下滚动代码-->

<div id="colee_bottom" style="overflow:hidden;height:253px;width:410px;">
<div id="colee_bottom1">
<p><img src="http://www.alixixi.com/images/noimg.gif"></p>
<p><img src="http://www.alixixi.com/images/noimg.gif"></p>
<p><img src="http://www.alixixi.com/images/noimg.gif"></p>
<p><img src="http://www.alixixi.com/images/noimg.gif"></p>
<p><img src="http://www.alixixi.com/images/noimg.gif"></p>
<p><img src="http://www.alixixi.com/images/noimg.gif"></p>
<p><img src="http://www.alixixi.com/images/noimg.gif"></p>
<p><img src="http://www.alixixi.com/images/noimg.gif"></p>
<p><img src="http://www.alixixi.com/images/noimg.gif"></p>
</div>
<div id="colee_bottom2"></div>
</div>
<script>
var speed=30
var colee_bottom2=document.getElementById("colee_bottom2");
var colee_bottom1=document.getElementById("colee_bottom1");
var colee_bottom=document.getElementById("colee_bottom");
colee_bottom2.innerHTML=colee_bottom1.innerHTML
colee_bottom.scrollTop=colee_bottom.scrollHeight
function Marquee2(){
if(colee_bottom1.offsetTop-colee_bottom.scrollTop>=0)
colee_bottom.scrollTop+=colee_bottom2.offsetHeight
else{
colee_bottom.scrollTop--
}
}
var MyMar2=setInterval(Marquee2,speed)
colee_bottom.onmouseover=function() {clearInterval(MyMar2)}
colee_bottom.onmouseout=function() {MyMar2=setInterval(Marquee2,speed)}
</script>

<!--向下滚动代码结束-->

<br>

<!--下面是向左滚动代码-->

<div id="colee_left" style="overflow:hidden;width:500px;">
<table cellpadding="0" cellspacing="0" border="0">
<tr><td id="colee_left1" valign="top" align="center">
<table cellpadding="2" cellspacing="0" border="0">
<tr align="center">
<td><p><img src="http://www.alixixi.com/images/noimg.gif"></p></td>
<td><p><img src="http://www.alixixi.com/images/noimg.gif"></p></td>
<td><p><img src="http://www.alixixi.com/images/noimg.gif"></p></td>
<td><p><img src="http://www.alixixi.com/images/noimg.gif"></p></td>
<td><p><img src="http://www.alixixi.com/images/noimg.gif"></p></td>
<td><p><img src="http://www.alixixi.com/images/noimg.gif"></p></td>
<td><p><img src="http://www.alixixi.com/images/noimg.gif"></p></td>
</tr>
</table>
</td>
<td id="colee_left2" valign="top"></td>
</tr>
</table>
</div>
<script>
//使用div时，请保证colee_left2与colee_left1是在同一行上.
var speed=30//速度数值越大速度越慢
var colee_left2=document.getElementById("colee_left2");
var colee_left1=document.getElementById("colee_left1");
var colee_left=document.getElementById("colee_left");
colee_left2.innerHTML=colee_left1.innerHTML
function Marquee3(){
if(colee_left2.offsetWidth-colee_left.scrollLeft<=0)//offsetWidth 是对象的可见宽度
colee_left.scrollLeft-=colee_left1.offsetWidth//scrollWidth 是对象的实际内容的宽，不包边线宽度
else{
colee_left.scrollLeft++
}
}
var MyMar3=setInterval(Marquee3,speed)
colee_left.onmouseover=function() {clearInterval(MyMar3)}
colee_left.onmouseout=function() {MyMar3=setInterval(Marquee3,speed)}
</script>

<!--向左滚动代码结束-->

<br>

<!--下面是向右滚动代码-->

<div id="colee_right" style="overflow:hidden;width:500px;">
<table cellpadding="0" cellspacing="0" border="0">
<tr><td id="colee_right1" valign="top" align="center">
<table cellpadding="2" cellspacing="0" border="0">
<tr align="center">
<td><p><img src="http://www.alixixi.com/images/noimg.gif"></p></td>
<td><p><img src="http://www.alixixi.com/images/noimg.gif"></p></td>
<td><p><img src="http://www.alixixi.com/images/noimg.gif"></p></td>
<td><p><img src="http://www.alixixi.com/images/noimg.gif"></p></td>
<td><p><img src="http://www.alixixi.com/images/noimg.gif"></p></td>
</tr>
</table>
</td>
<td id="colee_right2" valign="top"></td>
</tr>
</table>
</div>
<script>
var speed=30//速度数值越大速度越慢
var colee_right2=document.getElementById("colee_right2");
var colee_right1=document.getElementById("colee_right1");
var colee_right=document.getElementById("colee_right");
colee_right2.innerHTML=colee_right1.innerHTML
function Marquee4(){
if(colee_right.scrollLeft<=0)
colee_right.scrollLeft+=colee_right2.offsetWidth
else{
colee_right.scrollLeft--
}
}
var MyMar4=setInterval(Marquee4,speed)
colee_right.onmouseover=function() {clearInterval(MyMar4)}
colee_right.onmouseout=function() {MyMar4=setInterval(Marquee4,speed)}
</script>

<!--向右滚动代码结束-->
</body>
</html>