<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import = "java.net.*"%>
<%@ page import="java.util.*" %>
<!DOCTYPE HTML>
 
<%

request.setCharacterEncoding("UTF-8");
String strevent=request.getParameter("event");
int intyear=Integer.parseInt(request.getParameter("year"));
int intmonth=Integer.parseInt(request.getParameter("month"));
int intday=Integer.parseInt(request.getParameter("day"));


String stryear=request.getParameter("year");
String strmonth=request.getParameter("month");
String strday=request.getParameter("day");

if(strevent != null)
{
	Cookie cookie = new Cookie("event",URLEncoder.encode(strevent,"UTF-8"));
	cookie.setMaxAge(60*60*24*30);
	response.addCookie(cookie);
}

if(stryear != null)
{
	Cookie cookie = new Cookie("year",URLEncoder.encode(stryear,"UTF-8"));
	cookie.setMaxAge(60*60*24*30);
	response.addCookie(cookie);
}

if(strmonth != null)
{
	Cookie cookie = new Cookie("month",URLEncoder.encode(strmonth,"UTF-8"));
	cookie.setMaxAge(60*60*24*30);
	response.addCookie(cookie);
}

if(strday != null)
{
	Cookie cookie = new Cookie("day",URLEncoder.encode(strday,"UTF-8"));
	cookie.setMaxAge(60*60*24*30);
	response.addCookie(cookie);
}

Calendar now = new GregorianCalendar();
Calendar eventday=new GregorianCalendar(intyear, intmonth-1, intday);


long remain = (eventday.getTimeInMillis() - now.getTimeInMillis())/1000/60/60/24;
%>
 
<HTML>
<HEAD>
<META CHARSET="UTF-8">
<TITLE>表示テスト</TITLE>
</HEAD>
<BODY>
<% out.print("<p>" + strevent +"[" + intyear + "年" + intmonth + "月" + intday + "日" +  "]" + "まであと" + remain + "日"+"</p>"); %>
</BODY>
</HTML>