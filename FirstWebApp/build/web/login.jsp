<%@page import="java.sql.*" %>
<%
   String emails = request.getParameter("email") ;
   String passwords =request.getParameter("password") ;
 
   try{
        Class.forName("com.mysql.cj.jdbc.Driver") ;
        String connectionString = "jdbc:mysql://localhost:3306/student?useSSL=false&user=root&password=Rajan2001@";
        Connection con = DriverManager.getConnection(connectionString) ;
        String query = "select * from register where email='" + emails + "'";
        PreparedStatement ps = con.prepareStatement("select * from register where email=? and password=?");
        ps.setString(1,emails) ;
        ps.setString(2,passwords) ;
        ResultSet rs = ps.executeQuery() ;
        if(rs.next()){
            out.print("<h2>Login Successfully ..</h2>");
            response.sendRedirect("careerPage.html") ;
        }
        else{
            out.println("Login failed") ;
            response.sendRedirect("login.jsp") ;
        }
    }
    catch(Exception e){
        System.out.println(e) ;
    }
%>