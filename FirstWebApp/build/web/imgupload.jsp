<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%
    String name = request.getParameter("name");
    String mail = request.getParameter("email");
    String img = request.getParameter("img");
    
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","Rajan2001@");
        Statement st = con.createStatement();
        String query = "insert into imgupload (name,mail,img) values ('"+name+"','"+mail+"','"+img+"')";
        ResultSet rs = st.executeQuery(query);
        if(rs.next()){
            out.println("Uploaded Successfully");
            response.sendRedirect("career.html");
        }
        else{
            out.println("upload failed...");
            response.sendRedirect("uploadpic.html");
        }
    }
    catch(Exception e){
        System.out.println(e) ;
    }
    
%>
