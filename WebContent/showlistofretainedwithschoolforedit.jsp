<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	List<RetainedWithSchool> retainedWithSchoolList = RetainedWithSchool.getAllRetainedWithSchools();
	if(!retainedWithSchoolList.isEmpty()){
		Iterator<RetainedWithSchool> retainedWithSchoolItr = retainedWithSchoolList.iterator();
		%>
			<table border="0" width="100%">
				<tr style="background:#eee;font-weight:bolder">
					<td>Ser.No</td>
					<td>Employee</td>
					<td>Percentage(%)</td>
					<td>Balance</td>
					<td>Edit</td>
				</tr>				
				<%
					int ctr=1;
					while(retainedWithSchoolItr.hasNext()){
						RetainedWithSchool retainedWithSchool = retainedWithSchoolItr.next();
						Employee employee = Employee.getEmployee(retainedWithSchool.getEmployeeId());
						String fullName = employee.getFirstName()+" "+employee.getMiddleName()+" "+employee.getLastName();
						%>
						<tr>
							<td><%=ctr++ %></td>
							<td><%=fullName %></td>
							<td><%=retainedWithSchool.getPercentValue() %></td>
							<td><%=retainedWithSchool.getBalance() %></td>
							<td>
								<a href="#.jsp" onclick="showEditFiedlsOfThisRetainedWithSchool(<%=retainedWithSchool.getId() %>);">Edit</a>
								|
								<a href="#.jsp" onclick="hideDiv(<%=retainedWithSchool.getId() %>);">Hide</a>
							</td>
						</tr>
						<%
							String divId = "retainedWithSchoolDetailDiv" + retainedWithSchool.getId();
						%>
						<tr>
							<td colspan="5">
								<div id="<%=divId%>"></div>
							</td>
						</tr>
						<%
					}//end while loop
				%>
			</table>
		<%
	}else{
		%>
			<p class="msg warning">There is/are no record saved in the database!</p>
		<%
	}
%>
<script type="text/javascript">
	function showEditFiedlsOfThisRetainedWithSchool(retainedWithSchoolId){
		var divId = "retainedWithSchoolDetailDiv" + retainedWithSchoolId;
		$('#'+divId).load('showeditfieldsofthisretainedwithschool.jsp?retainedWithSchoolId='+retainedWithSchoolId);
	}
	
	function hideDiv(retainedWithSchoolId){
		var divId = "retainedWithSchoolDetailDiv" + retainedWithSchoolId;
		$('#'+divId).html("");
	}
</script>