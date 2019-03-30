<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
      <%
          String name=request.getParameter("name"),
                  password=request.getParameter("password");
   if(name!=null&&password!=null&&!"".equals(name)&&!"".equals(password)){
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/db_bbs","root","root");   
 Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
   String getpaperdata = "SELECT * FROM tb_user WHERE name='" + 
           name + "'  AND password='" + 
            password + "'"  ; 
     ResultSet paperrs =stmt.executeQuery(getpaperdata) ;  
            if(paperrs.next()){   
                 session.setAttribute("access", "y");
                 session.setAttribute("name", request.getParameter("name")); 
                 session.setMaxInactiveInterval(30);//30秒内没有操作则失效
        response.sendRedirect("accesspage.jsp") ;       
            }
   else
        out.println("密码账号不符 !!") ;

    }

        %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>登录</title>
    </head>
    <body>
        <form>
            <h2>登录界面</h2>
            <p><a>账号：</a><input type="text" name="name"></p>   
          <p><a>密码：</a><input type="password" name="password"></p> 
            <p><input type="submit" value="登录"></p>   
        </form>
    </body>
</html>
