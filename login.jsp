<%-- 
    Document   : login
    Created on : 20 Jan, 2022, 1:02:04 AM
    Author     : Arijit
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Scanner"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

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
<body>
<%!private static final String q = "SELECT COUNT(*) FROM USERS WHERE username=? AND pwd=?"; %>
<%
Scanner sc = null;
Connection con = null;
PreparedStatement pst = null;
ResultSet rs = null;

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
				do {
					//System.out.println("Enter the UserName::");
					String userName = request.getParameter("input1");
					//System.out.println("Enter the Password::");
					String passWord = request.getParameter("input2");
					
					pst.setString(1,userName);
					pst.setString(2,passWord);
					rs = pst.executeQuery();
					//System.out.println(rs.next());
					if(rs.next() && rs.getInt(1)>0)
                                        {
						Cookie cookie = new Cookie("userName",userName);
						response.addCookie(cookie);
						response.sendRedirect("login_options.jsp");
					}
					else
                                        {%>
                                        <center>
                                            <h3>Invalid Credential</h3>
                                            <a href="index.html">Back to Home</a>
                                        </center>
                                         <%       break;
                                        }
				} while (rs.getInt(1)==0);
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
%>
<div id="container" class="bg-success text-white text-center p-2">
                            &AMP; copy<br>
                            <a href="index.html">Home</a>
                        </div>
</body>
</html>
