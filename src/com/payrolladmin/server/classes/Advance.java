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
public class Advance {
	private long id;
	private long employeeId;
	private float advanceAmount;
	private Date advanceDate;
	private String reason;
	private int modifiedBy;
	private Date modificationDate;

	/**
	 * 
	 */
	public Advance() {
	}

	/**
	 * @param employeeId
	 * @param advanceAmount
	 * @param advanceDate
	 * @param reason
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public Advance(long employeeId, float advanceAmount, Date advanceDate,
			String reason, int modifiedBy, Date modificationDate) {
		this.employeeId = employeeId;
		this.advanceAmount = advanceAmount;
		this.advanceDate = advanceDate;
		this.reason = reason;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}

	/**
	 * @param id
	 * @param employeeId
	 * @param advanceAmount
	 * @param advanceDate
	 * @param reason
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public Advance(long id, long employeeId, float advanceAmount,
			Date advanceDate, String reason, int modifiedBy,
			Date modificationDate) {
		this.id = id;
		this.employeeId = employeeId;
		this.advanceAmount = advanceAmount;
		this.advanceDate = advanceDate;
		this.reason = reason;
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
	 * @return the advanceAmount
	 */
	public float getAdvanceAmount() {
		return advanceAmount;
	}

	/**
	 * @param advanceAmount
	 *            the advanceAmount to set
	 */
	public void setAdvanceAmount(float advanceAmount) {
		this.advanceAmount = advanceAmount;
	}

	/**
	 * @return the advanceDate
	 */
	public Date getAdvanceDate() {
		return advanceDate;
	}

	/**
	 * @param advanceDate
	 *            the advanceDate to set
	 */
	public void setAdvanceDate(Date advanceDate) {
		this.advanceDate = advanceDate;
	}

	/**
	 * @return the reason
	 */
	public String getReason() {
		return reason;
	}

	/**
	 * @param reason
	 *            the reason to set
	 */
	public void setReason(String reason) {
		this.reason = reason;
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
			String sqlStr = "insert into tbl_advance values(?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, 0);
			pStmt.setLong(2, this.getEmployeeId());
			pStmt.setFloat(3, this.getAdvanceAmount());
			pStmt.setDate(4, this.getAdvanceDate());
			pStmt.setString(5, this.getReason());
			pStmt.setInt(6, this.getModifiedBy());
			pStmt.setDate(7, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void update(Advance advance) {
		try {
			String sqlStr = "update tbl_advance set employee_id = ?, advance_amount = ?," +
					"advance_date = ?, reason = ?, modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, advance.getEmployeeId());
			pStmt.setFloat(2, advance.getAdvanceAmount());
			pStmt.setDate(3, advance.getAdvanceDate());
			pStmt.setString(4, advance.getReason());
			pStmt.setInt(5, advance.getModifiedBy());
			pStmt.setDate(6, advance.getModificationDate());
			pStmt.setLong(7, advance.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(long id) {
		try {
			String sqlStr = "delete from tbl_advance where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<Advance> getAllAdvances() {
		List<Advance> list = new ArrayList<Advance>();
		Advance advance = null;
		try {
			String query = "select * from tbl_advance order by modification_date desc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				advance = new Advance(rSet.getLong("id"),rSet.getLong("employee_id"),rSet.getFloat("advance_amount"),
						rSet.getDate("advance_date"),rSet.getString("reason"),rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(advance);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static List<Advance> getAllAdvancePaymentsForEmployee(long employeeId){
		List<Advance> list = new ArrayList<Advance>();
		Advance advance = null;
		try {
			String query = "select * from tbl_advance where employee_id = "+employeeId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				advance = new Advance(rSet.getLong("id"),rSet.getLong("employee_id"),rSet.getFloat("advance_amount"),
						rSet.getDate("advance_date"),rSet.getString("reason"),rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(advance);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static float getAllAdvancePaymentsForEmployeePaiedDuring(long employeeId,Date startDate,Date endDate){
		float advancePaymentSum = 0.0f;
		try{
			String sqlStr = "select sum(advance_amount) as amt from tbl_advance where employee_id = "+
		employeeId+" and advance_date between '"+startDate+"' and '"+endDate+"'";
			ResultSet rSet = DBConnection.readFromDatabase(sqlStr);
			while(rSet.next()){
				advancePaymentSum = rSet.getFloat("amt");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return advancePaymentSum;
	}

	public static Advance getAdvance(long id) {
		Advance advance = null;
		try {
			String query = "select * from tbl_advance where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				advance = new Advance(rSet.getLong("id"),rSet.getLong("employee_id"),rSet.getFloat("advance_amount"),
						rSet.getDate("advance_date"),rSet.getString("reason"),rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return advance;
	}
}// end class
