<%@ page contentType="text/html; charset=UTF-8"
	import="java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");

String inid = request.getParameter("id");

//JDBCドライバの登録
Class.forName("com.mysql.jdbc.Driver"); 
//コネクションオブジェクトを取得
Connection db =DriverManager.getConnection("jdbc:mysql://localhost/stu0756?user=stu0756&password=stu0756");
//SQLコマンド文字列を作成
PreparedStatement ps = db.prepareStatement("delete from events where id = ?;");
ps.setString(1, inid);
//更新を実行
ps.executeUpdate();
%>
 

<!DOCTYPE HTML>
<HTML>
<HEAD>
<META CHARSET="UTF-8" />
<TITLE>削除しました</TITLE>
</HEAD>
<BODY>
<H1>削除しました</H1>
</BODY>
</HTML>
<%
ps.close();
db.close();
%>