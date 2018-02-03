<%@page import="java.sql.*"%>
 
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
//请求获取login.jsp的用户名username的值
 String username=request.getParameter("username");
//请求获取login.jsp的密码password的值
String password=request.getParameter("password");
//数据库MySQL的地址
String DBURL="jdbc:mysql://localhost:3306/world"; 
String DBName="root"; //登入用户名
String DBPwd="123456";//登入密码
//加载mysql驱动
Class.forName("com.mysql.jdbc.Driver");
//连接数据库
Connection conn=DriverManager.getConnection(DBURL,DBName,DBPwd);
//创建Statement对象
Statement st=conn.createStatement();
//sql语句，搜索这个username和password在数据库是否存在
String sql="select * from login where username='"+username+"'and password='"+password+"'";//cuode difang
//运行sql语句，并把得到的结果放入结果集ResultSet中
ResultSet rs=st.executeQuery(sql);
//判断这个结果集是否存在，一般username只有一个
if(rs.next()){
  //设置一个username，将后面username其内容赋值给前面一个username，可以以便下一个页面使用
  request.setAttribute("username", username);
  //跳转页面到userpage.jsp
  request.getRequestDispatcher("success.jsp").forward(request, response);
}else{
  //设置一个error,将后面的字赋给这个error，以便先一个跳转页面的使用，request的作用域有限
  request.setAttribute("error", "用户名或密码错误!!!");
  request.getRequestDispatcher("index.jsp").forward(request, response);
}
 
 
conn.close();
rs.close();
%>