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
public class WhoIsTaxPayer {
	private int id;
	private long employeeId;
	private String taxPayer;
	private int modifiedBy;
	private Date modificationDate;

	/**
	 * 
	 */
	public WhoIsTaxPayer() {
	}

	/**
	 * @param employeeId
	 * @param taxPayer
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public WhoIsTaxPayer(long employeeId, String taxPayer, int modifiedBy,
			Date modificationDate) {
		this.employeeId = employeeId;
		this.taxPayer = taxPayer;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}

	/**
	 * @param id
	 * @param employeeId
	 * @param taxPayer
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public WhoIsTaxPayer(int id, long employeeId, String taxPayer,
			int modifiedBy, Date modificationDate) {
		this.id = id;
		this.employeeId = employeeId;
		this.taxPayer = taxPayer;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(int id) {
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
	 * @return the taxPayer
	 */
	public String getTaxPayer() {
		return taxPayer;
	}

	/**
	 * @param taxPayer
	 *            the taxPayer to set
	 */
	public void setTaxPayer(String taxPayer) {
		this.taxPayer = taxPayer;
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
			String sqlStr = "insert into tbl_who_is_tax_payer values(?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, 0);
			pStmt.setLong(2, this.getEmployeeId());
			pStmt.setString(3, this.getTaxPayer());
			pStmt.setInt(4, this.getModifiedBy());
			pStmt.setDate(5, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void update(WhoIsTaxPayer whoIsTaxPayer) {
		try {
			String sqlStr = "update tbl_who_is_tax_payer set employee_id = ?, tax_payer = ?, modified_by = ?, " +
					"modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, whoIsTaxPayer.getEmployeeId());
			pStmt.setString(2, whoIsTaxPayer.getTaxPayer());
			pStmt.setInt(3, whoIsTaxPayer.getModifiedBy());
			pStmt.setDate(4, whoIsTaxPayer.getModificationDate());
			pStmt.setInt(5, whoIsTaxPayer.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(int id) {
		try {
			String sqlStr = "delete from tbl_who_is_tax_payer where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<WhoIsTaxPayer> getAllWhoIsTaxPayers() {
		List<WhoIsTaxPayer> list = new ArrayList<WhoIsTaxPayer>();
		WhoIsTaxPayer whoIsTaxPayer = null;
		try {
			String query = "select * from tbl_who_is_tax_payer order by modification_date desc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				whoIsTaxPayer = new WhoIsTaxPayer(rSet.getInt("id"), rSet.getLong("employee_id"), 
						rSet.getString("tax_payer"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));
				list.add(whoIsTaxPayer);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static WhoIsTaxPayer getWhoIsTaxPayer(int id) {
		WhoIsTaxPayer whoIsTaxPayer = null;
		try {
			String query = "select * from tbl_who_is_tax_payer where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				whoIsTaxPayer = new WhoIsTaxPayer(rSet.getInt("id"), rSet.getLong("employee_id"), 
						rSet.getString("tax_payer"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return whoIsTaxPayer;
	}
	
	public static WhoIsTaxPayer getWhoIsTaxPayerForThisEmployee(long employeeId){
		WhoIsTaxPayer whoIsTaxPayer = null;
		try {
			String query = "select * from tbl_who_is_tax_payer where employee_id = "+employeeId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				whoIsTaxPayer = new WhoIsTaxPayer(rSet.getInt("id"), rSet.getLong("employee_id"), 
						rSet.getString("tax_payer"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return whoIsTaxPayer;
	}
}// end class
