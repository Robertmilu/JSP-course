<%@ page contentType="text/html; charset=UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<%

request.setCharacterEncoding("UTF-8");

int year=Integer.parseInt(request.getParameter("year"));
int month=Integer.parseInt(request.getParameter("month")) - 1;

Calendar calendar = Calendar.getInstance();

int tyear = calendar.get(Calendar.YEAR);
int tmonth = calendar.get(Calendar.MONTH);
int tday = calendar.get(Calendar.DATE);

calendar.set(year, month, 1);
int startWeek = calendar.get(Calendar.DAY_OF_WEEK);

calendar.set(year, month, 0);
int beforeMonthlastDay = calendar.get(Calendar.DATE);

calendar.set(year, month + 1, 0);
int thisMonthlastDay = calendar.get(Calendar.DATE);

int[] calendarDay = new int[42];
int count = 0;
int index1 = 0;
int index2 = 0;

for (int i = startWeek - 2 ; i >= 0 ; i--){
  calendarDay[count++] = beforeMonthlastDay - i;
}

index1 = count;

for (int i = 1 ; i <= thisMonthlastDay ; i++){
  calendarDay[count++] = i;
}

index2 = count - 1;

int nextMonthDay = 1;
while (count % 7 != 0){
  calendarDay[count++] = nextMonthDay++;
}

int weekCount = count / 7;

%>


<html>
<head>
  <meta charset="utf-8">
  <title>カレンダー出力</title>
  <link rel="stylesheet"  href="B1-1.css">
</head>
<body>
  <div>
    <h1>カレンダー</h1>
    <table border="1">
      <tr>
        <th>日</th>
        <th>月</th>
        <th>火</th>
        <th>水</th>
        <th>木</th>
        <th>金</th>
        <th>土</th>
      </tr>
      <%
      if(year == tyear && month == tmonth)
      {
        for (int i = 0 ; i < weekCount ; i++)
        {
          out.print("<tr>");
            for (int j = i * 7 ; j < i * 7 + 7 ; j++)
            {
              if(j >= index1 && j <= index2)
              {
                if(calendarDay[j] == tday)
                {
                  out.print("<td style=font-size:80px>" + calendarDay[j] + "</td>");
                }
                else
                {
                  out.print("<td>" + calendarDay[j] + "</td>");
                }
              }
              else
              {
                out.print("<td></td>");
              }
            }
          out.print("</tr>");
        }
      }
      else
      {
        for (int i = 0 ; i < weekCount ; i++)
        {
          out.print("<tr>");
            for (int j = i * 7 ; j < i * 7 + 7 ; j++)
              if(j >= index1 && j <= index2)
              {
                out.print("<td>" + calendarDay[j] + "</td>");
              }
              else
              {
                out.print("<td></td>");
              }
          out.print("</tr>");
        }
      }

      %>
    </table>
  </div>
</body>
</html>
