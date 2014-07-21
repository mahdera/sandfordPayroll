/**
 * 
 */
package com.payrolladmin.server.classes;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Mahder on macbook Pro
 * 
 */
public class PayrollEmptype {
	private int id;
	private String employeeTypeName;

	/**
	 * 
	 */
	public PayrollEmptype() {
	}

	/**
	 * @param employeeTypeName
	 */
	public PayrollEmptype(String employeeTypeName) {
		this.employeeTypeName = employeeTypeName;
	}

	/**
	 * @param id
	 * @param employeeTypeName
	 */
	public PayrollEmptype(int id, String employeeTypeName) {
		this.id = id;
		this.employeeTypeName = employeeTypeName;
	}

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the employeeTypeName
	 */
	public String getEmployeeTypeName() {
		return employeeTypeName;
	}

	/**
	 * @param employeeTypeName
	 *            the employeeTypeName to set
	 */
	public void setEmployeeTypeName(String employeeTypeName) {
		this.employeeTypeName = employeeTypeName;
	}

	public void save() {
		try {
			String sqlStr = "insert into tbl_payroll_emp_type values(?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, 0);
			pStmt.setString(2, this.getEmployeeTypeName());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void update(PayrollEmptype payrollEmptype) {
		try {
			String sqlStr = "update tbl_payroll_emp_type set employee_type_name = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setString(1, payrollEmptype.getEmployeeTypeName());
			pStmt.setInt(2, payrollEmptype.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(int id) {
		try {
			String sqlStr = "delete from tbl_payroll_emp_type where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<PayrollEmptype> getAllPayrollEmptypes() {
		List<PayrollEmptype> list = new ArrayList<PayrollEmptype>();
		PayrollEmptype payrollEmptype = null;
		try {
			String query = "select * from tbl_payroll_emp_type order by employee_type_name asc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				payrollEmptype = new PayrollEmptype(rSet.getInt("id"), rSet.getString("employee_type_name"));
				list.add(payrollEmptype);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static PayrollEmptype getPayrollEmptype(int id) {
		PayrollEmptype payrollEmptype = null;
		try {
			String query = "select * from tbl_payroll_emp_type where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				payrollEmptype = new PayrollEmptype(rSet.getInt("id"), rSet.getString("employee_type_name"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return payrollEmptype;
	}
	
	public static PayrollEmptype getPayrollEmptypeForEmployeeType(String employeeTypeName){
		PayrollEmptype payrollEmptype = null;
		try {
			String query = "select * from tbl_payroll_emp_type where employee_type_name = '"+employeeTypeName+"'";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				payrollEmptype = new PayrollEmptype(rSet.getInt("id"), rSet.getString("employee_type_name"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return payrollEmptype;
	}
}// end class
