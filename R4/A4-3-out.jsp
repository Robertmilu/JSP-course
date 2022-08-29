<%@ page contentType="text/html;charset=UTF-8"
         import="java.io.*, java.util.*" %>
<!DOCTYPE HTML>
<HTML>
<HEAD>
<META CHARSET="UTF-8" />
<TITLE>ファイルの書き込み</TITLE>
</HEAD>
<BODY>
<%
request.setCharacterEncoding("UTF-8");
String event=request.getParameter("event");
String message = null;
int intyear = 0;
int intmonth = 0;
int intday = 0;
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");
Boolean flag = false;

try{
	intyear=Integer.parseInt(request.getParameter("year"));
    intmonth=Integer.parseInt(request.getParameter("month"));
    intday=Integer.parseInt(request.getParameter("day"));

	Calendar eventday = Calendar.getInstance();
	eventday.setLenient(false);
	eventday.set(intyear, intmonth-1, intday);

}catch(Exception e){
	flag = true;
}
%>

<%


if(flag){
	out.println("入力に誤りがあります．");
}
else{
    String path = "/WEB-INF/" + "data.txt";
    FileWriter writer = new FileWriter(application.getRealPath(path), true);
    BufferedWriter buf = new BufferedWriter(writer);
    buf.write(year + "/" + month + "/" + day + "," + event);
    buf.newLine();
    buf.close();
    out.println("書き込み終了しました．");
}
%>
</BODY>
</HTML>