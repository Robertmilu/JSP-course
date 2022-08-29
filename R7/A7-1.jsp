<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML>
<HTML><HEAD>
<META CHARSET="UTF-8">
<TITLE>events</TITLE>
</HEAD>
<BODY>
<a href="http://dius01.ksc.kwansei.ac.jp/network/students22/stu0756/report/R6/A6-1.jsp" style="color: blue;">表示</a>
<a href="http://dius01.ksc.kwansei.ac.jp/network/students22/stu0756/report/R6/A6-2.jsp" style="color: blue;">追加</a>
<a href="http://dius01.ksc.kwansei.ac.jp/network/students22/stu0756/report/R6/A6-3.jsp" style="color: blue;">削除</a>
<FORM ACTION="A7-1-out.jsp" METHOD="Post">
入力画面<BR>
<TABLE>
<TR><TD>イベント名</TD><TD><INPUT TYPE="text" NAME="event"></TD></TR>
<TR><TD>年</TD><TD><INPUT TYPE="text" NAME="year"></TD></TR>
<TR><TD>月</TD><TD><INPUT TYPE="text" NAME="month"></TD></TR>
<TR><TD>日</TD><TD><INPUT TYPE="text" NAME="day"></TD></TR>
<TR><TD>場所名</TD><TD><INPUT TYPE="text" NAME="place"></TD></TR>
</TABLE>
<INPUT TYPE="submit" NAME="command" VALUE="イベント名検索"><BR>
<INPUT TYPE="submit" NAME="command" VALUE="日付検索"><BR>
<INPUT TYPE="submit" NAME="command" VALUE="場所検索"><BR>
</FORM>
</BODY>
</HTML>