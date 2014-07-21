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
public class LocalTeachersPayrollSheet {
	private long id;
	private long payrollId;
	private long employeeId;
	private float basicSalary;
	private float overtime;
	private float retirementPfEr;
	private float allowanceOther;
	private float grossSalary;
	private float taxableIncome;
	private float incomeTax;
	private float retirementPfErDeduction;
	private float retirementPfEe;
	private float pension;
	private float loanPfLoan;
	private float other;
	private float creditAssociation;
	private float laborUnion;
	private float totalDeduction;
	private float netPay;
	private int modifiedBy;
	private Date modificationDate;

	/**
	 * 
	 */
	public LocalTeachersPayrollSheet() {
	}

	/**
	 * @param payrollId
	 * @param employeeId
	 * @param basicSalary
	 * @param overtime
	 * @param retirementPfEr
	 * @param allowanceOther
	 * @param grossSalary
	 * @param taxableIncome
	 * @param incomeTax
	 * @param retirementPfErDeduction
	 * @param retirementPfEe
	 * @param pension
	 * @param loanPfLoan
	 * @param other
	 * @param creditAssociation
	 * @param laborUnion
	 * @param totalDeduction
	 * @param netPay
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public LocalTeachersPayrollSheet(long payrollId, long employeeId,
			float basicSalary, float overtime, float retirementPfEr,
			float allowanceOther, float grossSalary, float taxableIncome,
			float incomeTax, float retirementPfErDeduction,
			float retirementPfEe, float pension, float loanPfLoan, float other,
			float creditAssociation, float laborUnion, float totalDeduction,
			float netPay, int modifiedBy, Date modificationDate) {
		this.payrollId = payrollId;
		this.employeeId = employeeId;
		this.basicSalary = basicSalary;
		this.overtime = overtime;
		this.retirementPfEr = retirementPfEr;
		this.allowanceOther = allowanceOther;
		this.grossSalary = grossSalary;
		this.taxableIncome = taxableIncome;
		this.incomeTax = incomeTax;
		this.retirementPfErDeduction = retirementPfErDeduction;
		this.retirementPfEe = retirementPfEe;
		this.pension = pension;
		this.loanPfLoan = loanPfLoan;
		this.other = other;
		this.creditAssociation = creditAssociation;
		this.laborUnion = laborUnion;
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
	 * @param overtime
	 * @param retirementPfEr
	 * @param allowanceOther
	 * @param grossSalary
	 * @param taxableIncome
	 * @param incomeTax
	 * @param retirementPfErDeduction
	 * @param retirementPfEe
	 * @param pension
	 * @param loanPfLoan
	 * @param other
	 * @param creditAssociation
	 * @param laborUnion
	 * @param totalDeduction
	 * @param netPay
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public LocalTeachersPayrollSheet(long id, long payrollId, long employeeId,
			float basicSalary, float overtime, float retirementPfEr,
			float allowanceOther, float grossSalary, float taxableIncome,
			float incomeTax, float retirementPfErDeduction,
			float retirementPfEe, float pension, float loanPfLoan, float other,
			float creditAssociation, float laborUnion, float totalDeduction,
			float netPay, int modifiedBy, Date modificationDate) {
		this.id = id;
		this.payrollId = payrollId;
		this.employeeId = employeeId;
		this.basicSalary = basicSalary;
		this.overtime = overtime;
		this.retirementPfEr = retirementPfEr;
		this.allowanceOther = allowanceOther;
		this.grossSalary = grossSalary;
		this.taxableIncome = taxableIncome;
		this.incomeTax = incomeTax;
		this.retirementPfErDeduction = retirementPfErDeduction;
		this.retirementPfEe = retirementPfEe;
		this.pension = pension;
		this.loanPfLoan = loanPfLoan;
		this.other = other;
		this.creditAssociation = creditAssociation;
		this.laborUnion = laborUnion;
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
	 * @return the overtime
	 */
	public float getOvertime() {
		return overtime;
	}

	/**
	 * @param overtime
	 *            the overtime to set
	 */
	public void setOvertime(float overtime) {
		this.overtime = overtime;
	}

	/**
	 * @return the retirementPfEr
	 */
	public float getRetirementPfEr() {
		return retirementPfEr;
	}

	/**
	 * @param retirementPfEr
	 *            the retirementPfEr to set
	 */
	public void setRetirementPfEr(float retirementPfEr) {
		this.retirementPfEr = retirementPfEr;
	}

	/**
	 * @return the allowanceOther
	 */
	public float getAllowanceOther() {
		return allowanceOther;
	}

