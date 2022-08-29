<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.net.*"%>
<%@ page import="java.util.*" %>

<%
request.setCharacterEncoding("UTF-8");

int num1 = 1;
int num2 = 0;

num1 = (int)session.getAttribute("result");
num2 = Integer.parseInt(request.getParameter("y"));
String fugou = request.getParameter("b");

if(fugou.equals("+"))
{
    num1 = num1 + num2;
}
if(fugou.equals("-"))
{
    num1 = num1 - num2;
}
if(fugou.equals("*"))
{
    num1 = num1 * num2;
}
if(fugou.equals("/"))
{
    num1 = num1 / num2;
}

session.setAttribute("result", num1);


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
<INPUT TYPE="text" NAME="x" value=<%=num1%>>
<INPUT TYPE="submit" NAME="b" VALUE="+">
<INPUT TYPE="submit" NAME="b" VALUE="-">
<INPUT TYPE="submit" NAME="b" VALUE="*">
<INPUT TYPE="submit" NAME="b" VALUE="/">
<INPUT TYPE="text" NAME="y">
</FORM>
</BODY>
</HTML>