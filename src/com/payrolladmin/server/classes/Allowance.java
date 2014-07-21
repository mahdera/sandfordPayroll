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
public class Allowance {
	private int id;
	private String allowanceName;
	private String description;
	private int modifiedBy;
	private Date modificationDate;

	/**
	 * 
	 */
	public Allowance() {
	}

	/**
	 * @param allowanceName
	 * @param description
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public Allowance(String allowanceName, String description, int modifiedBy,
			Date modificationDate) {
		this.allowanceName = allowanceName;
		this.description = description;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}

	/**
	 * @param id
	 * @param allowanceName
	 * @param description
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public Allowance(int id, String allowanceName, String description,
			int modifiedBy, Date modificationDate) {
		this.id = id;
		this.allowanceName = allowanceName;
		this.description = description;
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
	 * @return the allowanceName
	 */
	public String getAllowanceName() {
		return allowanceName;
	}

	/**
	 * @param allowanceName
	 *            the allowanceName to set
	 */
	public void setAllowanceName(String allowanceName) {
		this.allowanceName = allowanceName;
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

	public void save() {
		try {
			String sqlStr = "insert into tbl_allowance values(?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, 0);
			pStmt.setString(2, this.getAllowanceName());
			pStmt.setString(3, this.getDescription());
			pStmt.setInt(4, this.getModifiedBy());
			pStmt.setDate(5, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void update(Allowance allowance) {
		try {
			String sqlStr = "update tbl_allowance set allowance_name = ?, description = ?," +
					"modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setString(1, allowance.getAllowanceName());
			pStmt.setString(2, allowance.getDescription());
			pStmt.setInt(3, allowance.getModifiedBy());
			pStmt.setDate(4, allowance.getModificationDate());
			pStmt.setInt(5, allowance.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(int id) {
		try {
			String sqlStr = "delete from tbl_allowance where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<Allowance> getAllAllowances() {
		List<Allowance> list = new ArrayList<Allowance>();
		Allowance allowance = null;
		try {
			String query = "select * from tbl_allowance order by modification_date desc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				allowance = new Allowance(rSet.getInt("id"), rSet.getString("allowance_name"), 
						rSet.getString("description"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));
				list.add(allowance);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static Allowance getAllowance(int id) {
		Allowance allowance = null;
		try {
			String query = "select * from tbl_allowance where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				allowance = new Allowance(rSet.getInt("id"), rSet.getString("allowance_name"), 
						rSet.getString("description"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return allowance;
	}
}// end class
