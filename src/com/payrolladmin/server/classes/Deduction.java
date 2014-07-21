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
public class Deduction {
	private int id;
	private String deductionName;
	private String description;
	private int modifiedBy;
	private Date modificationDate;
	/**
	 * 
	 */
	public Deduction() {
	}
	/**
	 * @param deductionName
	 * @param description
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public Deduction(String deductionName, String description, int modifiedBy,
			Date modificationDate) {
		this.deductionName = deductionName;
		this.description = description;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}
	/**
	 * @param id
	 * @param deductionName
	 * @param description
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public Deduction(int id, String deductionName, String description,
			int modifiedBy, Date modificationDate) {
		this.id = id;
		this.deductionName = deductionName;
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
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return the deductionName
	 */
	public String getDeductionName() {
		return deductionName;
	}
	/**
	 * @param deductionName the deductionName to set
	 */
	public void setDeductionName(String deductionName) {
		this.deductionName = deductionName;
	}
	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}
	/**
	 * @param description the description to set
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
			String sqlStr = "insert into tbl_deduction values(?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, 0);
			pStmt.setString(2, this.getDeductionName());
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
	
	public static void update(Deduction deduction){
		try {
			String sqlStr = "update tbl_deduction set deduction_name = ?, description = ?, modified_by = ?," +
					"modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setString(1, deduction.getDeductionName());
			pStmt.setString(2, deduction.getDescription());
			pStmt.setInt(3, deduction.getModifiedBy());
			pStmt.setDate(4, deduction.getModificationDate());
			pStmt.setInt(5, deduction.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void delete(int id){
		try {
			String sqlStr = "delete from tbl_deduction where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<Deduction> getAllDeductions(){
		List<Deduction> list = new ArrayList<Deduction>();
		Deduction deduction = null;
		try {
			String query = "select * from tbl_deduction order by deduction_name asc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				deduction = new Deduction(rSet.getInt("id"), rSet.getString("deduction_name"), 
						rSet.getString("description"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));
				list.add(deduction);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static Deduction getDeduction(int id){
		Deduction deduction = null;
		try {
			String query = "select * from tbl_deduction where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				deduction = new Deduction(rSet.getInt("id"), rSet.getString("deduction_name"), 
						rSet.getString("description"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return deduction;
	}
}//end class
