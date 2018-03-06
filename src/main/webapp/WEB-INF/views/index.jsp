<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>首页</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="edge" />
<script type="text/javascript" src="<%=basePath%>static/jquery-1.8.3.min.js" charset="utf-8"></script>

<script type="text/javascript">
	function logout() {
		$.ajax({
			url : "<%=basePath%>logout",
			type : "post",
			success : function(data) {
				alert("成功退出");
			}
		});
	}
</script>
</head>

<body>
	This is my JSP page.
	<button onclick="logout();">退出</button>
	<br>
</body>
</html>

