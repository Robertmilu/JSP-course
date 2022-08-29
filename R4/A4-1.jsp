<%@ page contentType="text/html;charset=UTF-8"
	import="java.io.*, java.util.*"%>

<!DOCTYPE HTML>
<HTML>
<HEAD>
<META CHARSET="UTF-8" />
<TITLE>イベント一覧</TITLE>
</HEAD>
<BODY>
	<TABLE BORDER="1">
		<TR>
			<TH>日付</TH>
			<TH>イベント名</TH>
		</TR>
		<%
			Calendar now = new GregorianCalendar();
			InputStreamReader reader = new InputStreamReader(
					new FileInputStream(application.getRealPath("/WEB-INF/data.txt")), "UTF-8");
			BufferedReader buf = new BufferedReader(reader);
			while (buf.ready()) {
				String line = buf.readLine();
				out.println("<TR>");
				String[] token = line.split(",");
				for (int i = 0; i < token.length; i++) {
					String[] date = token[0].split("/");
					String evyear = date[0];
					String evmonth = date[1];
					String evday = date[2];
					
					int intyear=Integer.parseInt(evyear);
					int intmonth=Integer.parseInt(evmonth);
					int intday=Integer.parseInt(evday);
					
					Calendar eventday=new GregorianCalendar(intyear, intmonth-1, intday);
					long remain = (eventday.getTimeInMillis() - now.getTimeInMillis())/1000/60/60/24;
					
					if(remain <= 0){
						out.println("<TD><FONT COLOR=\"red\">" + token[i] + "</FONT></TD>");
					}
					else{
						out.println("<TD><FONT COLOR=\"blue\">" + token[i] + "</FONT></TD>");
					}
				}
				out.println("</TR>");
			}
			buf.close();
		%>
	</>
</BODY>
</HTML>