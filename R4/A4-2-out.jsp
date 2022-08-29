<%@ page contentType="text/html;charset=UTF-8"
	import="java.io.*, java.util.*, java.util.regex.*"%>

<!DOCTYPE HTML>
<%
String regular = "";
 
request.setCharacterEncoding("UTF-8");
String inyear=request.getParameter("year");
String inmonth=request.getParameter("month");
String inday=request.getParameter("day");
if(inyear == "") regular+=".*/"; else regular=regular + inyear + "/";
if(inmonth == "") regular+=".*/"; else regular=regular + inmonth + "/";
if(inday == "") regular+=".*"; else regular=regular + inday;
Pattern pattern = Pattern.compile(regular);
%>

<HTML>
<HEAD>
<META CHARSET="UTF-8" />
<TITLE>イベント一覧</TITLE>
</HEAD>
<BODY>
正規表現文字列：<%= regular %>
<TABLE BORDER="1">
<TR>
<TH>日付</TH>
<TH>イベント名</TH>
</TR>
<%
InputStreamReader reader = new InputStreamReader( new FileInputStream(
	application.getRealPath("/WEB-INF/data.txt")), "UTF-8");
BufferedReader buf = new BufferedReader(reader);
while(buf.ready()) {
	String line = buf.readLine();
	String[] token = line.split(",");
	String date = token[0];
	String event = token[1];
 
	Matcher match = pattern.matcher(date);
	if(match.find()) {
		out.println("<TR>");
		out.println("<TD>"+date+"</TD>");
		out.println("<TD>"+event+"</TD>");
		out.println("</TR>");
		}
	else continue;
}
buf.close();
%>
</>
</BODY>
</HTML>