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
public class LocallyRecruitedExpatPayrollSheet {
	private long id;
	private long payrollId;
	private long employeeId;
	private float basicSalary;
	private float providentFund;
	private float transportationAllowance;
	private float responsibilityAllowance;
	private float grossSalary;
	private float incomeTaxExp;
	private float advanceAndLoans;	
	private float otherDeductions;
	private float incomeTax;
	private float telAndFax;
	private float retainedWithSchool;
	private float totalDeduction;
	private float netPay;
	private int modifiedBy;
	private Date modificationDate;	

	/**
	 * 
	 */
	public LocallyRecruitedExpatPayrollSheet() {
	}
	
	

	/**
	 * @param payrollId
	 * @param employeeId
	 * @param basicSalary
	 * @param providentFund
	 * @param transportationAllowance
	 * @param responsibilityAllowance
	 * @param grossSalary
	 * @param incomeTaxExp
	 * @param advanceAndLoans
	 * @param otherDeductions
	 * @param incomeTax
	 * @param telAndFax
	 * @param retainedWithSchool
	 * @param totalDeduction
	 * @param netPay
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public LocallyRecruitedExpatPayrollSheet(long payrollId, long employeeId,
			float basicSalary, float providentFund,
			float transportationAllowance, float responsibilityAllowance,
			float grossSalary, float incomeTaxExp, float advanceAndLoans,
			float otherDeductions, float incomeTax, float telAndFax,
			float retainedWithSchool, float totalDeduction, float netPay,
			int modifiedBy, Date modificationDate) {
		this.payrollId = payrollId;
		this.employeeId = employeeId;
		this.basicSalary = basicSalary;
		this.providentFund = providentFund;
		this.transportationAllowance = transportationAllowance;
		this.responsibilityAllowance = responsibilityAllowance;
		this.grossSalary = grossSalary;
		this.incomeTaxExp = incomeTaxExp;
		this.advanceAndLoans = advanceAndLoans;
		this.otherDeductions = otherDeductions;
		this.incomeTax = incomeTax;
		this.telAndFax = telAndFax;
		this.retainedWithSchool = retainedWithSchool;
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
	 * @param providentFund
	 * @param transportationAllowance
	 * @param responsibilityAllowance
	 * @param grossSalary
	 * @param incomeTaxExp
	 * @param advanceAndLoans
	 * @param otherDeductions
	 * @param incomeTax
	 * @param telAndFax
	 * @param retainedWithSchool
	 * @param totalDeduction
	 * @param netPay
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public LocallyRecruitedExpatPayrollSheet(long id, long payrollId,
			long employeeId, float basicSalary, float providentFund,
			float transportationAllowance, float responsibilityAllowance,
			float grossSalary, float incomeTaxExp, float advanceAndLoans,
			float otherDeductions, float incomeTax, float telAndFax,
			float retainedWithSchool, float totalDeduction, float netPay,
			int modifiedBy, Date modificationDate) {
		this.id = id;
		this.payrollId = payrollId;
		this.employeeId = employeeId;
		this.basicSalary = basicSalary;
		this.providentFund = providentFund;
		this.transportationAllowance = transportationAllowance;
		this.responsibilityAllowance = responsibilityAllowance;
		this.grossSalary = grossSalary;
		this.incomeTaxExp = incomeTaxExp;
		this.advanceAndLoans = advanceAndLoans;
		this.otherDeductions = otherDeductions;
		this.incomeTax = incomeTax;
		this.telAndFax = telAndFax;
		this.retainedWithSchool = retainedWithSchool;
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
	 * @param id the id to set
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
	 * @param payrollId the payrollId to set
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
	 * @param employeeId the employeeId to set
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
	 * @param basicSalary the basicSalary to set
	 */
	public void setBasicSalary(float basicSalary) {
		this.basicSalary = basicSalary;
	}



	/**
	 * @return the providentFund
	 */
	public float getProvidentFund() {
		return providentFund;
	}



	/**
	 * @param providentFund the providentFund to set
	 */
	public void setProvidentFund(float providentFund) {
		this.providentFund = providentFund;
	}



	/**
	 * @return the transportationAllowance
	 */
	public float getTransportationAllowance() {
		return transportationAllowance;
	}



	/**
	 * @param transportationAllowance the transportationAllowance to set
	 */
	public void setTransportationAllowance(float transportationAllowance) {
		this.transportationAllowance = transportationAllowance;
	}



	/**
	 * @return the responsibilityAllowance
	 */
	public float getResponsibilityAllowance() {
		return responsibilityAllowance;
	}



