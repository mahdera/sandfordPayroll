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
public class Gratuity {
	private long id;
	private long employeeId;
	private float amountGiven;
	private int currencyId;
	private Date dateGiven;
	private String description;
	private int modifiedBy;
	private Date modificationDate;

	/**
	 * 
	 */
	public Gratuity() {
	}

	/**
	 * @param employeeId
	 * @param amountGiven
	 * @param currencyId
	 * @param dateGiven
	 * @param description
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public Gratuity(long employeeId, float amountGiven, int currencyId,
			Date dateGiven, String description, int modifiedBy,
			Date modificationDate) {
		this.employeeId = employeeId;
		this.amountGiven = amountGiven;
		this.currencyId = currencyId;
		this.dateGiven = dateGiven;
		this.description = description;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}

	/**
	 * @param id
	 * @param employeeId
	 * @param amountGiven
	 * @param currencyId
	 * @param dateGiven
	 * @param description
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public Gratuity(long id, long employeeId, float amountGiven,
			int currencyId, Date dateGiven, String description, int modifiedBy,
			Date modificationDate) {
		this.id = id;
		this.employeeId = employeeId;
		this.amountGiven = amountGiven;
		this.currencyId = currencyId;
		this.dateGiven = dateGiven;
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
	 * @return the amountGiven
	 */
	public float getAmountGiven() {
		return amountGiven;
	}

	/**
	 * @param amountGiven
	 *            the amountGiven to set
	 */
	public void setAmountGiven(float amountGiven) {
		this.amountGiven = amountGiven;
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
	 * @return the dateGiven
	 */
	public Date getDateGiven() {
		return dateGiven;
	}

	/**
	 * @param dateGiven
	 *            the dateGiven to set
	 */
	public void setDateGiven(Date dateGiven) {
		this.dateGiven = dateGiven;
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
			String sqlStr = "insert into tbl_gratuity values(?,?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, 0);
			pStmt.setLong(2, this.getEmployeeId());
			pStmt.setFloat(3, this.getAmountGiven());
			pStmt.setInt(4, this.getCurrencyId());
			pStmt.setDate(5, this.getDateGiven());
			pStmt.setString(6, this.getDescription());
			pStmt.setInt(7, this.getModifiedBy());
			pStmt.setDate(8, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void update(Gratuity gratuity) {
		try {
			String sqlStr = "update tbl_gratuity set employee_id = ?, amount_given = ?, currency_id = ?," +
					"date_given = ?, description = ?, modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, gratuity.getEmployeeId());
			pStmt.setFloat(2, gratuity.getAmountGiven());
			pStmt.setInt(3, gratuity.getCurrencyId());
			pStmt.setDate(4, gratuity.getDateGiven());
			pStmt.setString(5, gratuity.getDescription());
			pStmt.setInt(6, gratuity.getModifiedBy());
			pStmt.setDate(7, gratuity.getModificationDate());
			pStmt.setLong(8, gratuity.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(long id) {
		try {
			String sqlStr = "delete from tbl_gratuity where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<Gratuity> getAllGratuities() {
		List<Gratuity> list = new ArrayList<Gratuity>();
		Gratuity gratuity = null;
		try {
			String query = "select * from tbl_gratuity order by modification_date desc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				gratuity = new Gratuity(rSet.getLong("id"), rSet.getLong("employee_id"), 
						rSet.getFloat("amount_given"), rSet.getInt("currency_id"), rSet.getDate("date_given"), 
						rSet.getString("description"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));
				list.add(gratuity);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static Gratuity getGratuity(long id) {
		Gratuity gratuity = null;
		try {
			String query = "select * from tbl_gratuity where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				gratuity = new Gratuity(rSet.getLong("id"), rSet.getLong("employee_id"), 
						rSet.getFloat("amount_given"), rSet.getInt("currency_id"), rSet.getDate("date_given"), 
						rSet.getString("description"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return gratuity;
	}
	
	public static Gratuity getGratuityForEmployee(long employeeId){
		Gratuity gratuity = null;
		try {
			String query = "select * from tbl_gratuity where employee_id = "+employeeId;
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				gratuity = new Gratuity(rSet.getLong("id"), rSet.getLong("employee_id"), 
						rSet.getFloat("amount_given"), rSet.getInt("currency_id"), rSet.getDate("date_given"), 
						rSet.getString("description"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return gratuity;
	}
}// end class
