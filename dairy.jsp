<%-- 
    Document   : dairy
    Created on : 27 Jan, 2022, 1:13:52 AM
    Author     : Arijit
--%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>After_Resgister</title>
        <link rel="stylesheet" href="stylesheet.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script crossorigin src="https://unpkg.com/react-dom@17/umd/react-dom.development.js"></script>
        <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>
        <script src="logic.js" type="text/babel">
            
        </script>
    </head>
    <body style="background-image: url(images1/diary.jpg)">
        <form action="diaryEntry.jsp" method="get">
        <%
            String uname = "";
            Date dNow = new Date( );
            Cookie cookies[] = request.getCookies();
            for(Cookie c : cookies)
            {
                if(c.getName().equals("userName"))
                    uname = c.getValue();
            }
        %>
        <table width="100" cellspacing="5" cellpadding="10" style="background-color: transparent">
            <thead>
                <tr>
                    <th>
                         <%
                                
                                SimpleDateFormat ft = new SimpleDateFormat ("dd,E 'at' hh:mm");
                                out.print( "<h1 align=\"left\">" + ft.format(dNow) + "</h1>");   
                             %>
                        <div style="font-family: sans-serif;color: transparent;align-self: center"><h1>Dear Diary</h1></div></th>
                    <th align="right">
                        <%
                        SimpleDateFormat dt = new SimpleDateFormat ("yyyy-MM-dd");
                        out.print( "<h4 align=\"right\">" + dt.format(dNow) + "</h4>");
                        %>
                    </th>
            </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <div style="font-family: sans-serif;align-self: ">Dear Diary</div>   
                    </td>
                    <td style="color: blue;font-family: cursive">
                        <%
                            
                            out.println(uname);
                            Cookie cookie = new Cookie("uname",uname);
                            response.addCookie(cookie);
                        %>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <textarea rows="12" cols="180" name="diary" style="background-color: transparent" required>
                            <%
                                
                                %>
                        </textarea>
                    </td>
                </tr>
            </tbody>
        </table>
        <br>
        <input type="submit" value="submit">
        </form> 
                        <div class="fixed-bottom bg-dark text-center text-white">&copy; copyright 2022
                            <a href="index.html">Home</a></div>
    </body>
</html>
