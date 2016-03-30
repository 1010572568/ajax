<%--
  Created by IntelliJ IDEA.
  User: zheny
  Date: 2016/3/30
  Time: 9:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        .error{
            color: red;
        }
        .hide{
            display: none;
        }
    </style>
</head>
<body>
    <h1>hello,maven</h1>
    <input type="text" id="username"><span class="error dide" id="helpText">该账号已被占用</span>
  <script>
      (function(){
          function createXmlHttp() {
              if(window.ActiveXObject){
                    var xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
              }else {
                  var xmlHttp = new XMLHttpRequest();
              }
              return xmlHttp;
          }
          document.querySelector("username").onchange = function(){
              //获取xmlHttp对象
              var xmlHttp = createXmlHttp();
              //指定请求地址和方式
              xmlHttp.open("post","home.do",true)
              xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
              //设置回调函数
              xmlHttp.onreadystatechange = function(){
                  var readState = xmlHttp.readyState;
                  if(readState==4){
                      var xmlCode = xmlCode.status;
                      if(xmlCode==200){
                          //接受服务器端返回的值
                          var value = xmlHttp.responseText;
                          if(value==0){
                              document.querySelector("#helpText").style.display="inline";
                          }
                      }
                      else {
                          alert("服务器出现错误："+xmlCode);
                      }
                  }
              };
              //执行
              var username = document.querySelector("#username").value();
              xmlHttp.send("username="+username);
          }
      })();
  </script>
</body>
</html>
