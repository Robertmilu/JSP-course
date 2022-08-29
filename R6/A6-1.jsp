<%@ page contentType="text/html; charset=UTF-8"
	import="java.sql.*, java.util.*" %>
<%
//JDBCドライバの登録
Class.forName("com.mysql.jdbc.Driver"); 
//コネクションオブジェクトを取得
Connection db =DriverManager.getConnection("jdbc:mysql://localhost/stu0756?user=stu0756&password=stu0756");
//SQLコマンド文字列を作成
PreparedStatement ps = db.prepareStatement("SELECT * FROM events");
//問い合わせを実行し、リザルトセットオブジェクトを取得
ResultSet rs= ps.executeQuery();
%>
 
<%
Calendar now = new GregorianCalendar();
long remain = 0;
%>

<!DOCTYPE HTML>
<HTML>
<HEAD>
<META CHARSET="UTF-8" />
<TITLE>JDBCテスト</TITLE>
</HEAD>
<BODY>
<H1>JDBCテスト</H1>
<TABLE BORDER="1">
<% while(rs.next()){
out.println("<TR>");

Calendar eventday = Calendar.getInstance();
eventday.setTime(rs.getDate("date"));
remain = (eventday.getTimeInMillis() - now.getTimeInMillis())/1000/60/60/24;

if(remain <= 0){
	out.println("<TD> <FONT COLOR=\"red\">" + rs.getInt("id") + "</FONT></TD>");
	out.println("<TD> <FONT COLOR=\"red\">" + rs.getString("name") + "</FONT></TD>");
	out.println("<TD> <FONT COLOR=\"red\">" + rs.getDate("date") + "</FONT></TD>");
	out.println("<TD> <FONT COLOR=\"red\">" + rs.getString("place") + "</FONT></TD>");
	out.println("</TR>");
}
else{
	out.println("<TD> <FONT COLOR=\"blue\">" + rs.getInt("id") + "</FONT></TD>");
	out.println("<TD> <FONT COLOR=\"blue\">" + rs.getString("name") + "</FONT></TD>");
	out.println("<TD> <FONT COLOR=\"blue\">" + rs.getDate("date") + "</FONT></TD>");
	out.println("<TD> <FONT COLOR=\"blue\">" + rs.getString("place") + "</FONT></TD>");
	out.println("</TR>");
}

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