	/**
	 * @param responsibilityAllowance the responsibilityAllowance to set
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
	 * @param grossSalary the grossSalary to set
	 */
	public void setGrossSalary(float grossSalary) {
		this.grossSalary = grossSalary;
	}



	/**
	 * @return the incomeTaxExp
	 */
	public float getIncomeTaxExp() {
		return incomeTaxExp;
	}



	/**
	 * @param incomeTaxExp the incomeTaxExp to set
	 */
	public void setIncomeTaxExp(float incomeTaxExp) {
		this.incomeTaxExp = incomeTaxExp;
	}



	/**
	 * @return the advanceAndLoans
	 */
	public float getAdvanceAndLoans() {
		return advanceAndLoans;
	}



	/**
	 * @param advanceAndLoans the advanceAndLoans to set
	 */
	public void setAdvanceAndLoans(float advanceAndLoans) {
		this.advanceAndLoans = advanceAndLoans;
	}



	/**
	 * @return the otherDeductions
	 */
	public float getOtherDeductions() {
		return otherDeductions;
	}



	/**
	 * @param otherDeductions the otherDeductions to set
	 */
	public void setOtherDeductions(float otherDeductions) {
		this.otherDeductions = otherDeductions;
	}



	/**
	 * @return the incomeTax
	 */
	public float getIncomeTax() {
		return incomeTax;
	}



	/**
	 * @param incomeTax the incomeTax to set
	 */
	public void setIncomeTax(float incomeTax) {
		this.incomeTax = incomeTax;
	}



	/**
	 * @return the telAndFax
	 */
	public float getTelAndFax() {
		return telAndFax;
	}



	/**
	 * @param telAndFax the telAndFax to set
	 */
	public void setTelAndFax(float telAndFax) {
		this.telAndFax = telAndFax;
	}



	/**
	 * @return the retainedWithSchool
	 */
	public float getRetainedWithSchool() {
		return retainedWithSchool;
	}



	/**
	 * @param retainedWithSchool the retainedWithSchool to set
	 */
	public void setRetainedWithSchool(float retainedWithSchool) {
		this.retainedWithSchool = retainedWithSchool;
	}



	/**
	 * @return the totalDeduction
	 */
	public float getTotalDeduction() {
		return totalDeduction;
	}



	/**
	 * @param totalDeduction the totalDeduction to set
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
	 * @param netPay the netPay to set
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
	 * @param modifiedBy the modifiedBy to set
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
	 * @param modificationDate the modificationDate to set
	 */
	public void setModificationDate(Date modificationDate) {
		this.modificationDate = modificationDate;
	}



