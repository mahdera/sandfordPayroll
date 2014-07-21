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
public class Payroll {
	private long id;
	private String payrollName;
	private String payrollMonth;
	private Date datePrepared;
	private int modifiedBy;
	private Date modificationDate;

	/**
	 * 
	 */
	public Payroll() {
	}

	/**
	 * @param payrollName
	 * @param payrollMonth
	 * @param datePrepared
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public Payroll(String payrollName, String payrollMonth, Date datePrepared,
			int modifiedBy, Date modificationDate) {
		this.payrollName = payrollName;
		this.payrollMonth = payrollMonth;
		this.datePrepared = datePrepared;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}

	/**
	 * @param id
	 * @param payrollName
	 * @param payrollMonth
	 * @param datePrepared
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public Payroll(long id, String payrollName, String payrollMonth,
			Date datePrepared, int modifiedBy, Date modificationDate) {
		this.id = id;
		this.payrollName = payrollName;
		this.payrollMonth = payrollMonth;
		this.datePrepared = datePrepared;
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
	 * @return the payrollName
	 */
	public String getPayrollName() {
		return payrollName;
	}

	/**
	 * @param payrollName
	 *            the payrollName to set
	 */
	public void setPayrollName(String payrollName) {
		this.payrollName = payrollName;
	}

	/**
	 * @return the payrollMonth
	 */
	public String getPayrollMonth() {
		return payrollMonth;
	}

	/**
	 * @param payrollMonth
	 *            the payrollMonth to set
	 */
	public void setPayrollMonth(String payrollMonth) {
		this.payrollMonth = payrollMonth;
	}

	/**
	 * @return the datePrepared
	 */
	public Date getDatePrepared() {
		return datePrepared;
	}

	/**
	 * @param datePrepared
	 *            the datePrepared to set
	 */
	public void setDatePrepared(Date datePrepared) {
		this.datePrepared = datePrepared;
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
			String sqlStr = "insert into tbl_payroll value(?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, 0);
			pStmt.setString(2, this.getPayrollName());
			pStmt.setString(3, this.getPayrollMonth());
			pStmt.setDate(4, this.getDatePrepared());
			pStmt.setInt(5, this.getModifiedBy());
			pStmt.setDate(6, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(long id) {
		try {
			String sqlStr = "delete from tbl_payroll where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<Payroll> getAllPayrolls() {
		List<Payroll> list = new ArrayList<Payroll>();
		Payroll payroll = null;
		try {
			String query = "select * from tbl_payroll order by modification_date desc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				payroll = new Payroll(rSet.getLong("id"), rSet.getString("payroll_name"), rSet.getString("payroll_month"), 
						rSet.getDate("date_prepared"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));
				list.add(payroll);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static Payroll getPayroll(long id) {
		Payroll payroll = null;
		try {
			String query = "select * from tbl_payroll where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				payroll = new Payroll(rSet.getLong("id"), rSet.getString("payroll_name"), rSet.getString("payroll_month"), 
						rSet.getDate("date_prepared"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return payroll;
	}
	
	public static boolean payrollAlreadySaved(String payrollName,int yearParam,int monthParam){
		int cnt = 0;
		boolean recordExists = false;
		try{
			String query = "select count(*) as cnt from tbl_payroll where payroll_name = '"+payrollName+"' and " +
					"DATE_FORMAT(date_prepared, '%Y') = "+yearParam+" and payroll_month = '"+monthParam+"'";
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				cnt = rSet.getInt("cnt");
				if(cnt != 0){
					recordExists = true;
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return recordExists;
	}
	
	public static Payroll fetchPayrollUsing(String payrollName, String payrollMonth, Date datePrepared,
			int modifiedBy, Date modificationDate){
		Payroll payroll = null;
		try {
			String query = "select * from tbl_payroll where payroll_name = '"+payrollName+"' and payroll_month = '"+
		payrollMonth+"' and date_prepared = '"+datePrepared+"' and modified_by = "+modifiedBy+" and modification_date = '"+
					modificationDate+"'";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				payroll = new Payroll(rSet.getLong("id"), rSet.getString("payroll_name"), rSet.getString("payroll_month"), 
						rSet.getDate("date_prepared"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return payroll;
	}
	
	public static Payroll getPayrollUsingPayrollNamePayrollMonthPayrollYear(String payrollName,String payrollMonth,int payrollYear){
		Payroll payroll = null;
		try {
			String query = "select * from tbl_payroll where payroll_name = '"+payrollName+"' and payroll_month = '"+payrollMonth+"' and DATE_FORMAT(date_prepared, '%Y') = "+payrollYear;			
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				payroll = new Payroll(rSet.getLong("id"), rSet.getString("payroll_name"), rSet.getString("payroll_month"), 
						rSet.getDate("date_prepared"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return payroll;
	}
}// end class
