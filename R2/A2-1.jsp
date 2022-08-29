<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.net.*"%>

<%
boolean flag = false;
String event = "";
String year = "";
String month = "";
String day = "";

Cookie[] cookies = request.getCookies();
if(cookies != null) {
	for(int i = 0; i < cookies.length; i++){
		if(cookies[i].getName().equals("event")) {
			event = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
			flag = true;
		}
		if(cookies[i].getName().equals("year")) {
			year = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
			flag = true;
		}
		if(cookies[i].getName().equals("month")) {
			month = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
			flag = true;
		}
		if(cookies[i].getName().equals("day")) {
			day = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
			flag = true;
		}
	}
}
%>

<HTML>
<HEAD>
<META CHARSET="UTF-8">
<TITLE>入力画面</TITLE>
</HEAD>

<BODY>
<BR>
<% if(!flag) { %>
<FORM ACTION="A2-1-out.jsp" METHOD="Post">
入力画面<BR>
<TABLE>
<TR><TD>イベント名</TD><TD><INPUT TYPE="text" NAME="event"></TD></TR>
<TR><TD>年</TD><TD><INPUT TYPE="text" NAME="year"></TD></TR>
<TR><TD>月</TD><TD><INPUT TYPE="text" NAME="month"></TD></TR>
<TR><TD>日</TD><TD><INPUT TYPE="text" NAME="day"></TD></TR>
</TABLE>
<INPUT TYPE="submit" VALUE="submit"><BR>
</FORM>

<% } else { %>
<FORM ACTION="A2-1-out.jsp" METHOD="Post">
<TABLE>
<TR><TD>イベント名</TD><TD><INPUT TYPE="text" NAME=event value=<%=event%>></TD></TR>
<TR><TD>年</TD><TD><INPUT TYPE="text" NAME=year value=<%=year%>></TD></TR>
<TR><TD>月</TD><TD><INPUT TYPE="text" NAME=month value=<%=month%>></TD></TR>
<TR><TD>日</TD><TD><INPUT TYPE="text" NAME=day value=<%=day%>></TD></TR>
</TABLE>
<INPUT TYPE="submit" VALUE="submit"><BR>
</FORM>
<% } %>

</BODY>
</HTML>