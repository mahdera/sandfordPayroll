<%@page import="com.payrolladmin.server.classes.*"%>
<%
	long retainedWithSchoolId = Long.parseLong(request.getParameter("retainedWithSchoolId"));
	RetainedWithSchool.delete(retainedWithSchoolId);
%>