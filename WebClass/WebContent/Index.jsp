<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>첫번째 JSP</title>
</head>
<body>
<%! private static final String DEFAULT_NAME = "Guest"; %>

<%
//자바 코드를 그대로 작성
String name = request.getParamenter("name");
if(name ==null) name= DEFAULT_NAME;

//표현식

<h1>Hello, <%=name%> </h1>

%>
</body>
</html>