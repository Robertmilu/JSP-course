<%@ page contentType="text/html; charset=UTF-8"
	import="java.sql.*, java.util.*" %>

<%
request.setCharacterEncoding("UTF-8");

String order = request.getParameter("command");
int order_Flag = -1;
if(order != null)
{
    if(order.equals("show")) order_Flag = 0;
    if(order.equals("insert")) order_Flag = 1;
    if(order.equals("change")) order_Flag = 2;
    if(order.equals("delete")) order_Flag = 3;
}

String inplace = request.getParameter("place");
String innation = request.getParameter("nation");
String inlatitude = request.getParameter("latitude");
String inlongtitude = request.getParameter("longtitude");

double dblatitude = 0.0;
double dblongtitude = 0.0;
if(!inlatitude.equals(""))
{
    dblatitude = Double.parseDouble(inlatitude);
    dblongtitude = Double.parseDouble(inlongtitude);
}


//JDBCドライバの登録
Class.forName("com.mysql.jdbc.Driver"); 
//コネクションオブジェクトを取得
Connection db =DriverManager.getConnection("jdbc:mysql://localhost/stu0756?user=stu0756&password=stu0756");

PreparedStatement ps = db.prepareStatement("SELECT * FROM places");
ResultSet rs = ps.executeQuery();

if(order_Flag == 0)
{
    ps = db.prepareStatement("SELECT * FROM places");

    rs = ps.executeQuery();
}

else if(order_Flag == 1)
{

    ps = db.prepareStatement("INSERT INTO places(place, nation, latitude, longitude) VALUES(?, ?, ?, ?);");
    ps.setString(1, inplace);
    ps.setString(2, innation);
    ps.setDouble(3, dblatitude);
    ps.setDouble(4, dblongtitude);

    ps.executeUpdate();
}

else if(order_Flag == 2)
{

    ps = db.prepareStatement("delete from places where place = ?;");
    ps.setString(1, inplace);
    ps.executeUpdate();

    ps = db.prepareStatement("INSERT INTO places(place, nation, latitude, longitude) VALUES(?, ?, ?, ?);");
    ps.setString(1, inplace);
    ps.setString(2, innation);
    ps.setDouble(3, dblatitude);
    ps.setDouble(4, dblongtitude);
    ps.executeUpdate();
}

else
{
    ps = db.prepareStatement("delete from places where place = ?;");
    ps.setString(1, inplace);
    //更新を実行
    ps.executeUpdate();
}

%>
 
<!DOCTYPE HTML>
<HTML>
<HEAD>
<META CHARSET="UTF-8" />
<TITLE>JDBC</TITLE>
</HEAD>
<BODY>
<H1>places</H1>
<TABLE BORDER="1">
<% 
if(order_Flag == 0)
{
    while(rs.next()){
        out.println("<TR>");
        out.println("<TD>" + rs.getString("place") + "</TD>");
        out.println("<TD>" + rs.getString("nation") + "</TD>");
        out.println("<TD>" + rs.getDouble("latitude") + "</TD>");
        out.println("<TD>" + rs.getDouble("longitude") + "</TD>");
        out.println("</TR>");

    }
}

else if(order_Flag == 1)
{
    out.println("<h1>追加しました</h1>");
}

else if(order_Flag == 2)
{
    out.println("<h1>変更しました</h1>");
}

else
{
    out.println("<h1>削除しました</h1>");
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