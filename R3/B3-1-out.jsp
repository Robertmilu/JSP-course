<%@ page contentType="text/html;charset=UTF-8"
         import="java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE HTML>

<%
int bottonFlag = 0;
Boolean inputflag = false;
String botton = request.getParameter("botton");
String message = "";

HashMap<String, String> map = new HashMap<String, String>();

String oldevent = (String)session.getAttribute("event");
String olddate = (String)session.getAttribute("date");
map.put(oldevent,olddate);

if(botton.equals("検索"))
{
    bottonFlag = 1;
}
%>

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
if(bottonFlag == 0)
{
    
    try{
        String strevent= htmlEscape(request.getParameter("event"));
        String stryear=htmlEscape(request.getParameter("year"));
        String strmonth=htmlEscape(request.getParameter("month"));
        String strday=htmlEscape(request.getParameter("day"));

        String strdate = stryear+','+strmonth+','+strday;
    
        

        session.setAttribute("event", strevent);
        session.setAttribute("date", strdate);

    }catch(Exception e){
        inputflag = true;
    }
     
    if(!inputflag){
        message = "登録しました.";
    } else {
        message = "入力に誤りがあります．";
    }
}

%>

<HTML>
<HEAD>
<META CHARSET="UTF-8" />
<TITLE>検索結果</TITLE>
</HEAD>
<BODY>
<%
if(bottonFlag == 0){
    out.print(message);
}

else{
    String strevent = htmlEscape(request.getParameter("event"));
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
    }
    else{
        out.print("指定されたイベントは見つかりませんでした");
    }
}
%>
</BODY>
</HTML>