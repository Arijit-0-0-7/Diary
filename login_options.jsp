<%-- 
    Document   : login_options
    Created on : 9 Feb, 2022, 11:23:41 PM
    Author     : User
--%>

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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Select the options....</title>
        <script type="text/javascript">
        </script>
    </head>
    <body style="background-color: burlywood;background-image: url(images1/login_option_background.jpg);background-size: cover">
        <%
            String username = "";
            Cookie cookies[] = request.getCookies();
            for(Cookie c : cookies)
            {
                if(c.getName().equals("userName"))
                    username = c.getValue();
            }
            Cookie cookie = new Cookie("username",username);
            response.addCookie(cookie);
            %>
    <center>
        <table style="background-color: transparent" width="500" height="800">
            <tr>
                <td>   
                <center><h3>Enter Date to search</h3>
                <form action="diary_view.jsp" method="get">
                    <h4>Enter date</h4>
                    <input type="date" name="birthday"><br>
                    <!--<h4>Enter username</h4>-->
                    <!input type="text" name="username"><br>
                    <input type="submit" value="submit">
                </form>
                </center>
                </td>
                <td>
                <center><h3>Enter Today's diary</h3>
                <form action="todaysDiary.jsp" method="get">
                    <input type="submit" id="submit" value="Write Today's Diary">
                </form>    
                </center> 
                </td>
            </tr>
        </table>
    </center>
    <div class="fixed-bottom bg-dark text-center text-white">&copy; copyright 2022
                            <a href="index.html">Home</a></div>
    </body>
</html>
