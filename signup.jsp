<%-- 
    Document   : signup
    Created on : 26 Jan, 2022, 1:29:09 AM
    Author     : Arijit
--%>

<%-- 
    Document   : register
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
<%!private static final String q = "INSERT INTO USERS VALUES(?,?,?,?,SNO.NEXTVAL)"; %>
<%
Scanner sc = null;
Connection con = null;
PreparedStatement pst = null;
//ResultSet rs = null;
int result = 0;
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
					//System.out.println("Enter your First Name::");
					String firstName = request.getParameter("input2");
					//System.out.println("Enter your Last Name");
					String lastName = request.getParameter("input3");
					//System.out.println("Create an USERNAME::");
					String userName = request.getParameter("input4");
					//System.out.println("Create a PASSWORD::");
					String passWord = request.getParameter("input5");
					pst.setString(1,firstName);
					pst.setString(2,lastName);
                                        pst.setString(3,userName);
					pst.setString(4,passWord);
					result = pst.executeUpdate();
					//System.out.println(rs.next());
					if(result>0)
                                        {
						//out.println("User Registered :"+firstName);
                                            Cookie cookie = new Cookie("userName",userName);
                                            response.addCookie(cookie);
                                            response.sendRedirect("dairy.jsp");
                                        }
					
				} while (result==0);
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

</body>
</html>



