/**
 * 
 */
package com.payrolladmin.server.classes;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Mahder on macbook Pro
 * 
 */
public class EmployeePayrollTypeMap {
	private long id;
	private long employeeId;
	private int payrollEmpTypeId;
	private int modifiedBy;
	private Date modificationDate;

	/**
	 * 
	 */
	public EmployeePayrollTypeMap() {
	}

	/**
	 * @param employeeId
	 * @param payrollEmpTypeId
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public EmployeePayrollTypeMap(long employeeId, int payrollEmpTypeId,
			int modifiedBy, Date modificationDate) {
		this.employeeId = employeeId;
		this.payrollEmpTypeId = payrollEmpTypeId;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}

	/**
	 * @param id
	 * @param employeeId
	 * @param payrollEmpTypeId
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public EmployeePayrollTypeMap(long id, long employeeId,
			int payrollEmpTypeId, int modifiedBy, Date modificationDate) {
		this.id = id;
		this.employeeId = employeeId;
		this.payrollEmpTypeId = payrollEmpTypeId;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}

	/**
	 * @return the id
	 */
	public long getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(long id) {
		this.id = id;
	}

	/**
	 * @return the employeeId
	 */
	public long getEmployeeId() {
		return employeeId;
	}

	/**
	 * @param employeeId
	 *            the employeeId to set
	 */
	public void setEmployeeId(long employeeId) {
		this.employeeId = employeeId;
	}

	/**
	 * @return the payrollEmpTypeId
	 */
	public int getPayrollEmpTypeId() {
		return payrollEmpTypeId;
	}

	/**
	 * @param payrollEmpTypeId
	 *            the payrollEmpTypeId to set
	 */
	public void setPayrollEmpTypeId(int payrollEmpTypeId) {
		this.payrollEmpTypeId = payrollEmpTypeId;
	}

	/**
	 * @return the modifiedBy
	 */
	public int getModifiedBy() {
		return modifiedBy;
	}

	/**
	 * @param modifiedBy
	 *            the modifiedBy to set
	 */
	public void setModifiedBy(int modifiedBy) {
		this.modifiedBy = modifiedBy;
	}

	/**
	 * @return the modificationDate
	 */
	public Date getModificationDate() {
		return modificationDate;
	}

	/**
	 * @param modificationDate
	 *            the modificationDate to set
	 */
	public void setModificationDate(Date modificationDate) {
		this.modificationDate = modificationDate;
	}

