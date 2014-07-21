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
public class EmployeeOvertime {
	private long id;
	private long employeeId;
	private float totalHoursWorked;
	private Date dateWorked;
	private float ratePerHour;
	private int modifiedBy;
	private Date modificationDate;
	
	/**
	 * 
	 */
	public EmployeeOvertime() {
	}

	

	/**
	 * @param employeeId
	 * @param totalHoursWorked
	 * @param dateWorked
	 * @param ratePerHour
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public EmployeeOvertime(long employeeId, float totalHoursWorked,
			Date dateWorked, float ratePerHour, int modifiedBy,
			Date modificationDate) {
		this.employeeId = employeeId;
		this.totalHoursWorked = totalHoursWorked;
		this.dateWorked = dateWorked;
		this.ratePerHour = ratePerHour;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
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
	 * @param id
	 * @param employeeId
	 * @param totalHoursWorked
	 * @param dateWorked
	 * @param ratePerHour
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public EmployeeOvertime(long id, long employeeId, float totalHoursWorked,
			Date dateWorked, float ratePerHour, int modifiedBy,
			Date modificationDate) {
		this.id = id;
		this.employeeId = employeeId;
		this.totalHoursWorked = totalHoursWorked;
		this.dateWorked = dateWorked;
		this.ratePerHour = ratePerHour;
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
	 * @return the totalHoursWorked
	 */
	public float getTotalHoursWorked() {
		return totalHoursWorked;
	}

	/**
	 * @param totalHoursWorked
	 *            the totalHoursWorked to set
	 */
	public void setTotalHoursWorked(float totalHoursWorked) {
		this.totalHoursWorked = totalHoursWorked;
	}

	/**
	 * @return the dateWorked
	 */
	public Date getDateWorked() {
		return dateWorked;
	}

	/**
	 * @param dateWorked
	 *            the dateWorked to set
	 */
	public void setDateWorked(Date dateWorked) {
		this.dateWorked = dateWorked;
	}

	/**
	 * @return the ratePerHour
	 */
	public float getRatePerHour() {
		return ratePerHour;
	}

	/**
	 * @param ratePerHour
	 *            the ratePerHour to set
	 */
	public void setRatePerHour(float ratePerHour) {
		this.ratePerHour = ratePerHour;
	}

	public void save() {
		try {
			String sqlStr = "insert into tbl_employee_overtime values(?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, 0);
			pStmt.setLong(2, this.getEmployeeId());
			pStmt.setFloat(3, this.getTotalHoursWorked());
			pStmt.setDate(4, this.getDateWorked());
			pStmt.setFloat(5, this.getRatePerHour());
			pStmt.setInt(6, this.getModifiedBy());
			pStmt.setDate(7, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void update(EmployeeOvertime employeeOvertime) {
		try {
			String sqlStr = "update tbl_employee_overtime set employee_id = ?, total_hours_worked = ?," +
					"date_worked = ?, rate_per_hour = ?, modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, employeeOvertime.getEmployeeId());
			pStmt.setFloat(2, employeeOvertime.getTotalHoursWorked());
			pStmt.setDate(3, employeeOvertime.getDateWorked());
			pStmt.setFloat(4, employeeOvertime.getRatePerHour());
			pStmt.setInt(5, employeeOvertime.getModifiedBy());
			pStmt.setDate(6, employeeOvertime.getModificationDate());
			pStmt.setLong(7, employeeOvertime.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(long id) {
		try {
			String sqlStr = "delete from tbl_employee_overtime where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<EmployeeOvertime> getAllEmployeeOvertimesForThisEmployee(long employeeId){
		List<EmployeeOvertime> list = new ArrayList<EmployeeOvertime>();
		EmployeeOvertime employeeOvertime = null;
		try {
			String query = "select * from tbl_employee_overtime where employee_id = "+employeeId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				employeeOvertime = new EmployeeOvertime(rSet.getLong("id"), rSet.getLong("employee_id"), 
						rSet.getFloat("total_hours_worked"), rSet.getDate("date_worked"), 
						rSet.getFloat("rate_per_hour"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));
				list.add(employeeOvertime);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static List<EmployeeOvertime> getAllEmployeeOvertimes() {
		List<EmployeeOvertime> list = new ArrayList<EmployeeOvertime>();
		EmployeeOvertime employeeOvertime = null;
		try {
			String query = "select * from tbl_employee_overtime order by modification_date desc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				employeeOvertime = new EmployeeOvertime(rSet.getLong("id"), rSet.getLong("employee_id"), 
						rSet.getFloat("total_hours_worked"), rSet.getDate("date_worked"), 
						rSet.getFloat("rate_per_hour"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));
				list.add(employeeOvertime);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static EmployeeOvertime getEmployeeOvertime(long id) {
		EmployeeOvertime employeeOvertime = null;
		try {
			String query = "select * from tbl_employee_overtime where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				employeeOvertime = new EmployeeOvertime(rSet.getLong("id"), rSet.getLong("employee_id"), 
						rSet.getFloat("total_hours_worked"), rSet.getDate("date_worked"), 
						rSet.getFloat("rate_per_hour"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return employeeOvertime;
	}
	
	public static float getOvertimeSumForThisEmployeeBetweenDates(long employeeId,Date startDate, Date lastDate){
		float otSum = 0.0f;
		try{
			String query = "select sum(total_hours_worked * rate_per_hour) as tot from tbl_employee_overtime where employee_id = "+
		employeeId+" and date_worked between '"+startDate+"' and '"+lastDate+"'";			
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				otSum = rSet.getFloat("tot");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return otSum;
	}
}// end class
