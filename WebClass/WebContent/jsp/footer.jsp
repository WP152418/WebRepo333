<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calender" %>
    
 <%
 	Calender c = Calender.getInstance();
 %>
    
<footer class="footer">
      <div class="container">
        <span class="text-muted">&copt; <%= c.get(Calender.YEAR) %> mycompany. </span>
      </div>
    </footer>
