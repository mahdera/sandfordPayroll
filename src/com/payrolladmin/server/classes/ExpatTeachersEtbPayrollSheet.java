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
public class ExpatTeachersEtbPayrollSheet {
	private long id;
	private long payrollId;
	private long employeeId;
	private float usdBasicSalary;
	private float responsibilityAllowance;
	private float usdGrossSalary;
	private float exchangeRate;
	private float totalInBirr;
	private float etbBasicSalary;
	private float etbResponsibilityAllowance;
	private float convertedHardCurrency;
	private float houseRentAllowance;
	private float gratuityAmount;
	private float etbGrossSalary;
	private float grandInBirr;
	private float advanceAndLoans;
	private float houseRentDeduction;
	private float taxableIncome;
	private float incomeTax;
	private float telAndElec;
	private float totalDeduction;
	private float netPay;
	private int modifiedBy;
	private Date modificationDate;

	/**
	 * 
	 */
	public ExpatTeachersEtbPayrollSheet() {
	}

	/**
	 * @param payrollId
	 * @param employeeId
	 * @param usdBasicSalary
	 * @param responsibilityAllowance
	 * @param usdGrossSalary
	 * @param exchangeRate
	 * @param totalInBirr
	 * @param etbBasicSalary
	 * @param etbResponsibilityAllowance
	 * @param convertedHardCurrency
	 * @param houseRentAllowance
	 * @param gratuityAmount
	 * @param etbGrossSalary
	 * @param grandInBirr
	 * @param advanceAndLoans
	 * @param houseRentDeduction
	 * @param taxableIncome
	 * @param incomeTax
	 * @param telAndElec
	 * @param totalDeduction
	 * @param netPay
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public ExpatTeachersEtbPayrollSheet(long payrollId, long employeeId,
			float usdBasicSalary, float responsibilityAllowance,
			float usdGrossSalary, float exchangeRate, float totalInBirr,
			float etbBasicSalary, float etbResponsibilityAllowance,
			float convertedHardCurrency, float houseRentAllowance,float gratuityAmount,
			float etbGrossSalary, float grandInBirr, float advanceAndLoans,
			float houseRentDeduction, float taxableIncome, float incomeTax,
			float telAndElec, float totalDeduction, float netPay,
			int modifiedBy, Date modificationDate) {
		this.payrollId = payrollId;
		this.employeeId = employeeId;
		this.usdBasicSalary = usdBasicSalary;
		this.responsibilityAllowance = responsibilityAllowance;
		this.usdGrossSalary = usdGrossSalary;
		this.exchangeRate = exchangeRate;
		this.totalInBirr = totalInBirr;
		this.etbBasicSalary = etbBasicSalary;
		this.etbResponsibilityAllowance = etbResponsibilityAllowance;
		this.convertedHardCurrency = convertedHardCurrency;
		this.houseRentAllowance = houseRentAllowance;
		this.gratuityAmount = gratuityAmount;
		this.etbGrossSalary = etbGrossSalary;
		this.grandInBirr = grandInBirr;
		this.advanceAndLoans = advanceAndLoans;
		this.houseRentDeduction = houseRentDeduction;
		this.taxableIncome = taxableIncome;
		this.incomeTax = incomeTax;
		this.telAndElec = telAndElec;
		this.totalDeduction = totalDeduction;
		this.netPay = netPay;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}

	/**
	 * @param id
	 * @param payrollId
	 * @param employeeId
	 * @param usdBasicSalary
	 * @param responsibilityAllowance
	 * @param usdGrossSalary
	 * @param exchangeRate
	 * @param totalInBirr
	 * @param etbBasicSalary
	 * @param etbResponsibilityAllowance
	 * @param convertedHardCurrency
	 * @param houseRentAllowance
	 * @param gratuityAmount
	 * @param etbGrossSalary
	 * @param grandInBirr
	 * @param advanceAndLoans
	 * @param houseRentDeduction
	 * @param taxableIncome
	 * @param incomeTax
	 * @param telAndElec
	 * @param totalDeduction
	 * @param netPay
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public ExpatTeachersEtbPayrollSheet(long id, long payrollId,
			long employeeId, float usdBasicSalary,
			float responsibilityAllowance, float usdGrossSalary,
			float exchangeRate, float totalInBirr, float etbBasicSalary,
			float etbResponsibilityAllowance, float convertedHardCurrency,
			float houseRentAllowance,float gratuityAmount, float etbGrossSalary, float grandInBirr,
			float advanceAndLoans, float houseRentDeduction,
			float taxableIncome, float incomeTax, float telAndElec,
			float totalDeduction, float netPay, int modifiedBy,
			Date modificationDate) {
		this.id = id;
		this.payrollId = payrollId;
		this.employeeId = employeeId;
		this.usdBasicSalary = usdBasicSalary;
		this.responsibilityAllowance = responsibilityAllowance;
		this.usdGrossSalary = usdGrossSalary;
		this.exchangeRate = exchangeRate;
		this.totalInBirr = totalInBirr;
		this.etbBasicSalary = etbBasicSalary;
		this.etbResponsibilityAllowance = etbResponsibilityAllowance;
		this.convertedHardCurrency = convertedHardCurrency;
		this.houseRentAllowance = houseRentAllowance;
		this.gratuityAmount = gratuityAmount;
		this.etbGrossSalary = etbGrossSalary;
		this.grandInBirr = grandInBirr;
		this.advanceAndLoans = advanceAndLoans;
		this.houseRentDeduction = houseRentDeduction;
		this.taxableIncome = taxableIncome;
		this.incomeTax = incomeTax;
		this.telAndElec = telAndElec;
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
	 * @return the usdBasicSalary
	 */
	public float getUsdBasicSalary() {
		return usdBasicSalary;
	}

