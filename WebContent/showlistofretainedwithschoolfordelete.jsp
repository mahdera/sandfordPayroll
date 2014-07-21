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
					<td>Delete</td>
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
								<a href="#.jsp" onclick="deleteThisRetainedWithSchool(<%=retainedWithSchool.getId() %>);">Delete</a>								
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
	function deleteThisRetainedWithSchool(retainedWithSchoolId){
		if(window.confirm('Are you sure you want to delete this retained with school record?')){
			var dataString = "retainedWithSchoolId="+retainedWithSchoolId;
			$.ajax({
			    url: 'deleteretainedwithschool.jsp',		
			    data: dataString,
			    type:'POST',
			    success:function(response){
			    		$('#subTabDetailDiv').load('showlistofretainedwithschoolfordelete.jsp');					
			    },
			    error:function(error){
					alert(error);
			    }
			});
		}
	}	
</script>