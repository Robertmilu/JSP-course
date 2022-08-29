<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE HTML>

<%!
private String htmlEscape(String value) {
	StringBuilder result = new StringBuilder();
	for(int i = 0; i < value.length(); i++) {
		switch(value.charAt(i)) {
			case '&' :
				result.append("&amp;");
				break;
			case '<' :
				result.append("&lt;");
				break;
			case '>' :
				result.append("&gt;");
				break;
			default :
				result.append(value.charAt(i));
				break;
		}
	}
	return result.toString();
}
%>

<%
request.setCharacterEncoding("UTF-8");
String strevent= htmlEscape(request.getParameter("event"));
String message = null;
int intyear = 0;
int intmonth = 0;
int intday = 0;
long remain = 0;
Boolean flag = false;

try{
	intyear=Integer.parseInt(request.getParameter("year"));
    intmonth=Integer.parseInt(request.getParameter("month"));
    intday=Integer.parseInt(request.getParameter("day"));

	Calendar eventday = Calendar.getInstance();
	eventday.setLenient(false);
	eventday.set(intyear, intmonth-1, intday);

	Calendar now = Calendar.getInstance();
	remain =  (eventday.getTimeInMillis() - now.getTimeInMillis())/1000/60/60/24;
}catch(Exception e){
	flag = true;
}
 
if(!flag){
	message = strevent +"[" + intyear + "年" + intmonth + "月" + intday + "日" +  "]" + "まであと" + remain + "日";
} else {
	message = "入力に誤りがあります．";
}
%>

 
<HTML>
<HEAD>
<META CHARSET="UTF-8">
<TITLE>表示テスト</TITLE>
</HEAD>
<BODY>
<%= message %>
</BODY>
</HTML>