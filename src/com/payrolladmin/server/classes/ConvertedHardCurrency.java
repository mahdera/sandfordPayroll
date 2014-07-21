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
public class ConvertedHardCurrency {
	private long id;
	private long employeeId;
	private float foreignCurrencyAmount;
	private float exchangeRateUsed;
	private float convHrdCurrencyAmount;
	private Date convertionDate;
	private int modifiedBy;
	private Date modificationDate;

	/**
	 * 
	 */
	public ConvertedHardCurrency() {
	}

	/**
	 * @param employeeId
	 * @param foreignCurrencyAmount
	 * @param exchangeRateUsed
	 * @param convHrdCurrencyAmount
	 * @param convertionDate
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public ConvertedHardCurrency(long employeeId,float foreignCurrencyAmount,float exchangeRateUsed, float convHrdCurrencyAmount,
			Date convertionDate, int modifiedBy, Date modificationDate) {
		this.employeeId = employeeId;
		this.foreignCurrencyAmount = foreignCurrencyAmount;
		this.exchangeRateUsed = exchangeRateUsed;
		this.convHrdCurrencyAmount = convHrdCurrencyAmount;
		this.convertionDate = convertionDate;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}

	/**
	 * @param id
	 * @param employeeId
	 * @param foreignCurrencyAmount
	 * @param exchangeRateUsed
	 * @param convHrdCurrencyAmount
	 * @param convertionDate
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public ConvertedHardCurrency(long id, long employeeId,float foreignCurrencyAmount,float exchangeRateUsed,
			float convHrdCurrencyAmount, Date convertionDate, int modifiedBy,
			Date modificationDate) {
		this.id = id;
		this.employeeId = employeeId;
		this.foreignCurrencyAmount = foreignCurrencyAmount;
		this.exchangeRateUsed = exchangeRateUsed;
		this.convHrdCurrencyAmount = convHrdCurrencyAmount;
		this.convertionDate = convertionDate;
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
	 * @return the convHrdCurrencyAmount
	 */
	public float getConvHrdCurrencyAmount() {
		return convHrdCurrencyAmount;
	}

	/**
	 * @param convHrdCurrencyAmount
	 *            the convHrdCurrencyAmount to set
	 */
	public void setConvHrdCurrencyAmount(float convHrdCurrencyAmount) {
		this.convHrdCurrencyAmount = convHrdCurrencyAmount;
	}

	/**
	 * @return the convertionDate
	 */
	public Date getConvertionDate() {
		return convertionDate;
	}

	/**
	 * @param convertionDate
	 *            the convertionDate to set
	 */
	public void setConvertionDate(Date convertionDate) {
		this.convertionDate = convertionDate;
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
	
	

	/**
	 * @return the foreignCurrencyAmount
	 */
	public float getForeignCurrencyAmount() {
		return foreignCurrencyAmount;
	}

	/**
	 * @param foreignCurrencyAmount the foreignCurrencyAmount to set
	 */
	public void setForeignCurrencyAmount(float foreignCurrencyAmount) {
		this.foreignCurrencyAmount = foreignCurrencyAmount;
	}

	/**
	 * @return the exchangeRateUsed
	 */
	public float getExchangeRateUsed() {
		return exchangeRateUsed;
	}

	/**
	 * @param exchangeRateUsed the exchangeRateUsed to set
	 */
	public void setExchangeRateUsed(float exchangeRateUsed) {
		this.exchangeRateUsed = exchangeRateUsed;
	}

	public void save() {
		try {
			String sqlStr = "insert into tbl_converted_hard_currency values(?,?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, 0);
			pStmt.setLong(2, this.getEmployeeId());
			pStmt.setFloat(3, this.getForeignCurrencyAmount());
			pStmt.setFloat(4, this.getExchangeRateUsed());
			pStmt.setFloat(5, this.getConvHrdCurrencyAmount());
			pStmt.setDate(6, this.getConvertionDate());
			pStmt.setInt(7, this.getModifiedBy());
			pStmt.setDate(8, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void update(ConvertedHardCurrency convertedHardCurrency) {
		try {
			String sqlStr = "update tbl_converted_hard_currency set employee_id = ?,foreign_currency_amount = ?,exchange_rate_used = ?, conv_hrd_currency_amount = ?," +
					"convertion_date = ?, modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, convertedHardCurrency.getEmployeeId());
			pStmt.setFloat(2, convertedHardCurrency.getForeignCurrencyAmount());
			pStmt.setFloat(3, convertedHardCurrency.getExchangeRateUsed());
			pStmt.setFloat(4, convertedHardCurrency.getConvHrdCurrencyAmount());
			pStmt.setDate(5, convertedHardCurrency.getConvertionDate());
			pStmt.setInt(6, convertedHardCurrency.getModifiedBy());
			pStmt.setDate(7, convertedHardCurrency.getModificationDate());
			pStmt.setLong(8, convertedHardCurrency.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(long id) {
		try {
			String sqlStr = "delete from tbl_converted_hard_currency where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<ConvertedHardCurrency> getAllConvertedHardCurrencies() {
		List<ConvertedHardCurrency> list = new ArrayList<ConvertedHardCurrency>();
		ConvertedHardCurrency convertedHardCurrency = null;
		try {
			String query = "select * from tbl_converted_hard_currency order by modification_date desc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				convertedHardCurrency = new ConvertedHardCurrency(rSet.getLong("id"), 
						rSet.getLong("employee_id"),rSet.getFloat("foreign_currency_amount"),rSet.getFloat("exchange_rate_used"), 
						rSet.getFloat("conv_hrd_currency_amount"), rSet.getDate("convertion_date"), 
						rSet.getInt("modified_by"), rSet.getDate("modification_date"));
				list.add(convertedHardCurrency);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static ConvertedHardCurrency getConvertedHardCurrency(long id) {
		ConvertedHardCurrency convertedHardCurrency = null;
		try {
			String query = "select * from tbl_converted_hard_currency where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				convertedHardCurrency = new ConvertedHardCurrency(rSet.getLong("id"), 
						rSet.getLong("employee_id"),rSet.getFloat("foreign_currency_amount"),rSet.getFloat("exchange_rate_used"), 
						rSet.getFloat("conv_hrd_currency_amount"), rSet.getDate("convertion_date"), 
						rSet.getInt("modified_by"), rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return convertedHardCurrency;
	}
	
	public static ConvertedHardCurrency getMostRecentConvertedHardCurrencyForEmployee(long employeeId){
		ConvertedHardCurrency convertedHardCurrency = null;
		try {
			String query = "select * from tbl_converted_hard_currency where employee_id = "+employeeId+" order by convertion_date desc limit 0,1";
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				convertedHardCurrency = new ConvertedHardCurrency(rSet.getLong("id"), 
						rSet.getLong("employee_id"),rSet.getFloat("foreign_currency_amount"),rSet.getFloat("exchange_rate_used"), 
						rSet.getFloat("conv_hrd_currency_amount"), rSet.getDate("convertion_date"), 
						rSet.getInt("modified_by"), rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return convertedHardCurrency;
	}
}// end class
