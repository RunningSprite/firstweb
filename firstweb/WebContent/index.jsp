<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆页面</title>
</head>
<body>
<%--表单--%>
  <fieldset>
  <legend>登陆界面</legend>
  <form action="login.jsp" method="post">
  <input type="text" name="username"><br>
  <input type="password" name="password"><br>
  <input type="submit" value="登陆">
  <!-- EL语句，后面验证表单时，验证错误反回信息-->
  ${error}
  </form>
</fieldset>
</body>
</html>