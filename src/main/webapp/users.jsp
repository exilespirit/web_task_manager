<%@ page import="java.sql.*" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>

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
       Class.forName("com.mysql.jdbc.Driver");
       String query="select * from users";
       Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/TaskManager?" +
                                   "user=root&password=ShallNotPass1");
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