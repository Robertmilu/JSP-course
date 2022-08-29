<%@ page contentType="text/html; charset=UTF-8"
	import="java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");

String inevent = request.getParameter("event");
String inplace = request.getParameter("place");
String inyear = request.getParameter("year");
String inmonth = request.getParameter("month");
String inday = request.getParameter("day");

String strdate = inyear + "-" + inmonth + "-" + inday;
Date sqldate= Date.valueOf(strdate);

//JDBCドライバの登録
Class.forName("com.mysql.jdbc.Driver"); 
//コネクションオブジェクトを取得
Connection db =DriverManager.getConnection("jdbc:mysql://localhost/stu0756?user=stu0756&password=stu0756");
//SQLコマンド文字列を作成
PreparedStatement ps = db.prepareStatement("INSERT INTO events(name, date, place) VALUES(?, ?, ?);");
ps.setString(1, inevent);
ps.setDate(2, sqldate);
ps.setString(3, inplace);
//更新を実行
ps.executeUpdate();
%>
 

<!DOCTYPE HTML>
<HTML>
<HEAD>
<META CHARSET="UTF-8" />
<TITLE>登録しました</TITLE>
</HEAD>
<BODY>
<H1>登録しました</H1>
</BODY>
</HTML>
<%
ps.close();
db.close();
%>