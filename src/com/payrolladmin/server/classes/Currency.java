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
public class Currency {
	private int id;
	private String currencyName;
	private String description;
	private int modifiedBy;
	private Date modificationDate;
	/**
	 * 
	 */
	public Currency() {
	}
	/**
	 * @param currencyName
	 * @param description
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public Currency(String currencyName, String description, int modifiedBy,
			Date modificationDate) {
		this.currencyName = currencyName;
		this.description = description;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}
	/**
	 * @param id
	 * @param currencyName
	 * @param description
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public Currency(int id, String currencyName, String description,
			int modifiedBy, Date modificationDate) {
		this.id = id;
		this.currencyName = currencyName;
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
	 * @return the currencyName
	 */
	public String getCurrencyName() {
		return currencyName;
	}
	/**
	 * @param currencyName the currencyName to set
	 */
	public void setCurrencyName(String currencyName) {
		this.currencyName = currencyName;
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
			String sqlStr = "insert into tbl_currency values(?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, 0);
			pStmt.setString(2, this.getCurrencyName());
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
	
	public static void update(Currency currency){
		try {
			String sqlStr = "update tbl_currency set currency_name = ?, description = ?," +
					"modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setString(1, currency.getCurrencyName());
			pStmt.setString(2, currency.getDescription());
			pStmt.setInt(3, currency.getModifiedBy());
			pStmt.setDate(4, currency.getModificationDate());
			pStmt.setInt(5, currency.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void delete(int id){
		try {
			String sqlStr = "delete from tbl_currency where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<Currency> getAlCurrencies(){
		List<Currency> list = new ArrayList<Currency>();
		Currency currency = null;
		try {
			String query = "select * from tbl_currency order by modification_date desc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				currency = new Currency(rSet.getInt("id"),rSet.getString("currency_name"),
						rSet.getString("description"),rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(currency);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static Currency getCurrency(int id){
		Currency currency = null;
		try {
			String query = "select * from tbl_currency where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				currency = new Currency(rSet.getInt("id"),rSet.getString("currency_name"),
						rSet.getString("description"),rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return currency;
	}
}//end class
