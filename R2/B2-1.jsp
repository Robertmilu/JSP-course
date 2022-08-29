<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.net.*"%>
<%@ page import="java.util.*" %>

<%
request.setCharacterEncoding("UTF-8");
boolean flag = false;

String stryear=request.getParameter("year");
String strmonth=request.getParameter("month");
String strday=request.getParameter("day");
String event=request.getParameter("event");


if(event != null)
{
    Cookie cookie = new Cookie("event",URLEncoder.encode(event,"UTF-8"));
    cookie.setMaxAge(60*60*24*30);
    response.addCookie(cookie);
	flag = true;
}

if(stryear != null)
{
    Cookie cookie = new Cookie("year",URLEncoder.encode(stryear,"UTF-8"));
    cookie.setMaxAge(60*60*24*30);
    response.addCookie(cookie);
	flag = true;
}

if(strmonth != null)
{
    Cookie cookie = new Cookie("month",URLEncoder.encode(strmonth,"UTF-8"));
    cookie.setMaxAge(60*60*24*30);
    response.addCookie(cookie);
	flag = true;
}

if(strday != null)
{
    Cookie cookie = new Cookie("day",URLEncoder.encode(strday,"UTF-8"));
    cookie.setMaxAge(60*60*24*30);
    response.addCookie(cookie);
	flag = true;
}

Cookie[] cookies = request.getCookies();
if(cookies != null) {
	for(int i = 0; i < cookies.length; i++){
		if(cookies[i].getName().equals("event")) {
			event = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
			flag = true;
		}
		if(cookies[i].getName().equals("year")) {
			stryear = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
			flag = true;
		}
		if(cookies[i].getName().equals("month")) {
			strmonth = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
			flag = true;
		}
		if(cookies[i].getName().equals("day")) {
			strday = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
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
<FORM ACTION="B2-1.jsp" METHOD="Post">
入力画面<BR>
<TABLE>
<TR><TD>イベント名</TD><TD><INPUT TYPE="text" NAME="event"></TD></TR>
<TR><TD>年</TD><TD><INPUT TYPE="text" NAME="year"></TD></TR>
<TR><TD>月</TD><TD><INPUT TYPE="text" NAME="month"></TD></TR>
<TR><TD>日</TD><TD><INPUT TYPE="text" NAME="day"></TD></TR>
</TABLE>
<INPUT TYPE="submit" VALUE="submit"><BR>
</FORM>

<% } else {
request.setCharacterEncoding("UTF-8");
Integer year,month,day;
year = Integer.parseInt(stryear);
month = Integer.parseInt(strmonth);
day = Integer.parseInt(strday);


Calendar now = new GregorianCalendar();
Calendar eventday=new GregorianCalendar(year, month-1, day);


long remain = (eventday.getTimeInMillis() - now.getTimeInMillis())/1000/60/60/24;
out.print("<p>" + event +"[" + year + "年" + month + "月" + day + "日" +  "]" + "まであと" + remain + "日"+"</p>");
} %>

</BODY>
</HTML>