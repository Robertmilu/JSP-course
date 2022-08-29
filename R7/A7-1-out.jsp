<%@ page contentType="text/html; charset=UTF-8"
	import="java.sql.*, java.util.*" %>

<%
request.setCharacterEncoding("UTF-8");

String order = request.getParameter("command");
int order_Flag = -1;
if(order != null)
{
    if(order.equals("イベント名検索")) order_Flag = 1;
    if(order.equals("日付検索")) order_Flag = 2;
    if(order.equals("場所検索")) order_Flag = 3;
}

String inevent = request.getParameter("event");
String inplace = request.getParameter("place");
String inyear = request.getParameter("year");
String inmonth = request.getParameter("month");
String inday = request.getParameter("day");

String strdate = inyear + "-" + inmonth + "-" + inday;
java.sql.Date sqldate = java.sql.Date.valueOf("2000-1-1");



//JDBCドライバの登録
Class.forName("com.mysql.jdbc.Driver"); 
//コネクションオブジェクトを取得
Connection db =DriverManager.getConnection("jdbc:mysql://localhost/stu0756?user=stu0756&password=stu0756");

PreparedStatement ps = db.prepareStatement("SELECT * FROM places");
ResultSet rs = ps.executeQuery();

if(order_Flag == 1)
{
    ps = db.prepareStatement("SELECT * FROM events WHERE name = ?;");
    ps.setString(1, inevent);

    rs = ps.executeQuery();
}

else if(order_Flag == 2)
{
    sqldate = java.sql.Date.valueOf(strdate);
    ps = db.prepareStatement("SELECT * FROM events WHERE date = ?;");
    ps.setDate(1, sqldate);

    rs = ps.executeQuery();
}

else
{
    ps = db.prepareStatement("SELECT * FROM events WHERE place = ?;");
    ps.setString(1, inplace);

    rs = ps.executeQuery();
}

%>
 
<!DOCTYPE HTML>
<HTML>
<HEAD>
<META CHARSET="UTF-8" />
<TITLE>JDBC</TITLE>
</HEAD>
<BODY>
<H1>検索結果</H1>
<TABLE BORDER="1">
<% 
if (rs.next()) {
    do {
        out.println("<TR>");
        out.println("<TD> <FONT COLOR=\"red\">" + rs.getInt("id") + "</FONT></TD>");
        out.println("<TD> <FONT COLOR=\"red\">" + rs.getString("name") + "</FONT></TD>");
        out.println("<TD> <FONT COLOR=\"red\">" + rs.getDate("date") + "</FONT></TD>");
        out.println("<TD> <FONT COLOR=\"red\">" + rs.getString("place") + "</FONT></TD>");
        out.println("</TR>");
    }while (rs.next());
} else {
    out.println("<TD> <FONT COLOR=\"red\">" + "結果がありません" + "</FONT></TD>");
}
%>
</TABLE>
</BODY>
</HTML>
<%
rs.close();
ps.close();
db.close();
%>