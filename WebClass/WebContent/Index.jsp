<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ù��° JSP</title>
</head>
<body>
<%! private static final String DEFAULT_NAME = "Guest"; %>

<%
//�ڹ� �ڵ带 �״�� �ۼ�
String name = request.getParamenter("name");
if(name ==null) name= DEFAULT_NAME;

//ǥ����

<h1>Hello, <%=name%> </h1>

%>
</body>
</html>