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
public class EmployeeLoan {
	private long id;
	private long employeeId;
	private float amountTaken;
	private float monthlyPaymentAmount;
	private float balanceRemaining;
	private int currencyId;
	private Date dateTaken;
	private String description;
	private int modifiedBy;
	private Date modificationDate;

	/**
	 * 
	 */
	public EmployeeLoan() {
	}

	/**
	 * @param employeeId
	 * @param amountTaken
	 * @param monthlyPaymentAmount
	 * @param balanceRemaining
	 * @param currencyId
	 * @param dateTaken
	 * @param description
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public EmployeeLoan(long employeeId, float amountTaken,
			float monthlyPaymentAmount,float balanceRemaining, int currencyId,Date dateTaken, String description,
			int modifiedBy, Date modificationDate) {
		this.employeeId = employeeId;
		this.amountTaken = amountTaken;
		this.monthlyPaymentAmount = monthlyPaymentAmount;
		this.balanceRemaining = balanceRemaining;
		this.currencyId = currencyId;
		this.dateTaken = dateTaken;
		this.description = description;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}

	/**
	 * @param id
	 * @param employeeId
	 * @param amountTaken
	 * @param monthlyPaymentAmount
	 * @param balanceRemaining
	 * @param currencyId
	 * @param dateTaken
	 * @param description
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public EmployeeLoan(long id, long employeeId, float amountTaken,
			float monthlyPaymentAmount,float balanceRemaining, int currencyId,Date dateTaken, String description,
			int modifiedBy, Date modificationDate) {
		this.id = id;
		this.employeeId = employeeId;
		this.amountTaken = amountTaken;
		this.monthlyPaymentAmount = monthlyPaymentAmount;
		this.balanceRemaining = balanceRemaining;
		this.currencyId = currencyId;
		this.dateTaken = dateTaken;
		this.description = description;
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
	 * @return the amountTaken
	 */
	public float getAmountTaken() {
		return amountTaken;
	}

	/**
	 * @param amountTaken
	 *            the amountTaken to set
	 */
	public void setAmountTaken(float amountTaken) {
		this.amountTaken = amountTaken;
	}

	/**
	 * @return the monthlyPaymentAmount
	 */
	public float getMonthlyPaymentAmount() {
		return monthlyPaymentAmount;
	}

	/**
	 * @param monthlyPaymentAmount
	 *            the monthlyPaymentAmount to set
	 */
	public void setMonthlyPaymentAmount(float monthlyPaymentAmount) {
		this.monthlyPaymentAmount = monthlyPaymentAmount;
	}

	/**
	 * @return the currencyId
	 */
	public int getCurrencyId() {
		return currencyId;
	}

	/**
	 * @param currencyId
	 *            the currencyId to set
	 */
	public void setCurrencyId(int currencyId) {
		this.currencyId = currencyId;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description
	 *            the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
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
	 * @return the dateTaken
	 */
	public Date getDateTaken() {
		return dateTaken;
	}

	/**
	 * @param dateTaken the dateTaken to set
	 */
	public void setDateTaken(Date dateTaken) {
		this.dateTaken = dateTaken;
	}
	
	

	/**
	 * @return the balanceRemaining
	 */
	public float getBalanceRemaining() {
		return balanceRemaining;
	}

	/**
	 * @param balanceRemaining the balanceRemaining to set
	 */
	public void setBalanceRemaining(float balanceRemaining) {
		this.balanceRemaining = balanceRemaining;
	}

	public void save() {
		try {
			String sqlStr = "insert into tbl_employee_loan values(?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, 0);
			pStmt.setLong(2, this.getEmployeeId());
			pStmt.setFloat(3, this.getAmountTaken());
			pStmt.setFloat(4, this.getMonthlyPaymentAmount());
			pStmt.setFloat(5, this.getAmountTaken());
			pStmt.setInt(6, this.getCurrencyId());
			pStmt.setDate(7, this.getDateTaken());
			pStmt.setString(8, this.getDescription());
			pStmt.setInt(9, this.getModifiedBy());
			pStmt.setDate(10, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void update(EmployeeLoan employeeLoan) {
		try {
			String sqlStr = "update tbl_employee_loan set employee_id = ?, amount_taken = ?," +
					"monthly_payment_amount = ?,balance_remaining = ?, currency_id = ?, date_taken = ?, description = ?," +
					"modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, employeeLoan.getEmployeeId());
			pStmt.setFloat(2, employeeLoan.getAmountTaken());
			pStmt.setFloat(3, employeeLoan.getMonthlyPaymentAmount());
			pStmt.setFloat(4, employeeLoan.getBalanceRemaining());
			pStmt.setInt(5, employeeLoan.getCurrencyId());
			pStmt.setDate(6, employeeLoan.getDateTaken());
			pStmt.setString(7, employeeLoan.getDescription());
			pStmt.setInt(8, employeeLoan.getModifiedBy());
			pStmt.setDate(9, employeeLoan.getModificationDate());
			pStmt.setLong(10, employeeLoan.getId());
			DBConnection.writeToDatabase(pStmt);
			System.out.println(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(long id) {
		try {
			String sqlStr = "delete from tbl_employee_loan where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<EmployeeLoan> getAllEmployeeLoans() {
		List<EmployeeLoan> list = new ArrayList<EmployeeLoan>();
		EmployeeLoan employeeLoan = null;
		try {
			String query = "select * from tbl_employee_loan order by modification_date desc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				employeeLoan = new EmployeeLoan(rSet.getLong("id"),rSet.getLong("employee_id"),
						rSet.getFloat("amount_taken"),rSet.getFloat("monthly_payment_amount"),rSet.getFloat("balance_remaining"),
						rSet.getInt("currency_id"),rSet.getDate("date_taken"),rSet.getString("description"),rSet.getInt("modified_by"),
						rSet.getDate("modification_date"));
				list.add(employeeLoan);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static EmployeeLoan getEmployeeLoan(long id) {
		EmployeeLoan employeeLoan = null;
		try {
			String query = "select * from tbl_employee_loan where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				employeeLoan = new EmployeeLoan(rSet.getLong("id"),rSet.getLong("employee_id"),
						rSet.getFloat("amount_taken"),rSet.getFloat("monthly_payment_amount"),rSet.getFloat("balance_remaining"),
						rSet.getInt("currency_id"),rSet.getDate("date_taken"),rSet.getString("description"),rSet.getInt("modified_by"),
						rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return employeeLoan;
	}
	
	public static float getTotalMonthlyPaymentAmountSumForThisEmployee(long employeeId){
		float loanSum = 0.0f;
		try{
			String query = "select sum(monthly_payment_amount) as loanSum from tbl_employee_loan where employee_id = "+employeeId+" and balance_remaining > 0.0";
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				loanSum = rSet.getFloat("loanSum");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return loanSum;
	}
	
	public static List<EmployeeLoan> getAllEmployeeLoansForThisEmployee(long employeeId){
		List<EmployeeLoan> list = new ArrayList<EmployeeLoan>();
		EmployeeLoan employeeLoan = null;
		try {
			String query = "select * from tbl_employee_loan where employee_id = "+employeeId+" and balance_remaining != 0";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				employeeLoan = new EmployeeLoan(rSet.getLong("id"),rSet.getLong("employee_id"),
						rSet.getFloat("amount_taken"),rSet.getFloat("monthly_payment_amount"),rSet.getFloat("balance_remaining"),
						rSet.getInt("currency_id"),rSet.getDate("date_taken"),rSet.getString("description"),rSet.getInt("modified_by"),
						rSet.getDate("modification_date"));
				list.add(employeeLoan);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
}// end class
