<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%!
	String str = "";
	private void tree(Connection conn,int id, int level){
		Statement stmt = null;
		ResultSet rs = null;
		String preStr = "";
		for (int i = 0; i< level ;i++ )
		{
			preStr += "----";
		}
		try {
			stmt = conn.createStatement();
			String sql = "select * from article where pid = " + id;
			rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				str += "<tr><td>" + rs.getInt("id") + "</td><td>"
						+ preStr  + "<a href ='ShowArticleDetail.jsp'>" + rs.getString("title") + "</a>"+ "</td></tr>";
				if(rs.getInt("isLeaf") != 0){
					tree(conn,rs.getInt("id"), level + 1);
				}
			}
		}catch(SQLException e){
			e.printStackTrace();			
		}finally
		{
			try{
				if(rs != null)
				{
					rs.close();
					rs = null;
				}
				if(stmt != null)
				{
					stmt.close();
					stmt = null;
				}
			}catch(SQLException e)
			{
				e.printStackTrace();
			}
		}
	
		
	}
%>
<%
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bbs", "root","password");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select * from article where pid = 0");
	while (rs.next()){
		str += "<tr><td>" + rs.getInt("id") + "</td><td>"
	    	+ "<a href = 'ShowArticleDetail.jsp'>"
			+ rs.getString("title") + "</a>" + "</td></tr>";
		if(rs.getInt("isleaf") != 0){
			tree(conn,rs.getInt("id"),1);
		}
	}
	rs.close();
	stmt.close();
	conn.close();	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border = "1">
<%=str %>
</table>
</body>
</html><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%!
	String str = "";
	private void tree(Connection conn,int id, int level){
		Statement stmt = null;
		ResultSet rs = null;
		String preStr = "";
		for (int i = 0; i< level ;i++ )
		{
			preStr += "----";
		}
		try {
			stmt = conn.createStatement();
			String sql = "select * from article where pid = " + id;
			rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				str += "<tr><td>" + rs.getInt("id") + "</td><td>"
						+ preStr  + "<a href ='ShowArticleDetail.jsp'>" + rs.getString("title") + "</a>"+ "</td></tr>";
				if(rs.getInt("isLeaf") != 0){
					tree(conn,rs.getInt("id"), level + 1);
				}
			}
		}catch(SQLException e){
			e.printStackTrace();			
		}finally
		{
			try{
				if(rs != null)
				{
					rs.close();
					rs = null;
				}
				if(stmt != null)
				{
					stmt.close();
					stmt = null;
				}
			}catch(SQLException e)
			{
				e.printStackTrace();
			}
		}
	
		
	}
%>
<%
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bbs", "root","password");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select * from article where pid = 0");
	while (rs.next()){
		str += "<tr><td>" + rs.getInt("id") + "</td><td>"
	    	+ "<a href = 'ShowArticleDetail.jsp'>"
			+ rs.getString("title") + "</a>" + "</td></tr>";
		if(rs.getInt("isleaf") != 0){
			tree(conn,rs.getInt("id"),1);
		}
	}
	rs.close();
	stmt.close();
	conn.close();	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border = "1">
<%=str %>
</table>
</body>
</html>