	/**
	 * @param usdBasicSalary
	 *            the usdBasicSalary to set
	 */
	public void setUsdBasicSalary(float usdBasicSalary) {
		this.usdBasicSalary = usdBasicSalary;
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
	 * @return the usdGrossSalary
	 */
	public float getUsdGrossSalary() {
		return usdGrossSalary;
	}

	/**
	 * @param usdGrossSalary
	 *            the usdGrossSalary to set
	 */
	public void setUsdGrossSalary(float usdGrossSalary) {
		this.usdGrossSalary = usdGrossSalary;
	}

	/**
	 * @return the exchangeRate
	 */
	public float getExchangeRate() {
		return exchangeRate;
	}

	/**
	 * @param exchangeRate
	 *            the exchangeRate to set
	 */
	public void setExchangeRate(float exchangeRate) {
		this.exchangeRate = exchangeRate;
	}

	/**
	 * @return the totalInBirr
	 */
	public float getTotalInBirr() {
		return totalInBirr;
	}

	/**
	 * @param totalInBirr
	 *            the totalInBirr to set
	 */
	public void setTotalInBirr(float totalInBirr) {
		this.totalInBirr = totalInBirr;
	}

	/**
	 * @return the etbBasicSalary
	 */
	public float getEtbBasicSalary() {
		return etbBasicSalary;
	}

	/**
	 * @param etbBasicSalary
	 *            the etbBasicSalary to set
	 */
	public void setEtbBasicSalary(float etbBasicSalary) {
		this.etbBasicSalary = etbBasicSalary;
	}

	/**
	 * @return the etbResponsibilityAllowance
	 */
	public float getEtbResponsibilityAllowance() {
		return etbResponsibilityAllowance;
	}

	/**
	 * @param etbResponsibilityAllowance
	 *            the etbResponsibilityAllowance to set
	 */
	public void setEtbResponsibilityAllowance(float etbResponsibilityAllowance) {
		this.etbResponsibilityAllowance = etbResponsibilityAllowance;
	}

	/**
	 * @return the convertedHardCurrency
	 */
	public float getConvertedHardCurrency() {
		return convertedHardCurrency;
	}

	/**
	 * @param convertedHardCurrency
	 *            the convertedHardCurrency to set
	 */
	public void setConvertedHardCurrency(float convertedHardCurrency) {
		this.convertedHardCurrency = convertedHardCurrency;
	}

	/**
	 * @return the houseRentAllowance
	 */
	public float getHouseRentAllowance() {
		return houseRentAllowance;
	}

	/**
	 * @param houseRentAllowance
	 *            the houseRentAllowance to set
	 */
	public void setHouseRentAllowance(float houseRentAllowance) {
		this.houseRentAllowance = houseRentAllowance;
	}

	/**
	 * @return the etbGrossSalary
	 */
	public float getEtbGrossSalary() {
		return etbGrossSalary;
	}

	/**
	 * @param etbGrossSalary
	 *            the etbGrossSalary to set
	 */
	public void setEtbGrossSalary(float etbGrossSalary) {
		this.etbGrossSalary = etbGrossSalary;
	}

	/**
	 * @return the grandInBirr
	 */
	public float getGrandInBirr() {
		return grandInBirr;
	}

	/**
	 * @param grandInBirr
	 *            the grandInBirr to set
	 */
	public void setGrandInBirr(float grandInBirr) {
		this.grandInBirr = grandInBirr;
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
	 * @return the houseRentDeduction
	 */
	public float getHouseRentDeduction() {
		return houseRentDeduction;
	}

	/**
	 * @param houseRentDeduction
	 *            the houseRentDeduction to set
	 */
	public void setHouseRentDeduction(float houseRentDeduction) {
		this.houseRentDeduction = houseRentDeduction;
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
	 * @return the telAndElec
	 */
	public float getTelAndElec() {
		return telAndElec;
	}

	/**
	 * @param telAndElec
	 *            the telAndElec to set
	 */
	public void setTelAndElec(float telAndElec) {
		this.telAndElec = telAndElec;
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
	
	

	/**
	 * @return the gratuityAmount
	 */
	public float getGratuityAmount() {
		return gratuityAmount;
	}

	/**
	 * @param gratuityAmount the gratuityAmount to set
	 */
	public void setGratuityAmount(float gratuityAmount) {
		this.gratuityAmount = gratuityAmount;
	}

	public void save() {
		try {
			String sqlStr = "insert into tbl_expat_teachers_etb_payroll_sheet values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, 0);
			pStmt.setLong(2, this.getPayrollId());
			pStmt.setLong(3, this.getEmployeeId());
			pStmt.setFloat(4, this.getUsdBasicSalary());
			pStmt.setFloat(5, this.getResponsibilityAllowance());
			pStmt.setFloat(6, this.getUsdGrossSalary());
			pStmt.setFloat(7, this.getExchangeRate());
			pStmt.setFloat(8, this.getTotalInBirr());
			pStmt.setFloat(9, this.getEtbBasicSalary());
			pStmt.setFloat(10, this.getEtbResponsibilityAllowance());
			pStmt.setFloat(11, this.getConvertedHardCurrency());
			pStmt.setFloat(12, this.getHouseRentAllowance());
			pStmt.setFloat(13, this.getGrandInBirr());
			pStmt.setFloat(14, this.getEtbGrossSalary());
			pStmt.setFloat(15, this.getGrandInBirr());
			pStmt.setFloat(16, this.getAdvanceAndLoans());
			pStmt.setFloat(17, this.getHouseRentDeduction());
			pStmt.setFloat(18, this.getTaxableIncome());
			pStmt.setFloat(19, this.getIncomeTax());
			pStmt.setFloat(20, this.getTelAndElec());
			pStmt.setFloat(21, this.getTotalDeduction());
			pStmt.setFloat(22, this.getNetPay());
			pStmt.setInt(23, this.getModifiedBy());
			pStmt.setDate(24, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(long id) {
		try {
			String sqlStr = "delete from tbl_expat_teachers_etb_payroll_sheet where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<ExpatTeachersEtbPayrollSheet> getAllExpatTeachersEtbPayrollSheets() {
		List<ExpatTeachersEtbPayrollSheet> list = new ArrayList<ExpatTeachersEtbPayrollSheet>();
		ExpatTeachersEtbPayrollSheet expatTeachersEtbPayrollSheet = null;
		try {
			String query = "select * from tbl_expat_teachers_etb_payroll_sheet order by modification_date desc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				expatTeachersEtbPayrollSheet = new ExpatTeachersEtbPayrollSheet(rSet.getLong("id"), 
						rSet.getLong("payroll_id"), rSet.getLong("employee_id"), rSet.getFloat("usd_basic_salary"), 
						rSet.getFloat("responsibility_allowance"), rSet.getFloat("usd_gross_salary"), rSet.getFloat("exchange_rate"), 
						rSet.getFloat("total_in_birr"), rSet.getFloat("etb_basic_salary"), rSet.getFloat("etb_responsibility_allowance"), 
						rSet.getFloat("converted_hard_currency"), rSet.getFloat("house_rent_allowance"),rSet.getFloat("gratuity_amount"), rSet.getFloat("etb_gross_salary"), 
						rSet.getFloat("grand_in_birr"), rSet.getFloat("advance_and_loans"), rSet.getFloat("house_rent_deduction"), 
						rSet.getFloat("taxable_income"), rSet.getFloat("income_tax"), rSet.getFloat("tel_and_elec"), 
						rSet.getFloat("total_deduction"), rSet.getFloat("net_pay"), rSet.getInt("modified_by"), 
						rSet.getDate("modification_date"));
				list.add(expatTeachersEtbPayrollSheet);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static ExpatTeachersEtbPayrollSheet getExpatTeachersEtbPayrollSheet(
			long id) {
		ExpatTeachersEtbPayrollSheet expatTeachersEtbPayrollSheet = null;
		try {
			String query = "select * from tbl_expat_teachers_etb_payroll_sheet where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				expatTeachersEtbPayrollSheet = new ExpatTeachersEtbPayrollSheet(rSet.getLong("id"), 
						rSet.getLong("payroll_id"), rSet.getLong("employee_id"), rSet.getFloat("usd_basic_salary"), 
						rSet.getFloat("responsibility_allowance"), rSet.getFloat("usd_gross_salary"), rSet.getFloat("exchange_rate"), 
						rSet.getFloat("total_in_birr"), rSet.getFloat("etb_basic_salary"), rSet.getFloat("etb_responsibility_allowance"), 
						rSet.getFloat("converted_hard_currency"), rSet.getFloat("house_rent_allowance"),rSet.getFloat("gratuity_amount"), rSet.getFloat("etb_gross_salary"), 
						rSet.getFloat("grand_in_birr"), rSet.getFloat("advance_and_loans"), rSet.getFloat("house_rent_deduction"), 
						rSet.getFloat("taxable_income"), rSet.getFloat("income_tax"), rSet.getFloat("tel_and_elec"), 
						rSet.getFloat("total_deduction"), rSet.getFloat("net_pay"), rSet.getInt("modified_by"), 
						rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return expatTeachersEtbPayrollSheet;
	}
	
	public static List<ExpatTeachersEtbPayrollSheet> getAllExpatTeachersEtbPayrollSheetsForThisPayroll(long payrollId){
		List<ExpatTeachersEtbPayrollSheet> list = new ArrayList<ExpatTeachersEtbPayrollSheet>();
		ExpatTeachersEtbPayrollSheet expatTeachersEtbPayrollSheet = null;
		try {
			String query = "select tbl_expat_teachers_etb_payroll_sheet.*,tbl_employee.first_name from tbl_expat_teachers_etb_payroll_sheet,tbl_employee where payroll_id = "+payrollId+" and tbl_employee.id = " +
					"tbl_expat_teachers_etb_payroll_sheet.employee_id order by first_name, last_name asc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				expatTeachersEtbPayrollSheet = new ExpatTeachersEtbPayrollSheet(rSet.getLong("tbl_expat_teachers_etb_payroll_sheet.id"), 
						rSet.getLong("payroll_id"), rSet.getLong("employee_id"), rSet.getFloat("usd_basic_salary"), 
						rSet.getFloat("responsibility_allowance"), rSet.getFloat("usd_gross_salary"), rSet.getFloat("exchange_rate"), 
						rSet.getFloat("total_in_birr"), rSet.getFloat("etb_basic_salary"), rSet.getFloat("etb_responsibility_allowance"), 
						rSet.getFloat("converted_hard_currency"), rSet.getFloat("house_rent_allowance"),rSet.getFloat("gratuity_amount"), rSet.getFloat("etb_gross_salary"), 
						rSet.getFloat("grand_in_birr"), rSet.getFloat("advance_and_loans"), rSet.getFloat("house_rent_deduction"), 
						rSet.getFloat("taxable_income"), rSet.getFloat("income_tax"), rSet.getFloat("tel_and_elec"), 
						rSet.getFloat("total_deduction"), rSet.getFloat("net_pay"), rSet.getInt("modified_by"), 
						rSet.getDate("modification_date"));
				list.add(expatTeachersEtbPayrollSheet);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static ExpatTeachersEtbPayrollSheet getAllExpatTeachersEtbPayrollSheetsForThisPayrollAndEmployee(long payrollId, long employeeId){
		ExpatTeachersEtbPayrollSheet expatTeachersEtbPayrollSheet = null;
		try {
			String query = "select * from tbl_expat_teachers_etb_payroll_sheet where payroll_id = "+payrollId+" and employee_id = "+employeeId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				expatTeachersEtbPayrollSheet = new ExpatTeachersEtbPayrollSheet(rSet.getLong("id"), 
						rSet.getLong("payroll_id"), rSet.getLong("employee_id"), rSet.getFloat("usd_basic_salary"), 
						rSet.getFloat("responsibility_allowance"), rSet.getFloat("usd_gross_salary"), rSet.getFloat("exchange_rate"), 
						rSet.getFloat("total_in_birr"), rSet.getFloat("etb_basic_salary"), rSet.getFloat("etb_responsibility_allowance"), 
						rSet.getFloat("converted_hard_currency"), rSet.getFloat("house_rent_allowance"),rSet.getFloat("gratuity_amount"), rSet.getFloat("etb_gross_salary"), 
						rSet.getFloat("grand_in_birr"), rSet.getFloat("advance_and_loans"), rSet.getFloat("house_rent_deduction"), 
						rSet.getFloat("taxable_income"), rSet.getFloat("income_tax"), rSet.getFloat("tel_and_elec"), 
						rSet.getFloat("total_deduction"), rSet.getFloat("net_pay"), rSet.getInt("modified_by"), 
						rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return expatTeachersEtbPayrollSheet;
	}
}// end class
