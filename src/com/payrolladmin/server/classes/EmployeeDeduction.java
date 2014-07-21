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
public class EmployeeDeduction {
	private long id;
	private long employeeId;
	private int deductionId;
	private String deductionType;
	private float deductionAmount;
	private int currencyId;
	private int modifiedBy;
	private Date modificationDate;
	/**
	 * 
	 */
	public EmployeeDeduction() {
	}
	/**
	 * @param employeeId
	 * @param deductionId
	 * @param deductionType
	 * @param deductionAmount 
	 * @param currencyId
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public EmployeeDeduction(long employeeId, int deductionId,String deductionType,
			float deductionAmount, int currencyId, int modifiedBy,
			Date modificationDate) {
		this.employeeId = employeeId;
		this.deductionId = deductionId;
		this.deductionType = deductionType;
		this.deductionAmount = deductionAmount;
		this.currencyId = currencyId;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}
	/**
	 * @param id
	 * @param employeeId
	 * @param deductionId
	 * @param deductionType
	 * @param deductionAmount
	 * @param currencyId
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public EmployeeDeduction(long id, long employeeId, int deductionId,String deductionType,
			float deductionAmount, int currencyId, int modifiedBy,
			Date modificationDate) {
		this.id = id;
		this.employeeId = employeeId;
		this.deductionId = deductionId;
		this.deductionType = deductionType;
		this.deductionAmount = deductionAmount;
		this.currencyId = currencyId;
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
	 * @return the deductionId
	 */
	public int getDeductionId() {
		return deductionId;
	}
	/**
	 * @param deductionId the deductionId to set
	 */
	public void setDeductionId(int deductionId) {
		this.deductionId = deductionId;
	}
	/**
	 * @return the deductionAmount
	 */
	public float getDeductionAmount() {
		return deductionAmount;
	}
	/**
	 * @param deductionAmount the deductionAmount to set
	 */
	public void setDeductionAmount(float deductionAmount) {
		this.deductionAmount = deductionAmount;
	}
	/**
	 * @return the currencyId
	 */
	public int getCurrencyId() {
		return currencyId;
	}
	/**
	 * @param currencyId the currencyId to set
	 */
	public void setCurrencyId(int currencyId) {
		this.currencyId = currencyId;
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
	
	
	
	/**
	 * @return the deductionType
	 */
	public String getDeductionType() {
		return deductionType;
	}
	/**
	 * @param deductionType the deductionType to set
	 */
	public void setDeductionType(String deductionType) {
		this.deductionType = deductionType;
	}
	public void save(){
		try {
			String sqlStr = "insert into tbl_employee_deduction values(?,?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, 0);
			pStmt.setLong(2, this.getEmployeeId());
			pStmt.setInt(3, this.getDeductionId());
			pStmt.setString(4, this.getDeductionType());
			pStmt.setFloat(5, this.getDeductionAmount());
			pStmt.setInt(6, this.getCurrencyId());
			pStmt.setInt(7, this.getModifiedBy());
			pStmt.setDate(8, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void update(EmployeeDeduction employeeDeduction){
		try {
			String sqlStr = "update tbl_employee_deduction set employee_id = ?, deduction_id = ?, deduction_type = ?, " +
					"deduction_amount = ?, currency_id = ?, modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, employeeDeduction.getEmployeeId());
			pStmt.setInt(2, employeeDeduction.getDeductionId());
			pStmt.setString(3, employeeDeduction.getDeductionType());
			pStmt.setFloat(4, employeeDeduction.getDeductionAmount());
			pStmt.setInt(5, employeeDeduction.getCurrencyId());
			pStmt.setInt(6, employeeDeduction.getModifiedBy());
			pStmt.setDate(7, employeeDeduction.getModificationDate());
			pStmt.setLong(8, employeeDeduction.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void delete(long id){
		try {
			String sqlStr = "delete from tbl_employee_deduction where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<EmployeeDeduction> getAllEmployeeDeductions(){
		List<EmployeeDeduction> list = new ArrayList<EmployeeDeduction>();
		EmployeeDeduction employeeDeduction = null;
		try {
			String query = "select * from tbl_employee_deduction order by modification_date desc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				employeeDeduction = new EmployeeDeduction(rSet.getLong("id"), rSet.getLong("employee_id"), 
						rSet.getInt("deduction_id"),rSet.getString("deduction_type"), rSet.getFloat("deduction_amount"), 
						rSet.getInt("currency_id"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));
				list.add(employeeDeduction);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static List<EmployeeDeduction> getAllEmployeeDeductionsOfThisEmployee(long employeeId){
		List<EmployeeDeduction> list = new ArrayList<EmployeeDeduction>();
		EmployeeDeduction employeeDeduction = null;
		try {
			String query = "select * from tbl_employee_deduction where employee_id = "+employeeId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				employeeDeduction = new EmployeeDeduction(rSet.getLong("id"), rSet.getLong("employee_id"), 
						rSet.getInt("deduction_id"), rSet.getString("deduction_type"), rSet.getFloat("deduction_amount"), 
						rSet.getInt("currency_id"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));
				list.add(employeeDeduction);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static EmployeeDeduction getEmployeeDeduction(long id){
		EmployeeDeduction employeeDeduction = null;
		try {
			String query = "select * from tbl_employee_deduction where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				employeeDeduction = new EmployeeDeduction(rSet.getLong("id"), rSet.getLong("employee_id"), 
						rSet.getInt("deduction_id"), rSet.getString("deduction_type"), rSet.getFloat("deduction_amount"), 
						rSet.getInt("currency_id"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return employeeDeduction;
	}
	
	public static EmployeeDeduction getEmployeeDeductionForThisEmployeeAndType(long employeeId,String deductionName){
		EmployeeDeduction employeeDeduction = null;
		try {
			String query = "select * from tbl_employee_deduction, tbl_deduction where tbl_employee_deduction.employee_id = "+
		employeeId+" and tbl_employee_deduction.deduction_id = tbl_deduction.id and tbl_deduction.deduction_name = '"+deductionName+"'";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				employeeDeduction = new EmployeeDeduction(rSet.getLong("id"), rSet.getLong("employee_id"), 
						rSet.getInt("deduction_id"), rSet.getString("deduction_type"), rSet.getFloat("deduction_amount"), 
						rSet.getInt("currency_id"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return employeeDeduction;
	}
}//end class
