<%@ page contentType="text/html; charset=UTF-8" import="java.util.*"%>
<!DOCTYPE HTML>
 
<%

request.setCharacterEncoding("UTF-8");

int intAmount=Integer.parseInt(request.getParameter("amount"));

double doubleRate=Double.parseDouble(request.getParameter("rate"));


double result = intAmount * doubleRate;



%>
 
<HTML>
<HEAD>
<META CHARSET="UTF-8">
<TITLE>表示</TITLE>
</HEAD>
<BODY>
<% out.print("<p>" + result + "yen" +"</p>"); %>
</BODY>
</HTML>