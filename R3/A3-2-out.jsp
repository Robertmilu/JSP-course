<%@ page contentType="text/html;charset=UTF-8"
         import="java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE HTML>
<HTML>
<HEAD>
<META CHARSET="UTF-8" />
<TITLE>検索結果</TITLE>
</HEAD>
<BODY>
<%
HashMap<String, String> map = new HashMap<String, String>();
map.put("windows8.1サポート終了", "2023,1,10");
map.put("Office2013サポート終了", "2023,4,11");
map.put("世界水泳選手権2022","2023,7,14");
map.put("世界陸上競技選手権大会", "2023,8,11");
String strevent = request.getParameter("event");
if(map.containsKey(strevent)) {
	String result = map.get(strevent);
	String[] token = result.split(",");
    int intyear=Integer.parseInt(token[0]);
    int intmonth=Integer.parseInt(token[1]);
    int intday=Integer.parseInt(token[2]);

    Calendar now = new GregorianCalendar();
    Calendar eventday=new GregorianCalendar(intyear, intmonth-1, intday);

    long remain = (eventday.getTimeInMillis() - now.getTimeInMillis())/1000/60/60/24;

    out.print("<p>" + strevent +"[" + intyear + "年" + intmonth + "月" + intday + "日" +  "]" + "まであと" + remain + "日"+"</p>");
%>
<% } else { %>
	<DIV STYLE="color:Red">指定されたイベントは見つかりませんでした</DIV>
<% } %>
</BODY>
</HTML>