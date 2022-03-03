<%-- 
    Document   : diaryEntry
    Created on : 10 Feb, 2022, 4:39:07 PM
    Author     : User
--%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>After_Resgister</title>
        <!link rel="stylesheet" href="stylesheet.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script crossorigin src="https://unpkg.com/react-dom@17/umd/react-dom.development.js"></script>
        <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>
        <script src="logic.js" type="text/babel">
            
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Diary Entered</title>
    </head>
    <body style="background-image: url(images1/diaryentry.jpg);background-size: cover">
        <%!private static final String q = "INSERT INTO DIARY(USERNAME,DT,DIARY,TIME) VALUES(?,?,?,?)";%>
        <%
            String diary = request.getParameter("diary");
            String uname = "";
            Cookie cookies[] = request.getCookies();
            for(Cookie c : cookies)
            {
                if(c.getName().equals("userName"))
                    uname = c.getValue();
            }
            response.setContentType("text/html;charset=UTF-8");
            %>
        <center><h1>Thank you</h1>
            <a href="index.html">Back to home</a></center>
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
                                    
                                        Date dNow = new Date( );
                                        SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
                                        SimpleDateFormat ft = new SimpleDateFormat("hh:mm");
                                        pst.setString(1,uname);
                                        pst.setString(2,dt.format(dNow).toString());
                                        pst.setString(3,diary);
                                        pst.setString(4,ft.format(dNow).toString());
                                        result=pst.executeUpdate();
                                    
                                }
                                
                                
                        }
                }
        }
        catch (SQLException se) {
                // TODO: handle exception
                if(se.getErrorCode()==0001)
                { %>
                    <center>
                        <h3>Your diary is entered for today. Please come back tomorrow....!!!</h3>
                        <h4><a href="login_options.jsp">click to view your today's diary</a> at this date.....</h4>
                    </center>
                    <%
                        }
                else
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
        <div class="fixed-bottom bg-dark text-center text-white">&copy; copyright 2022
                            <a href="index.html">Home</a></div>
    </body>
</html>
