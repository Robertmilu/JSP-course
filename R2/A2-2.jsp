<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.net.*"%>
<%@ page import="java.util.*" %>

<%
request.setCharacterEncoding("UTF-8");

session.setAttribute("result", 0);

%>
 
<HTML>
<HEAD>
<META CHARSET="UTF-8" />
<TITLE>電卓</TITLE>
</HEAD>
<BODY>
<BR>
<FORM ACTION="A2-2-out.jsp" METHOD="Post">
電卓<BR>
<INPUT TYPE="text" NAME="x" value=0>
<INPUT TYPE="submit" NAME="b" VALUE="+">
<INPUT TYPE="submit" NAME="b" VALUE="-">
<INPUT TYPE="submit" NAME="b" VALUE="*">
<INPUT TYPE="submit" NAME="b" VALUE="/">
<INPUT TYPE="text" NAME="y">
</FORM>
</BODY>
</HTML>