	/**
	 * @param allowanceOther
	 *            the allowanceOther to set
	 */
	public void setAllowanceOther(float allowanceOther) {
		this.allowanceOther = allowanceOther;
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
	 * @return the taxableIncome
	 */
	public float getTaxableIncome() {
		return taxableIncome;
	}

	/**
	 * @param taxableIncome
	 *            the taxableIncome to set
	 */
	public void setTaxableIncome(float taxableIncome) {
		this.taxableIncome = taxableIncome;
	}

	/**
	 * @return the incomeTax
	 */
	public float getIncomeTax() {
		return incomeTax;
	}

	/**
	 * @param incomeTax
	 *            the incomeTax to set
	 */
	public void setIncomeTax(float incomeTax) {
		this.incomeTax = incomeTax;
	}

	/**
	 * @return the retirementPfErDeduction
	 */
	public float getRetirementPfErDeduction() {
		return retirementPfErDeduction;
	}

	/**
	 * @param retirementPfErDeduction
	 *            the retirementPfErDeduction to set
	 */
	public void setRetirementPfErDeduction(float retirementPfErDeduction) {
		this.retirementPfErDeduction = retirementPfErDeduction;
	}

	/**
	 * @return the retirementPfEe
	 */
	public float getRetirementPfEe() {
		return retirementPfEe;
	}

	/**
	 * @param retirementPfEe
	 *            the retirementPfEe to set
	 */
	public void setRetirementPfEe(float retirementPfEe) {
		this.retirementPfEe = retirementPfEe;
	}

	/**
	 * @return the pension
	 */
	public float getPension() {
		return pension;
	}

	/**
	 * @param pension
	 *            the pension to set
	 */
	public void setPension(float pension) {
		this.pension = pension;
	}

	/**
	 * @return the loanPfLoan
	 */
	public float getLoanPfLoan() {
		return loanPfLoan;
	}

	/**
	 * @param loanPfLoan
	 *            the loanPfLoan to set
	 */
	public void setLoanPfLoan(float loanPfLoan) {
		this.loanPfLoan = loanPfLoan;
	}

	/**
	 * @return the other
	 */
	public float getOther() {
		return other;
	}

	/**
	 * @param other
	 *            the other to set
	 */
	public void setOther(float other) {
		this.other = other;
	}

	/**
	 * @return the creditAssociation
	 */
	public float getCreditAssociation() {
		return creditAssociation;
	}

	/**
	 * @param creditAssociation
	 *            the creditAssociation to set
	 */
	public void setCreditAssociation(float creditAssociation) {
		this.creditAssociation = creditAssociation;
	}

	/**
	 * @return the laborUnion
	 */
	public float getLaborUnion() {
		return laborUnion;
	}

	/**
	 * @param laborUnion
	 *            the laborUnion to set
	 */
	public void setLaborUnion(float laborUnion) {
		this.laborUnion = laborUnion;
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
			String sqlStr = "insert into tbl_local_teachers_payroll_sheet values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, 0);
			pStmt.setLong(2, this.getPayrollId());
			pStmt.setLong(3, this.getEmployeeId());
			pStmt.setFloat(4, this.getBasicSalary());
			pStmt.setFloat(5, this.getOvertime());
			pStmt.setFloat(6, this.getRetirementPfEr());
			pStmt.setFloat(7, this.getAllowanceOther());
			pStmt.setFloat(8, this.getGrossSalary());
			pStmt.setFloat(9, this.getTaxableIncome());
			pStmt.setFloat(10, this.getIncomeTax());
			pStmt.setFloat(11, this.getRetirementPfErDeduction());
			pStmt.setFloat(12, this.getRetirementPfEe());
			pStmt.setFloat(13, this.getPension());
			pStmt.setFloat(14, this.getLoanPfLoan());
			pStmt.setFloat(15, this.getOther());
			pStmt.setFloat(16, this.getCreditAssociation());
			pStmt.setFloat(17, this.getLaborUnion());
			pStmt.setFloat(18, this.getTotalDeduction());
			pStmt.setFloat(19, this.getNetPay());
			pStmt.setInt(20, this.getModifiedBy());
			pStmt.setDate(21, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(long id) {
		try {
			String sqlStr = "delete from tbl_local_teachers_payroll_sheet where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<LocalTeachersPayrollSheet> getAllLocalTeachersPayrollSheets() {
		List<LocalTeachersPayrollSheet> list = new ArrayList<LocalTeachersPayrollSheet>();
		LocalTeachersPayrollSheet localTeachersPayrollSheet = null;
		try {
			String query = "select * from tbl_local_teachers_payroll_sheet order by modification_date desc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				localTeachersPayrollSheet = new LocalTeachersPayrollSheet(rSet.getLong("id"), rSet.getLong("payroll_id"), 
						rSet.getLong("employee_id"), rSet.getFloat("basic_salary"), rSet.getFloat("overtime"), 
						rSet.getFloat("retirement_pf_er"), rSet.getFloat("allowance_other"), rSet.getFloat("gross_salary"), 
						rSet.getFloat("taxable_income"), rSet.getFloat("income_tax"), rSet.getFloat("retirement_pf_er_deduction"), 
						rSet.getFloat("retirement_pf_ee"), rSet.getFloat("pension"), rSet.getFloat("loan_pf_loan"), 
						rSet.getFloat("other"), rSet.getFloat("credit_association"), rSet.getFloat("labor_union"), 
						rSet.getFloat("total_deduction"), rSet.getFloat("net_pay"), rSet.getInt("modified_by"), 
						rSet.getDate("modification_date"));
				list.add(localTeachersPayrollSheet);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static LocalTeachersPayrollSheet getLocalTeachersPayrollSheet(long id) {
		LocalTeachersPayrollSheet localTeachersPayrollSheet = null;
		try {
			String query = "select * from tbl_local_teachers_payroll_sheet where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				localTeachersPayrollSheet = new LocalTeachersPayrollSheet(rSet.getLong("id"), rSet.getLong("payroll_id"), 
						rSet.getLong("employee_id"), rSet.getFloat("basic_salary"), rSet.getFloat("overtime"), 
						rSet.getFloat("retirement_pf_er"), rSet.getFloat("allowance_other"), rSet.getFloat("gross_salary"), 
						rSet.getFloat("taxable_income"), rSet.getFloat("income_tax"), rSet.getFloat("retirement_pf_er_deduction"), 
						rSet.getFloat("retirement_pf_ee"), rSet.getFloat("pension"), rSet.getFloat("loan_pf_loan"), 
						rSet.getFloat("other"), rSet.getFloat("credit_association"), rSet.getFloat("labor_union"), 
						rSet.getFloat("total_deduction"), rSet.getFloat("net_pay"), rSet.getInt("modified_by"), 
						rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return localTeachersPayrollSheet;
	}
	
	public static LocalTeachersPayrollSheet getAllLocalTeachersPayrollSheetsForThisPayrollAndEmployee(long payrollId, long employeeId){
		LocalTeachersPayrollSheet localTeachersPayrollSheet = null;
		try {
			String query = "select * from tbl_local_teachers_payroll_sheet where payroll_id = "+payrollId+" and employee_id = "+employeeId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				localTeachersPayrollSheet = new LocalTeachersPayrollSheet(rSet.getLong("id"), rSet.getLong("payroll_id"), 
						rSet.getLong("employee_id"), rSet.getFloat("basic_salary"), rSet.getFloat("overtime"), 
						rSet.getFloat("retirement_pf_er"), rSet.getFloat("allowance_other"), rSet.getFloat("gross_salary"), 
						rSet.getFloat("taxable_income"), rSet.getFloat("income_tax"), rSet.getFloat("retirement_pf_er_deduction"), 
						rSet.getFloat("retirement_pf_ee"), rSet.getFloat("pension"), rSet.getFloat("loan_pf_loan"), 
						rSet.getFloat("other"), rSet.getFloat("credit_association"), rSet.getFloat("labor_union"), 
						rSet.getFloat("total_deduction"), rSet.getFloat("net_pay"), rSet.getInt("modified_by"), 
						rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return localTeachersPayrollSheet;
	}
	
	public static List<LocalTeachersPayrollSheet> getAllLocalTeachersPayrollSheetsForThisPayroll(long payrollId){
		List<LocalTeachersPayrollSheet> list = new ArrayList<LocalTeachersPayrollSheet>();
		LocalTeachersPayrollSheet localTeachersPayrollSheet = null;
		try {
			String query = "select tbl_local_teachers_payroll_sheet.*,tbl_employee.first_name from tbl_local_teachers_payroll_sheet,tbl_employee where payroll_id = "+payrollId+" and tbl_employee.id = " +
					"tbl_local_teachers_payroll_sheet.employee_id order by first_name, last_name asc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				localTeachersPayrollSheet = new LocalTeachersPayrollSheet(rSet.getLong("tbl_local_teachers_payroll_sheet.id"), rSet.getLong("payroll_id"), 
						rSet.getLong("employee_id"), rSet.getFloat("basic_salary"), rSet.getFloat("overtime"), 
						rSet.getFloat("retirement_pf_er"), rSet.getFloat("allowance_other"), rSet.getFloat("gross_salary"), 
						rSet.getFloat("taxable_income"), rSet.getFloat("income_tax"), rSet.getFloat("retirement_pf_er_deduction"), 
						rSet.getFloat("retirement_pf_ee"), rSet.getFloat("pension"), rSet.getFloat("loan_pf_loan"), 
						rSet.getFloat("other"), rSet.getFloat("credit_association"), rSet.getFloat("labor_union"), 
						rSet.getFloat("total_deduction"), rSet.getFloat("net_pay"), rSet.getInt("modified_by"), 
						rSet.getDate("modification_date"));
				list.add(localTeachersPayrollSheet);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
}// end class
