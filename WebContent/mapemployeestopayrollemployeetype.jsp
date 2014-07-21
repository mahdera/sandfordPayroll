<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
<%@page import="java.sql.Date"%>
<%
	Account account = (Account) session.getAttribute("account");
	int modifiedBy = account.getUserId();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance();
	String currentDate = dateFormat.format(cal.getTime());
	Date modificationDate = Date.valueOf(currentDate);

	int employeeCount = Integer.parseInt(request.getParameter("employeeCount"));
	for(int i=1;i<=employeeCount;i++){
		String strEmpId = "empId" + i;
		String strPayrollEmpType = "payrollEmpType" + i;
		//now get the actual values...
		long employeeId = Long.parseLong(request.getParameter(strEmpId));
		int payrollEmpTypeId = Integer.parseInt(request.getParameter(strPayrollEmpType));
		if(employeeId != 0 && payrollEmpTypeId != 0){
			EmployeePayrollTypeMap employeePayrollTypeMap = new EmployeePayrollTypeMap(employeeId,payrollEmpTypeId,modifiedBy,modificationDate);
			employeePayrollTypeMap.save();
		}
	}//end for...loop
%>