	public void save() {
		try {
			String sqlStr = "insert into tbl_locally_recruited_expat_payroll_sheet values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, 0);
			pStmt.setLong(2, this.getPayrollId());
			pStmt.setLong(3, this.getEmployeeId());
			pStmt.setFloat(4, this.getBasicSalary());
			pStmt.setFloat(5, this.getProvidentFund());
			pStmt.setFloat(6, this.getTransportationAllowance());
			pStmt.setFloat(7, this.getResponsibilityAllowance());
			pStmt.setFloat(8, this.getGrossSalary());
			pStmt.setFloat(9, this.getIncomeTaxExp());
			pStmt.setFloat(10, this.getAdvanceAndLoans());			
			pStmt.setFloat(11, this.getOtherDeductions());
			pStmt.setFloat(12, this.getIncomeTax());
			pStmt.setFloat(13, this.getTelAndFax());
			pStmt.setFloat(14, this.getRetainedWithSchool());
			pStmt.setFloat(15, this.getTotalDeduction());
			pStmt.setFloat(16, this.getNetPay());
			pStmt.setInt(17, this.getModifiedBy());
			pStmt.setDate(18, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(long id) {
		try {
			String sqlStr = "delete from tbl_locally_recruited_expat_payroll_sheet where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<LocallyRecruitedExpatPayrollSheet> getAllLocallyRecruitedExpatPayrollSheets() {
		List<LocallyRecruitedExpatPayrollSheet> list = new ArrayList<LocallyRecruitedExpatPayrollSheet>();
		LocallyRecruitedExpatPayrollSheet locallyRecruitedExpatPayrollSheet = null;
		try {
			String query = "select * from tbl_locally_recruited_expat_payroll_sheet order by modification_date desc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				locallyRecruitedExpatPayrollSheet = new LocallyRecruitedExpatPayrollSheet(rSet.getLong("id"),
						rSet.getLong("payroll_id"),rSet.getLong("employee_id"),rSet.getFloat("basic_salary"),
						rSet.getFloat("provident_fund"),rSet.getFloat("transportation_allowance"),
						rSet.getFloat("responsibility_allowance"),rSet.getFloat("gross_salary"),
						rSet.getFloat("income_tax_exp"),rSet.getFloat("advance_and_loans"),
						rSet.getFloat("other_deductions"),rSet.getFloat("income_tax"),rSet.getFloat("tel_and_fax"),
						rSet.getFloat("retained_with_school"),rSet.getFloat("total_deduction"),rSet.getFloat("net_pay"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(locallyRecruitedExpatPayrollSheet);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static LocallyRecruitedExpatPayrollSheet getLocallyRecruitedExpatPayrollSheet(
			long id) {
		LocallyRecruitedExpatPayrollSheet locallyRecruitedExpatPayrollSheet = null;
		try {
			String query = "select * from tbl_locally_recruited_expat_payroll_sheet where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				locallyRecruitedExpatPayrollSheet = new LocallyRecruitedExpatPayrollSheet(rSet.getLong("id"),
						rSet.getLong("payroll_id"),rSet.getLong("employee_id"),rSet.getFloat("basic_salary"),
						rSet.getFloat("provident_fund"),rSet.getFloat("transportation_allowance"),
						rSet.getFloat("responsibility_allowance"),rSet.getFloat("gross_salary"),
						rSet.getFloat("income_tax_exp"),rSet.getFloat("advance_and_loans"),
						rSet.getFloat("other_deductions"),rSet.getFloat("income_tax"),rSet.getFloat("tel_and_fax"),
						rSet.getFloat("retained_with_school"),rSet.getFloat("total_deduction"),rSet.getFloat("net_pay"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return locallyRecruitedExpatPayrollSheet;
	}
	
	public static LocallyRecruitedExpatPayrollSheet getAllLocallyRecruitedExpatPayrollSheetsForThisPayrollAndEmployee(long payrollId, long employeeId){
		LocallyRecruitedExpatPayrollSheet locallyRecruitedExpatPayrollSheet = null;
		try {
			String query = "select * from tbl_locally_recruited_expat_payroll_sheet where payroll_id = "+payrollId+" and employee_id = "+employeeId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				locallyRecruitedExpatPayrollSheet = new LocallyRecruitedExpatPayrollSheet(rSet.getLong("id"),
						rSet.getLong("payroll_id"),rSet.getLong("employee_id"),rSet.getFloat("basic_salary"),
						rSet.getFloat("provident_fund"),rSet.getFloat("transportation_allowance"),
						rSet.getFloat("responsibility_allowance"),rSet.getFloat("gross_salary"),
						rSet.getFloat("income_tax_exp"),rSet.getFloat("advance_and_loans"),
						rSet.getFloat("other_deductions"),rSet.getFloat("income_tax"),rSet.getFloat("tel_and_fax"),
						rSet.getFloat("retained_with_school"),rSet.getFloat("total_deduction"),rSet.getFloat("net_pay"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return locallyRecruitedExpatPayrollSheet;
	}
	
	public static List<LocallyRecruitedExpatPayrollSheet> getAllLocallyRecruitedExpatPayrollSheetsForThisPayroll(long payrollId){
		List<LocallyRecruitedExpatPayrollSheet> list = new ArrayList<LocallyRecruitedExpatPayrollSheet>();
		LocallyRecruitedExpatPayrollSheet locallyRecruitedExpatPayrollSheet = null;
		try {
			String query = "select tbl_locally_recruited_expat_payroll_sheet.*,tbl_employee.first_name from tbl_locally_recruited_expat_payroll_sheet,tbl_employee where payroll_id = "+payrollId+" and tbl_employee.id = " +
					"tbl_locally_recruited_expat_payroll_sheet.employee_id order by first_name, last_name asc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				locallyRecruitedExpatPayrollSheet = new LocallyRecruitedExpatPayrollSheet(rSet.getLong("id"),
						rSet.getLong("payroll_id"),rSet.getLong("employee_id"),rSet.getFloat("basic_salary"),
						rSet.getFloat("provident_fund"),rSet.getFloat("transportation_allowance"),
						rSet.getFloat("responsibility_allowance"),rSet.getFloat("gross_salary"),
						rSet.getFloat("income_tax_exp"),rSet.getFloat("advance_and_loans"),
						rSet.getFloat("other_deductions"),rSet.getFloat("income_tax"),rSet.getFloat("tel_and_fax"),
						rSet.getFloat("retained_with_school"),rSet.getFloat("total_deduction"),rSet.getFloat("net_pay"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(locallyRecruitedExpatPayrollSheet);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
}// end class
