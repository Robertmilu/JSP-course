<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML>
<HTML><HEAD>
<META CHARSET="UTF-8">
<TITLE>テーブル places</TITLE>
</HEAD>
<BODY>
<p>使用説明:1.表示するなら入力が不要</p>
<p>2.追加するなら全部の空欄入力が必要</p>
<p>3.編集するなら全部の空欄入力が必要(場所名の編集が不可)</p>
<p>4.削除するなら最初の場所名だけ入力が必要</p>
<FORM ACTION="B6-1-out.jsp" METHOD="Post">
入力画面<BR>
<TABLE>
<TR><TD>場所名</TD><TD><INPUT TYPE="text" NAME="place"></TD></TR>
<TR><TD>国名</TD><TD><INPUT TYPE="text" NAME="nation"></TD></TR>
<TR><TD>緯度</TD><TD><INPUT TYPE="text" NAME="latitude"></TD></TR>
<TR><TD>経度</TD><TD><INPUT TYPE="text" NAME="longtitude"></TD></TR>
</TABLE>
<INPUT TYPE="submit" NAME="command" VALUE="show"><BR>
<INPUT TYPE="submit" NAME="command" VALUE="insert"><BR>
<INPUT TYPE="submit" NAME="command" VALUE="change"><BR>
<INPUT TYPE="submit" NAME="command" VALUE="delete"><BR>
</FORM>
</BODY>
</HTML>