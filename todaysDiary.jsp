<%-- 
    Document   : todaysDiary
    Created on : 12 Feb, 2022, 3:09:39 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>

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
<meta charset="ISO-8859-1">
<title>Logged In</title>
</head>
<body style="background-image: url(images1/today_diary.jpg);background-size: cover">
<%!private static final String q = "SELECT COUNT(*) FROM DIARY WHERE USERNAME=? AND DT=?"; %>
<%
Scanner sc = null;
Connection con = null;
PreparedStatement pst = null;
ResultSet rs = null;
Date dNow = new Date();
int result = 0;
String diary = null;
String username = null;
Cookie cookies[] = request.getCookies();
for(Cookie c : cookies)
{
    if(c.getName().equals("userName"))
       username = c.getValue();
}
try { 
	sc = new Scanner(System.in);
	if(sc != null)
	{       //Registering the DB...
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		//Connecting with the DB...
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
		/*
                //Registering the DB...
		Class.forName("com.mysql.jdbc.Driver");
		
		//Connecting with the DB...
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/arijit","root","system");
		*/
                if(con != null)
		{
			//Creating prepared statement...
			pst = con.prepareStatement(q);
			
			if(pst != null)
			{
					//String username = request.getParameter("username");
					
					//String dt = request.getParameter("birthday").toString();
					//dt = "%"+dt+"%";
                            
                                    SimpleDateFormat dt = new SimpleDateFormat ("yyyy-MM-dd");
                                    //out.print( "<h4 align=\"right\">" + dt.format(dNow) + "</h4>");
                            
                                        pst.setString(1,username);
					pst.setString(2,dt.format(dNow).toString());
                                        
					rs = pst.executeQuery();
					if(rs.next() && rs.getInt(1)>0)
                                        {
                                            %>
<center>
    <h1>Get back to view your Diary</h1>
    <h3>
        <a href="login_options.jsp">select today's date</a> to view your Date.
    </h3>
</center>
                                            <%
                                        }
                                        else
                                        {
						Cookie cookie = new Cookie("username",username);
						response.addCookie(cookie);
						response.sendRedirect("dairy.jsp");
					}
                                            
                        }
		}
	}
}
catch (SQLException se) {
	// TODO: handle exception
	se.printStackTrace();
}
catch (Exception e) {
	// TODO: handle exception
	e.printStackTrace();
}
finally {
	try {
		if(pst != null)
			pst.close();
		if(con != null)
			con.close();
		if(sc != null)
			sc.close();
	}
	catch (SQLException e) {
		e.printStackTrace();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
}
%><div class="fixed-bottom bg-dark text-center text-white">&copy; copyright 2022
                            <a href="index.html">Home</a></div>
</body>
</html>

