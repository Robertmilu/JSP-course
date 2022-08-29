<%@ page contentType="text/html;charset=UTF-8"
	import="java.io.*, java.util.*, java.util.Map.Entry"%>

<!DOCTYPE HTML>

<%
    request.setCharacterEncoding("UTF-8");
    String order = request.getParameter("order");
    int order_Flag = -1;
    if(order != null)
    {
        if(order.equals("up")) order_Flag = 1;
        if(order.equals("down")) order_Flag = 0;
    }
%>

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
        if(order_Flag == -1)
        {
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
					Long remain = (eventday.getTimeInMillis() - now.getTimeInMillis())/1000/60/60/24;
					
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
        }

        else if(order_Flag == 0)
        {
            HashMap<String, Long> map = new HashMap<>();
			Calendar now = new GregorianCalendar();
			InputStreamReader reader = new InputStreamReader(
					new FileInputStream(application.getRealPath("/WEB-INF/data.txt")), "UTF-8");
			BufferedReader buf = new BufferedReader(reader);
			while (buf.ready()) {
				String line = buf.readLine();
				
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
					Long remain = (eventday.getTimeInMillis() - now.getTimeInMillis())/1000/60/60/24;
                    map.put(line, remain);
				}
			}
			buf.close();

            List<Entry<String, Long>> list_entries = new ArrayList<Entry<String, Long>>(map.entrySet());
            

            Collections.sort(list_entries, new Comparator<Entry<String, Long>>() {
                public int compare(Entry<String, Long> obj1, Entry<String, Long> obj2) {
                    return obj1.getValue().compareTo(obj2.getValue());
                }
            });

            for(Entry<String, Long> entry : list_entries) {
                String[] token1 = entry.getKey().split(",");
                out.println("<TR>");
                if(entry.getValue() <= 0){
                    out.println("<TD><FONT COLOR=\"red\">" + token1[0] + "</FONT></TD>");
                    out.println("<TD><FONT COLOR=\"red\">" + token1[1] + "</FONT></TD>");
                }
                else{
                    out.println("<TD><FONT COLOR=\"blue\">" + token1[0] + "</FONT></TD>");
                    out.println("<TD><FONT COLOR=\"blue\">" + token1[1] + "</FONT></TD>");
                }
                out.println("</TR>");
            }
        }

        else
        {
            HashMap<String, Long> map = new HashMap<>();
			Calendar now = new GregorianCalendar();
			InputStreamReader reader = new InputStreamReader(
					new FileInputStream(application.getRealPath("/WEB-INF/data.txt")), "UTF-8");
			BufferedReader buf = new BufferedReader(reader);
			while (buf.ready()) {
				String line = buf.readLine();
				
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
					Long remain = (eventday.getTimeInMillis() - now.getTimeInMillis())/1000/60/60/24;
                    map.put(line, remain);
				}
			}
			buf.close();

            List<Entry<String, Long>> list_entries = new ArrayList<Entry<String, Long>>(map.entrySet());
            

            Collections.sort(list_entries, new Comparator<Entry<String, Long>>() {
                public int compare(Entry<String, Long> obj1, Entry<String, Long> obj2)
                {
                    return obj2.getValue().compareTo(obj1.getValue());
                }
            });

            for(Entry<String, Long> entry : list_entries) {
                String[] token1 = entry.getKey().split(",");
                out.println("<TR>");
                if(entry.getValue() <= 0){
                    out.println("<TD><FONT COLOR=\"red\">" + token1[0] + "</FONT></TD>");
                    out.println("<TD><FONT COLOR=\"red\">" + token1[1] + "</FONT></TD>");
                }
                else{
                    out.println("<TD><FONT COLOR=\"blue\">" + token1[0] + "</FONT></TD>");
                    out.println("<TD><FONT COLOR=\"blue\">" + token1[1] + "</FONT></TD>");
                }
                out.println("</TR>");
            }
        }
		%>
	</>
<FORM ACTION="B4-1.jsp" METHOD="Post">
<INPUT TYPE="submit" NAME="order" VALUE="up"><BR>
<INPUT TYPE="submit" NAME="order" VALUE="down"><BR>
</FORM>
</BODY>
</HTML>