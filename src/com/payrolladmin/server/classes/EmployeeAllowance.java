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
public class EmployeeAllowance {
	private long id;
	private long employeeId;
	private int allowanceId;
	private float allowanceAmount;
	private int currencyId;
	private int modifiedBy;
	private Date modificationDate;
	/**
	 * 
	 */
	public EmployeeAllowance() {
	}
	/**
	 * @param employeeId
	 * @param allowanceId
	 * @param allowanceAmount
	 * @param currencyId
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public EmployeeAllowance(long employeeId, int allowanceId,
			float allowanceAmount, int currencyId, int modifiedBy,
			Date modificationDate) {
		this.employeeId = employeeId;
		this.allowanceId = allowanceId;
		this.allowanceAmount = allowanceAmount;
		this.currencyId = currencyId;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}
	/**
	 * @param id
	 * @param employeeId
	 * @param allowanceId
	 * @param allowanceAmount
	 * @param currencyId
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public EmployeeAllowance(long id, long employeeId, int allowanceId,
			float allowanceAmount, int currencyId, int modifiedBy,
			Date modificationDate) {
		this.id = id;
		this.employeeId = employeeId;
		this.allowanceId = allowanceId;
		this.allowanceAmount = allowanceAmount;
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
	 * @return the allowanceId
	 */
	public int getAllowanceId() {
		return allowanceId;
	}
	/**
	 * @param allowanceId the allowanceId to set
	 */
	public void setAllowanceId(int allowanceId) {
		this.allowanceId = allowanceId;
	}
	/**
	 * @return the allowanceAmount
	 */
	public float getAllowanceAmount() {
		return allowanceAmount;
	}
	/**
	 * @param allowanceAmount the allowanceAmount to set
	 */
	public void setAllowanceAmount(float allowanceAmount) {
		this.allowanceAmount = allowanceAmount;
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
	
	public void save(){
		try {
			String sqlStr = "insert into tbl_employee_allowance values(?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, 0);
			pStmt.setLong(2, this.getEmployeeId());
			pStmt.setInt(3, this.getAllowanceId());
			pStmt.setFloat(4, this.getAllowanceAmount());
			pStmt.setInt(5, this.getCurrencyId());
			pStmt.setInt(6, this.getModifiedBy());
			pStmt.setDate(7, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void update(EmployeeAllowance employeeAllowance){
		try {
			String sqlStr = "update tbl_employee_allowance set employee_id = ?, allowance_id = ?," +
					"allowance_amount = ?, currency_id = ?, modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, employeeAllowance.getEmployeeId());
			pStmt.setInt(2, employeeAllowance.getAllowanceId());
			pStmt.setFloat(3, employeeAllowance.getAllowanceAmount());
			pStmt.setInt(4, employeeAllowance.getCurrencyId());
			pStmt.setInt(5, employeeAllowance.getModifiedBy());
			pStmt.setDate(6, employeeAllowance.getModificationDate());
			pStmt.setLong(7, employeeAllowance.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void delete(long id){
		try {
			String sqlStr = "delete from tbl_employee_allowance where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<EmployeeAllowance> getAllEmployeeAllowances(){
		List<EmployeeAllowance> list = new ArrayList<EmployeeAllowance>();
		EmployeeAllowance employeeAllowance = null;
		try {
			String query = "select * from tbl_employee_allowance order by modification_date desc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				employeeAllowance = new EmployeeAllowance(rSet.getLong("id"), rSet.getLong("employee_id"), 
						rSet.getInt("allowance_id"), rSet.getFloat("allowance_amount"), 
						rSet.getInt("currency_id"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));
				list.add(employeeAllowance);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static List<EmployeeAllowance> getAllEmployeeAllowancesOfThisEmployee(long employeeId){
		List<EmployeeAllowance> list = new ArrayList<EmployeeAllowance>();
		EmployeeAllowance employeeAllowance = null;
		try {
			String query = "select * from tbl_employee_allowance where employee_id = "+employeeId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				employeeAllowance = new EmployeeAllowance(rSet.getLong("id"), rSet.getLong("employee_id"), 
						rSet.getInt("allowance_id"), rSet.getFloat("allowance_amount"), 
						rSet.getInt("currency_id"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));
				list.add(employeeAllowance);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static EmployeeAllowance getEmployeeAllowance(long id){
		EmployeeAllowance employeeAllowance = null;
		try {
			String query = "select * from tbl_employee_allowance where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				employeeAllowance = new EmployeeAllowance(rSet.getLong("id"), rSet.getLong("employee_id"), 
						rSet.getInt("allowance_id"), rSet.getFloat("allowance_amount"), 
						rSet.getInt("currency_id"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return employeeAllowance;
	}
	
	public static float getEmployeeAllowanceSumForThisEmployee(long employeeId){
		float allowanceSumTotal = 0.0f;
		try{
			String query = "select sum(allowance_amount) as tot from tbl_employee_allowance where employee_id = "+employeeId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				allowanceSumTotal = rSet.getFloat("tot");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return allowanceSumTotal;
	}
	
	public static EmployeeAllowance getEmployeeAllowanceForThisEmployeeAndType(long employeeId,String allowanceName){
		EmployeeAllowance employeeAllowance = null;
		try {
			String query = "select * from tbl_employee_allowance, tbl_allowance where tbl_employee_allowance.employee_id = "+
		employeeId+" and tbl_employee_allowance.allowance_id = tbl_allowance.id and tbl_allowance.allowance_name = '"+allowanceName+"'";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				employeeAllowance = new EmployeeAllowance(rSet.getLong("id"), rSet.getLong("employee_id"), 
						rSet.getInt("allowance_id"), rSet.getFloat("allowance_amount"), 
						rSet.getInt("currency_id"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return employeeAllowance;
	}
}//end class
