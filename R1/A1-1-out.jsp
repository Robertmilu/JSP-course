<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %> <% /* クラスライブラリの指定*/%>
<!DOCTYPE HTML>
 
<%

request.setCharacterEncoding("UTF-8");
String strevent=request.getParameter("event");
int intyear=Integer.parseInt(request.getParameter("year"));
int intmonth=Integer.parseInt(request.getParameter("month"));
int intday=Integer.parseInt(request.getParameter("day"));

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