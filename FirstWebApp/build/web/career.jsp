<%@page import="java.sql.* ,java.io.* , java.util.*" %>
<%@page import="jakarta.servlet.http.Part" %>

<%
    String name = request.getParameter("name") ;
    String email = request.getParameter("email") ;
    String phone = request.getParameter("phone") ;
//    String message = request.getParameter("message");
    InputStream inputStream = null; 
    Part p = (Part) request.getPart("resume");
    out.println(name + "  " + email + "  " + phone);
    out.print(p);
    if(p != null){
    inputStream = p.getInputStream();
    }
    try{
        Class.forName("com.mysql.cj.jdbc.Driver") ;
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student?useSSL=false&user=root&password=Rajan2001@") ;
        String sql = "INSERT INTO imgupload (name, mail, phone,file) values (?, ?, ? ,?)";
        PreparedStatement statement = con.prepareStatement(sql);
        statement.setString(1, name);
        statement.setString(2, email);
        statement.setString(3, phone);
            // fetches input stream of the upload file for the blob column
        statement.setBlob(4, inputStream);
//        statement.setString(5, message);
        int i = statement.executeUpdate();
        if(i>0){
            out.println("Form submitted Successfully") ;
        }
        else{
            out.println("Form not submitted successfully");
        }
    }
    catch(Exception e){
        out.print(e);
    }   
%>
