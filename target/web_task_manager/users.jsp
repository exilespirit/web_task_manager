<%@ page import="java.sql.*" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>

<%@ page import="java.util.*" %>
<%@ page import="javax.naming.*" %>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.Context"   %>
<%@page import="javax.naming.InitialContext"   %>
<%@page import="javax.naming.NamingException"   %>
<%@page import="javax.sql.DataSource"   %>

<form method="post">

<table border="2">
   <tr>
        <td>User ID</td>
        <td>Name</td>
        <td>Username</td>
        <td>Password</td>
    </tr>
	
   <%
   try
   {
       InitialContext initContext = new InitialContext();
       Context envContext  = (Context)initContext.lookup("java:/comp/env");
       DataSource ds = (DataSource)envContext.lookup("jdbc/TaskManager");
       String query="select * from users";
       Connection conn=ds.getConnection();
       Statement stmt=conn.createStatement();
       ResultSet rs=stmt.executeQuery(query);
	   
       while(rs.next())
       {
   %>
			
	<tr>
		<td><%=rs.getInt("userID") %></td>
        <td><%=rs.getString("Name") %></td>
        <td><%=rs.getString("username") %></td>
        <td><%=rs.getString("Password") %></td>
	</tr>
   <%
       
	   }
   %>
   </table>
   <%
        rs.close();
        stmt.close();
        conn.close();
   }
   catch(Exception e)
   {
        e.printStackTrace();
		out.println("<h1> error: "+ e.getMessage()+"</h1>");
		
   }
   %>
</form>`