	public void save() {
		try {
			String sqlStr = "insert into tbl_employee_payroll_type_map values(?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, 0);
			pStmt.setLong(2, this.getEmployeeId());
			pStmt.setInt(3, this.getPayrollEmpTypeId());
			pStmt.setInt(4, this.getModifiedBy());
			pStmt.setDate(5, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void update(EmployeePayrollTypeMap employeePayrollTypeMap) {
		try {
			String sqlStr = "update tbl_employee_payroll_type_map set employee_id = ?, payroll_emp_type_id = ?," +
					"modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, employeePayrollTypeMap.getEmployeeId());
			pStmt.setInt(2, employeePayrollTypeMap.getPayrollEmpTypeId());
			pStmt.setInt(3, employeePayrollTypeMap.getModifiedBy());
			pStmt.setDate(4, employeePayrollTypeMap.getModificationDate());
			pStmt.setLong(5, employeePayrollTypeMap.getId());
			DBConnection.writeToDatabase(pStmt);			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(long id) {
		try {
			String sqlStr = "delete from tbl_employee_payroll_type_map where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<EmployeePayrollTypeMap> getAllEmployeePayrollTypeMaps() {
		List<EmployeePayrollTypeMap> list = new ArrayList<EmployeePayrollTypeMap>();
		EmployeePayrollTypeMap employeePayrollTypeMap = null;
		try {
			String query = "select * from tbl_employee_payroll_type_map order by modification_date desc";
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				employeePayrollTypeMap = new EmployeePayrollTypeMap(rSet.getLong("id"), rSet.getLong("employee_id"), 
						rSet.getInt("payroll_emp_type_id"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));
				list.add(employeePayrollTypeMap);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static List<Employee> getAllUnmappedEmployeeList(){
		List<Employee> list = new ArrayList<Employee>();
		Employee employee = null;
		try {
			String query = "SELECT * FROM tbl_employee WHERE tbl_employee.id NOT IN ( SELECT employee_id FROM tbl_employee_payroll_type_map)";
			ResultSet rSet = DBConnection.readFromDatabase(query);			
			while(rSet.next()){
				employee = new Employee(rSet.getLong("id"), rSet.getString("last_name"), 
						rSet.getString("first_name"),rSet.getString("middle_name"), 
						rSet.getString("maiden_name"), rSet.getDate("date_of_birth"), 
						rSet.getString("place_of_birth"),rSet.getString("nationality_at_birth"), 
						rSet.getString("present_nationality"),rSet.getString("sex"), 
						rSet.getString("marital_status"), rSet.getString("preferred_field_of_work"), 
						rSet.getString("list_of_professional_activities"), rSet.getString("list_of_publications"), 
						rSet.getString("employment_record"), rSet.getBoolean("object_contacting_present_employer"), 
						rSet.getBoolean("been_arrested"), rSet.getString("employee_category_type"),
						rSet.getBoolean("deleted"),rSet.getInt("modified_by"),rSet.getDate("modification_date"),
						rSet.getString("employee_id_number"));
				list.add(employee);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static EmployeePayrollTypeMap getEmployeePayrollTypeMap(long id) {
		EmployeePayrollTypeMap employeePayrollTypeMap = null;
		try {
			String query = "select * from tbl_employee_payroll_type_map where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				employeePayrollTypeMap = new EmployeePayrollTypeMap(rSet.getLong("id"), rSet.getLong("employee_id"), 
						rSet.getInt("payroll_emp_type_id"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return employeePayrollTypeMap;
	}
	
	public static List<Employee> getAllEmployeesOfThisPayrollEmpType(int payrollEmpTypeId){
		List<Employee> list = new ArrayList<Employee>();
		Employee employee = null;
		try {
			String query = "select tbl_employee.* from tbl_employee,tbl_employee_payroll_type_map where " +
					"tbl_employee.id = tbl_employee_payroll_type_map.employee_id and " +
					"tbl_employee_payroll_type_map.payroll_emp_type_id = "+payrollEmpTypeId+
					" order by first_name, middle_name, last_name";
			ResultSet rSet = DBConnection.readFromDatabase(query);			
			while(rSet.next()){
				employee = new Employee(rSet.getLong("id"), rSet.getString("last_name"), 
						rSet.getString("first_name"),rSet.getString("middle_name"), 
						rSet.getString("maiden_name"), rSet.getDate("date_of_birth"), 
						rSet.getString("place_of_birth"),rSet.getString("nationality_at_birth"), 
						rSet.getString("present_nationality"),rSet.getString("sex"), 
						rSet.getString("marital_status"), rSet.getString("preferred_field_of_work"), 
						rSet.getString("list_of_professional_activities"), rSet.getString("list_of_publications"), 
						rSet.getString("employment_record"), rSet.getBoolean("object_contacting_present_employer"), 
						rSet.getBoolean("been_arrested"), rSet.getString("employee_category_type"),
						rSet.getBoolean("deleted"),rSet.getInt("modified_by"),rSet.getDate("modification_date"),
						rSet.getString("employee_id_number"));
				list.add(employee);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static List<EmployeePayrollTypeMap> getAllLocallyRecruitedExpatTypesWhoseTaxPayrInfoNotDefined(int payrollEmpTypeId){
		List<EmployeePayrollTypeMap> list = new ArrayList<EmployeePayrollTypeMap>();
		EmployeePayrollTypeMap employeePayrollTypeMap = null;
		try{
			String query = "select * from tbl_employee_payroll_type_map where payroll_emp_type_id = "+
					payrollEmpTypeId+" and tbl_employee_payroll_type_map.employee_id NOT IN (select employee_id from tbl_who_is_tax_payer)";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				employeePayrollTypeMap = new EmployeePayrollTypeMap(rSet.getLong("id"), rSet.getLong("employee_id"), 
						rSet.getInt("payroll_emp_type_id"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));
				list.add(employeePayrollTypeMap);
			}			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static List<EmployeePayrollTypeMap> getAllExpatAndLocallyRecruitedEmployeesWhoDidNotHaveRetaintionInformation(
			long expatTypeId,long locallyRecruitedTypeId){
		List<EmployeePayrollTypeMap> list = new ArrayList<EmployeePayrollTypeMap>();
		EmployeePayrollTypeMap employeePayrollTypeMap = null;
		try {
			String query = "select * from tbl_employee_payroll_type_map where payroll_emp_type_id = "+
		expatTypeId+" and tbl_employee_payroll_type_map.employee_id NOT IN (select employee_id from tbl_retained_with_school) " +
				"union select * from tbl_employee_payroll_type_map where payroll_emp_type_id = "+
		locallyRecruitedTypeId+" and tbl_employee_payroll_type_map.employee_id NOT IN(select employee_id from tbl_retained_with_school)";
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				employeePayrollTypeMap = new EmployeePayrollTypeMap(rSet.getLong("id"), rSet.getLong("employee_id"), 
						rSet.getInt("payroll_emp_type_id"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));
				list.add(employeePayrollTypeMap);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
}// end class
