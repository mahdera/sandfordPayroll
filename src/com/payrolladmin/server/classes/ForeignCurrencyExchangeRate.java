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
public class ForeignCurrencyExchangeRate {
	private int id;
	private String currencyName;
	private float etbEquivalentAmount;
	private int modifiedBy;
	private Date modificationDate;

	/**
	 * 
	 */
	public ForeignCurrencyExchangeRate() {
	}

	/**
	 * @param currencyName
	 * @param etbEquivalentAmount
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public ForeignCurrencyExchangeRate(String currencyName,
			float etbEquivalentAmount, int modifiedBy, Date modificationDate) {
		this.currencyName = currencyName;
		this.etbEquivalentAmount = etbEquivalentAmount;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}

	/**
	 * @param id
	 * @param currencyName
	 * @param etbEquivalentAmount
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public ForeignCurrencyExchangeRate(int id, String currencyName,
			float etbEquivalentAmount, int modifiedBy, Date modificationDate) {
		this.id = id;
		this.currencyName = currencyName;
		this.etbEquivalentAmount = etbEquivalentAmount;
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
	 * @return the currencyName
	 */
	public String getCurrencyName() {
		return currencyName;
	}

	/**
	 * @param currencyName
	 *            the currencyName to set
	 */
	public void setCurrencyName(String currencyName) {
		this.currencyName = currencyName;
	}

	/**
	 * @return the etbEquivalentAmount
	 */
	public float getEtbEquivalentAmount() {
		return etbEquivalentAmount;
	}

	/**
	 * @param etbEquivalentAmount
	 *            the etbEquivalentAmount to set
	 */
	public void setEtbEquivalentAmount(float etbEquivalentAmount) {
		this.etbEquivalentAmount = etbEquivalentAmount;
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
			String sqlStr = "insert into tbl_foreign_currency_exchange_rate values(?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, 0);
			pStmt.setString(2, this.getCurrencyName());
			pStmt.setFloat(3, this.getEtbEquivalentAmount());
			pStmt.setInt(4, this.getModifiedBy());
			pStmt.setDate(5, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void update(ForeignCurrencyExchangeRate foreignCurrencyExchangeRate) {
		try {
			String sqlStr = "update tbl_foreign_currency_exchange_rate set currency_name = ?," +
					"etb_equivalent_amount = ?, modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setString(1, foreignCurrencyExchangeRate.getCurrencyName());
			pStmt.setFloat(2, foreignCurrencyExchangeRate.getEtbEquivalentAmount());
			pStmt.setInt(3, foreignCurrencyExchangeRate.getModifiedBy());
			pStmt.setDate(4, foreignCurrencyExchangeRate.getModificationDate());
			pStmt.setInt(5, foreignCurrencyExchangeRate.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(int id) {
		try {
			String sqlStr = "delete from tbl_foreign_currency_exchange_rate where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<ForeignCurrencyExchangeRate> getAllCurrencyExchangeRates() {
		List<ForeignCurrencyExchangeRate> list = new ArrayList<ForeignCurrencyExchangeRate>();
		ForeignCurrencyExchangeRate foreignCurrencyExchangeRate = null;
		try {
			String query = "select * from tbl_foreign_currency_exchange_rate order by modification_date desc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				foreignCurrencyExchangeRate = new ForeignCurrencyExchangeRate(rSet.getInt("id"), rSet.getString("currency_name"), 
						rSet.getFloat("etb_equivalent_amount"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));
				list.add(foreignCurrencyExchangeRate);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static ForeignCurrencyExchangeRate getForeignCurrencyExchangeRate(int id) {
		ForeignCurrencyExchangeRate foreignCurrencyExchangeRate = null;
		try {
			String query = "select * from tbl_foreign_currency_exchange_rate where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				foreignCurrencyExchangeRate = new ForeignCurrencyExchangeRate(rSet.getInt("id"), rSet.getString("currency_name"), 
						rSet.getFloat("etb_equivalent_amount"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return foreignCurrencyExchangeRate;
	}
	
	public static ForeignCurrencyExchangeRate getForeignCurrencyExchangeRateForCurrency(String currencyName){
		ForeignCurrencyExchangeRate foreignCurrencyExchangeRate = null;
		try {
			String query = "select * from tbl_foreign_currency_exchange_rate where currency_name = '"+currencyName+"'";			
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				foreignCurrencyExchangeRate = new ForeignCurrencyExchangeRate(rSet.getInt("id"), rSet.getString("currency_name"), 
						rSet.getFloat("etb_equivalent_amount"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return foreignCurrencyExchangeRate;
	}
}// end class
