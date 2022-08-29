<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML>
<HTML><HEAD>
<META CHARSET="UTF-8">
<TITLE>カレンシーコンバータ</TITLE>
</HEAD>
<BODY>
<FORM ACTION="A1-2-out.jsp" METHOD="Post">
入力画面<BR>
<TABLE>
<TR><TD>amount</TD><TD><INPUT TYPE="text" NAME="amount"></TD></TR>
<TR><TD>type</TD><TD><INPUT TYPE="radio" NAME="rate" value="139.89">eur</TD></TR>
<TR><TD>type</TD><TD><INPUT TYPE="radio" NAME="rate" value="128.15">usd</TD></TR>
<TR><TD>type</TD><TD><INPUT TYPE="radio" NAME="rate" value="102.76">cad</TD></TR>


</TABLE>
<INPUT TYPE="submit" VALUE="両替"><BR>
</FORM>
</BODY>
</HTML>