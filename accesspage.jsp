<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    if(session.getAttribute("access")=="y"){
    out.println("登录成功"); 
        out.println(session.getAttribute("name")); 
    }
    else{
   out.println("请重新登录");     
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>登录成功</h1>
    </body>
</html>
