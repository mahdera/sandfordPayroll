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
public class ExpatTeachersUsdPayrollSheet {
	private long id;
	private long payrollId;
	private long employeeId;
	private float basicSalary;
	private float responsibilityAllowance;
	private float grossSalary;	
	private float convertedIntoBirr;
	private float advanceAndLoans;
	private float retainedWithSchool;
	private float telFaxElect;
	private float totalDeduction;
	private float netPay;
	private int modifiedBy;
	private Date modificationDate;

	/**
	 * 
	 */
	public ExpatTeachersUsdPayrollSheet() {
	}

	/**
	 * @param payrollId
	 * @param employeeId
	 * @param basicSalary
	 * @param responsibilityAllowance
	 * @param grossSalary	 
	 * @param convertedIntoBirr
	 * @param advanceAndLoans
	 * @param retainedWithSchool
	 * @param telFaxElect
	 * @param totalDeduction
	 * @param netPay
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public ExpatTeachersUsdPayrollSheet(long payrollId, long employeeId,
			float basicSalary, float responsibilityAllowance,
			float grossSalary, float convertedIntoBirr,
			float advanceAndLoans, float retainedWithSchool, float telFaxElect,
			float totalDeduction, float netPay, int modifiedBy,
			Date modificationDate) {
		this.payrollId = payrollId;
		this.employeeId = employeeId;
		this.basicSalary = basicSalary;
		this.responsibilityAllowance = responsibilityAllowance;
		this.grossSalary = grossSalary;		
		this.convertedIntoBirr = convertedIntoBirr;
		this.advanceAndLoans = advanceAndLoans;
		this.retainedWithSchool = retainedWithSchool;
		this.telFaxElect = telFaxElect;
		this.totalDeduction = totalDeduction;
		this.netPay = netPay;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}

	/**
	 * @param id
	 * @param payrollId
	 * @param employeeId
	 * @param basicSalary
	 * @param responsibilityAllowance
	 * @param grossSalary	 
	 * @param convertedIntoBirr
	 * @param advanceAndLoans
	 * @param retainedWithSchool
	 * @param telFaxElect
	 * @param totalDeduction
	 * @param netPay
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public ExpatTeachersUsdPayrollSheet(long id, long payrollId,
			long employeeId, float basicSalary, float responsibilityAllowance,
			float grossSalary, float convertedIntoBirr,
			float advanceAndLoans, float retainedWithSchool, float telFaxElect,
			float totalDeduction, float netPay, int modifiedBy,
			Date modificationDate) {
		this.id = id;
		this.payrollId = payrollId;
		this.employeeId = employeeId;
		this.basicSalary = basicSalary;
		this.responsibilityAllowance = responsibilityAllowance;
		this.grossSalary = grossSalary;		
		this.convertedIntoBirr = convertedIntoBirr;
		this.advanceAndLoans = advanceAndLoans;
		this.retainedWithSchool = retainedWithSchool;
		this.telFaxElect = telFaxElect;
		this.totalDeduction = totalDeduction;
		this.netPay = netPay;
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
	 * @return the payrollId
	 */
	public long getPayrollId() {
		return payrollId;
	}

