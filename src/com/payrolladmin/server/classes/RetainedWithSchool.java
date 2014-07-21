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
public class RetainedWithSchool {
	private long id;
	private long employeeId;
	private float percentValue;
	private float balance;
	private int modifiedBy;
	private Date modificationDate;

	/**
	 * 
	 */
	public RetainedWithSchool() {
	}

	/**
	 * @param employeeId
	 * @param percentValue
	 * @param balance
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public RetainedWithSchool(long employeeId, float percentValue,
			float balance, int modifiedBy, Date modificationDate) {
		this.employeeId = employeeId;
		this.percentValue = percentValue;
		this.balance = balance;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}

	/**
	 * @param id
	 * @param employeeId
	 * @param percentValue
	 * @param balance
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public RetainedWithSchool(long id, long employeeId, float percentValue,
			float balance, int modifiedBy, Date modificationDate) {
		this.id = id;
		this.employeeId = employeeId;
		this.percentValue = percentValue;
		this.balance = balance;
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
	 * @return the percentValue
	 */
	public float getPercentValue() {
		return percentValue;
	}

	/**
	 * @param percentValue
	 *            the percentValue to set
	 */
	public void setPercentValue(float percentValue) {
		this.percentValue = percentValue;
	}

	/**
	 * @return the balance
	 */
	public float getBalance() {
		return balance;
	}

	/**
	 * @param balance
	 *            the balance to set
	 */
	public void setBalance(float balance) {
		this.balance = balance;
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
			String sqlStr = "insert into tbl_retained_with_school values(?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, 0);
			pStmt.setLong(2, this.getEmployeeId());
			pStmt.setFloat(3, this.getPercentValue());
			pStmt.setFloat(4, this.getBalance());
			pStmt.setInt(5, this.getModifiedBy());
			pStmt.setDate(6, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void update(RetainedWithSchool retainedWithSchool) {
		try {
			String sqlStr = "update tbl_retained_with_school set employee_id = ?, percent_value = ?," +
					"balance = ?, modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, retainedWithSchool.getEmployeeId());
			pStmt.setFloat(2, retainedWithSchool.getPercentValue());
			pStmt.setFloat(3, retainedWithSchool.getBalance());
			pStmt.setInt(4, retainedWithSchool.getModifiedBy());
			pStmt.setDate(5, retainedWithSchool.getModificationDate());
			pStmt.setLong(6, retainedWithSchool.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(long id) {
		try {
			String sqlStr = "delete from tbl_retained_with_school where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<RetainedWithSchool> getAllRetainedWithSchools() {
		List<RetainedWithSchool> list = new ArrayList<RetainedWithSchool>();
		RetainedWithSchool retainedWithSchool = null;
		try {
			String query = "select * from tbl_retained_with_school order by modification_date desc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				retainedWithSchool = new RetainedWithSchool(rSet.getLong("id"), rSet.getLong("employee_id"), 
						rSet.getFloat("percent_value"), rSet.getFloat("balance"), rSet.getInt("modified_by"), 
						rSet.getDate("modification_date"));
				list.add(retainedWithSchool);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static RetainedWithSchool getRetainedWithSchool(long id) {
		RetainedWithSchool retainedWithSchool = null;
		try {
			String query = "select * from tbl_retained_with_school order by modification_date desc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				retainedWithSchool = new RetainedWithSchool(rSet.getLong("id"), rSet.getLong("employee_id"), 
						rSet.getFloat("percent_value"), rSet.getFloat("balance"), rSet.getInt("modified_by"), 
						rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return retainedWithSchool;
	}
	
	public static RetainedWithSchool getRetainedWithSchoolForThisEmployee(long employeeId){
		RetainedWithSchool retainedWithSchool = null;
		try {
			String query = "select * from tbl_retained_with_school where employee_id = "+employeeId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				retainedWithSchool = new RetainedWithSchool(rSet.getLong("id"), rSet.getLong("employee_id"), 
						rSet.getFloat("percent_value"), rSet.getFloat("balance"), rSet.getInt("modified_by"), 
						rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return retainedWithSchool;
	}
}// end class
