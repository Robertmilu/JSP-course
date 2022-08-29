<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.net.*"%>
<%@ page import="java.util.*" %>

<%
request.setCharacterEncoding("UTF-8");

session.setAttribute("event", "");
session.setAttribute("date", "");


%>

<!DOCTYPE HTML>
<HTML><HEAD>
<META CHARSET="UTF-8">
<TITLE>カウントダウン</TITLE>
</HEAD>
<BODY>
<FORM ACTION="B3-1-out.jsp" METHOD="Post">
入力画面<BR>
<TABLE>
<TR><TD>イベント名</TD><TD><INPUT TYPE="text" NAME="event"></TD></TR>
<TR><TD>年</TD><TD><INPUT TYPE="text" NAME="year"></TD></TR>
<TR><TD>月</TD><TD><INPUT TYPE="text" NAME="month"></TD></TR>
<TR><TD>日</TD><TD><INPUT TYPE="text" NAME="day"></TD></TR>
</TABLE>
<INPUT TYPE="submit" NAME="botton" VALUE="登録"><BR>
<INPUT TYPE="submit" NAME="botton" VALUE="検索"><BR>
</FORM>
</BODY>
</HTML>