	/**
	 * @param payrollId
	 *            the payrollId to set
	 */
	public void setPayrollId(long payrollId) {
		this.payrollId = payrollId;
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
	 * @return the basicSalary
	 */
	public float getBasicSalary() {
		return basicSalary;
	}

	/**
	 * @param basicSalary
	 *            the basicSalary to set
	 */
	public void setBasicSalary(float basicSalary) {
		this.basicSalary = basicSalary;
	}

	/**
	 * @return the responsibilityAllowance
	 */
	public float getResponsibilityAllowance() {
		return responsibilityAllowance;
	}

	/**
	 * @param responsibilityAllowance
	 *            the responsibilityAllowance to set
	 */
	public void setResponsibilityAllowance(float responsibilityAllowance) {
		this.responsibilityAllowance = responsibilityAllowance;
	}

	/**
	 * @return the grossSalary
	 */
	public float getGrossSalary() {
		return grossSalary;
	}

	/**
	 * @param grossSalary
	 *            the grossSalary to set
	 */
	public void setGrossSalary(float grossSalary) {
		this.grossSalary = grossSalary;
	}

	/**
	 * @return the convertedIntoBirr
	 */
	public float getConvertedIntoBirr() {
		return convertedIntoBirr;
	}

	/**
	 * @param convertedIntoBirr
	 *            the convertedIntoBirr to set
	 */
	public void setConvertedIntoBirr(float convertedIntoBirr) {
		this.convertedIntoBirr = convertedIntoBirr;
	}

	/**
	 * @return the advanceAndLoans
	 */
	public float getAdvanceAndLoans() {
		return advanceAndLoans;
	}

	/**
	 * @param advanceAndLoans
	 *            the advanceAndLoans to set
	 */
	public void setAdvanceAndLoans(float advanceAndLoans) {
		this.advanceAndLoans = advanceAndLoans;
	}

	/**
	 * @return the retainedWithSchool
	 */
	public float getRetainedWithSchool() {
		return retainedWithSchool;
	}

	/**
	 * @param retainedWithSchool
	 *            the retainedWithSchool to set
	 */
	public void setRetainedWithSchool(float retainedWithSchool) {
		this.retainedWithSchool = retainedWithSchool;
	}

	/**
	 * @return the telFaxElect
	 */
	public float getTelFaxElect() {
		return telFaxElect;
	}

	/**
	 * @param telFaxElect
	 *            the telFaxElect to set
	 */
	public void setTelFaxElect(float telFaxElect) {
		this.telFaxElect = telFaxElect;
	}

	/**
	 * @return the totalDeduction
	 */
	public float getTotalDeduction() {
		return totalDeduction;
	}

	/**
	 * @param totalDeduction
	 *            the totalDeduction to set
	 */
	public void setTotalDeduction(float totalDeduction) {
		this.totalDeduction = totalDeduction;
	}

	/**
	 * @return the netPay
	 */
	public float getNetPay() {
		return netPay;
	}

	/**
	 * @param netPay
	 *            the netPay to set
	 */
	public void setNetPay(float netPay) {
		this.netPay = netPay;
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
			String sqlStr = "insert into tbl_expat_teachers_usd_payroll_sheet values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, 0);
			pStmt.setLong(2, this.getPayrollId());
			pStmt.setLong(3, this.getEmployeeId());
			pStmt.setFloat(4, this.getBasicSalary());
			pStmt.setFloat(5, this.getResponsibilityAllowance());
			pStmt.setFloat(6, this.getGrossSalary());			
			pStmt.setFloat(7, this.getConvertedIntoBirr());
			pStmt.setFloat(8, this.getAdvanceAndLoans());
			pStmt.setFloat(9, this.getRetainedWithSchool());
			pStmt.setFloat(10, this.getTelFaxElect());
			pStmt.setFloat(11, this.getTotalDeduction());
			pStmt.setFloat(12, this.getNetPay());
			pStmt.setInt(13, this.getModifiedBy());
			pStmt.setDate(14, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void update(ExpatTeachersUsdPayrollSheet expatTeachersUsdPayrollSheet){
		try{
			String sqlStr = "update tbl_expat_teachers_usd_payroll_sheet set payroll_id = ?," +
					"employee_id = ?, basic_salary = ?, responsibility_allowance = ?, gross_salary = ?," +
					"converted_into_birr = ?, advance_and_loans = ?, retained_with_school = ?," +
					"tel_fax_elect = ?, total_deductions = ?, net_pay = ?, modified_by = ?," +
					"modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, expatTeachersUsdPayrollSheet.getPayrollId());
			pStmt.setLong(2, expatTeachersUsdPayrollSheet.getEmployeeId());
			pStmt.setFloat(3, expatTeachersUsdPayrollSheet.getBasicSalary());
			pStmt.setFloat(4, expatTeachersUsdPayrollSheet.getResponsibilityAllowance());
			pStmt.setFloat(5, expatTeachersUsdPayrollSheet.getGrossSalary());
			pStmt.setFloat(6, expatTeachersUsdPayrollSheet.getConvertedIntoBirr());
			pStmt.setFloat(7, expatTeachersUsdPayrollSheet.getAdvanceAndLoans());
			pStmt.setFloat(8, expatTeachersUsdPayrollSheet.getRetainedWithSchool());
			pStmt.setFloat(9, expatTeachersUsdPayrollSheet.getTelFaxElect());
			pStmt.setFloat(10, expatTeachersUsdPayrollSheet.getTotalDeduction());
			pStmt.setFloat(11, expatTeachersUsdPayrollSheet.getNetPay());
			pStmt.setInt(12, expatTeachersUsdPayrollSheet.getModifiedBy());
			pStmt.setDate(13, expatTeachersUsdPayrollSheet.getModificationDate());
			pStmt.setLong(14, expatTeachersUsdPayrollSheet.getId());
			DBConnection.writeToDatabase(pStmt);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(long id) {
		try {
			String sqlStr = "delete from tbl_expat_teachers_usd_payroll_sheet where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<ExpatTeachersUsdPayrollSheet> getAllExpatTeachersUsdPayrollSheets() {
		List<ExpatTeachersUsdPayrollSheet> list = new ArrayList<ExpatTeachersUsdPayrollSheet>();
		ExpatTeachersUsdPayrollSheet expatTeacherUsdPayrollSheet = null;
		try {
			String query = "select * from tbl_expat_teachers_usd_payroll_sheet order by modification_date desc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				expatTeacherUsdPayrollSheet = new ExpatTeachersUsdPayrollSheet(rSet.getLong("id"),rSet.getLong("payroll_id"), rSet.getLong("employee_id"), 
						rSet.getFloat("basic_salary"), rSet.getFloat("responsibility_allowance"), rSet.getFloat("gross_salary"), 
						rSet.getFloat("converted_into_birr"), rSet.getFloat("advance_and_loans"), 
						rSet.getFloat("retained_with_school"), rSet.getFloat("tel_fax_elect"), rSet.getFloat("total_deductions"), 
						rSet.getFloat("net_pay"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));
				list.add(expatTeacherUsdPayrollSheet);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static ExpatTeachersUsdPayrollSheet getExpatTeachersUsdPayrollSheet(long id) {
		ExpatTeachersUsdPayrollSheet expatTeacherUsdPayrollSheet = null;
		try {
			String query = "select * from tbl_expat_teachers_usd_payroll_sheet where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				expatTeacherUsdPayrollSheet = new ExpatTeachersUsdPayrollSheet(rSet.getLong("id"),rSet.getLong("payroll_id"), rSet.getLong("employee_id"), 
						rSet.getFloat("basic_salary"), rSet.getFloat("responsibility_allowance"), rSet.getFloat("gross_salary"), 
						rSet.getFloat("converted_into_birr"), rSet.getFloat("advance_and_loans"), 
						rSet.getFloat("retained_with_school"), rSet.getFloat("tel_fax_elect"), rSet.getFloat("total_deductions"), 
						rSet.getFloat("net_pay"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return expatTeacherUsdPayrollSheet;
	}
	
	public static List<ExpatTeachersUsdPayrollSheet> getAllExpatTeachersUsdPayrollSheetsForThisPayroll(long payrollId){
		List<ExpatTeachersUsdPayrollSheet> list = new ArrayList<ExpatTeachersUsdPayrollSheet>();
		ExpatTeachersUsdPayrollSheet expatTeacherUsdPayrollSheet = null;
		try {
			String query = "select tbl_expat_teachers_usd_payroll_sheet.*,tbl_employee.first_name from tbl_expat_teachers_usd_payroll_sheet,tbl_employee where payroll_id = "+payrollId+" and tbl_employee.id = " +
					"tbl_expat_teachers_usd_payroll_sheet.employee_id order by first_name, last_name asc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				expatTeacherUsdPayrollSheet = new ExpatTeachersUsdPayrollSheet(rSet.getLong("tbl_expat_teachers_usd_payroll_sheet.id"),rSet.getLong("payroll_id"), rSet.getLong("employee_id"), 
						rSet.getFloat("basic_salary"), rSet.getFloat("responsibility_allowance"), rSet.getFloat("gross_salary"), 
						rSet.getFloat("converted_into_birr"), rSet.getFloat("advance_and_loans"), 
						rSet.getFloat("retained_with_school"), rSet.getFloat("tel_fax_elect"), rSet.getFloat("total_deductions"), 
						rSet.getFloat("net_pay"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));
				list.add(expatTeacherUsdPayrollSheet);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
}// end class
