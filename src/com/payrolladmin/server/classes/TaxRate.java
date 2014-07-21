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
public class TaxRate {
	private int id;
	private float lowerBounday;
	private float upperBoundary;
	private float taxRatePercentage;
	private float otherDeduction;
	private int modifiedBy;
	private Date modificationDate;

	/**
	 * 
	 */
	public TaxRate() {
	}

	/**
	 * @param lowerBounday
	 * @param upperBoundary
	 * @param taxRatePercentage
	 * @param otherDeduction
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public TaxRate(float lowerBounday, float upperBoundary,
			float taxRatePercentage, float otherDeduction, int modifiedBy,
			Date modificationDate) {
		this.lowerBounday = lowerBounday;
		this.upperBoundary = upperBoundary;
		this.taxRatePercentage = taxRatePercentage;
		this.otherDeduction = otherDeduction;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}

	/**
	 * @param id
	 * @param lowerBounday
	 * @param upperBoundary
	 * @param taxRatePercentage
	 * @param otherDeduction
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public TaxRate(int id, float lowerBounday, float upperBoundary,
			float taxRatePercentage, float otherDeduction, int modifiedBy,
			Date modificationDate) {
		this.id = id;
		this.lowerBounday = lowerBounday;
		this.upperBoundary = upperBoundary;
		this.taxRatePercentage = taxRatePercentage;
		this.otherDeduction = otherDeduction;
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
	 * @return the lowerBounday
	 */
	public float getLowerBounday() {
		return lowerBounday;
	}

	/**
	 * @param lowerBounday
	 *            the lowerBounday to set
	 */
	public void setLowerBounday(float lowerBounday) {
		this.lowerBounday = lowerBounday;
	}

	/**
	 * @return the upperBoundary
	 */
	public float getUpperBoundary() {
		return upperBoundary;
	}

	/**
	 * @param upperBoundary
	 *            the upperBoundary to set
	 */
	public void setUpperBoundary(float upperBoundary) {
		this.upperBoundary = upperBoundary;
	}

	/**
	 * @return the taxRatePercentage
	 */
	public float getTaxRatePercentage() {
		return taxRatePercentage;
	}

	/**
	 * @param taxRatePercentage
	 *            the taxRatePercentage to set
	 */
	public void setTaxRatePercentage(float taxRatePercentage) {
		this.taxRatePercentage = taxRatePercentage;
	}

	/**
	 * @return the otherDeduction
	 */
	public float getOtherDeduction() {
		return otherDeduction;
	}

	/**
	 * @param otherDeduction
	 *            the otherDeduction to set
	 */
	public void setOtherDeduction(float otherDeduction) {
		this.otherDeduction = otherDeduction;
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
			String sqlStr = "insert into tbl_tax_rate values(?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, 0);
			pStmt.setFloat(2, this.getLowerBounday());
			pStmt.setFloat(3, this.getUpperBoundary());
			pStmt.setFloat(4, this.getTaxRatePercentage());
			pStmt.setFloat(5, this.getOtherDeduction());
			pStmt.setInt(6, this.getModifiedBy());
			pStmt.setDate(7, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void update(TaxRate taxRate) {
		try {
			String sqlStr = "update tbl_tax_rate set lower_boundary = ?, upper_boundary = ?," +
					"tax_rate_percentage = ?, other_deduction = ?, modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setFloat(1, taxRate.getLowerBounday());
			pStmt.setFloat(2, taxRate.getUpperBoundary());
			pStmt.setFloat(3, taxRate.getTaxRatePercentage());
			pStmt.setFloat(4, taxRate.getOtherDeduction());
			pStmt.setInt(5, taxRate.getModifiedBy());
			pStmt.setDate(6, taxRate.getModificationDate());
			pStmt.setInt(7, taxRate.getId());
			//System.out.println(pStmt);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(int id) {
		try {
			String sqlStr = "delete from tbl_tax_rate where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<TaxRate> getAllTaxRates() {
		List<TaxRate> list = new ArrayList<TaxRate>();
		TaxRate taxRate = null;
		try {
			String query = "select * from tbl_tax_rate order by lower_boundary";			
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				taxRate = new TaxRate(rSet.getInt("id"), rSet.getFloat("lower_boundary"), 
						rSet.getFloat("upper_boundary"), rSet.getFloat("tax_rate_percentage"), 
						rSet.getFloat("other_deduction"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));
				list.add(taxRate);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static TaxRate getTaxRate(int id) {
		TaxRate taxRate = null;
		try {
			String query = "select * from tbl_tax_rate where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				taxRate = new TaxRate(rSet.getInt("id"), rSet.getFloat("lower_boundary"), 
						rSet.getFloat("upper_boundary"), rSet.getFloat("tax_rate_percentage"), 
						rSet.getFloat("other_deduction"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return taxRate;
	}
	
	public static TaxRate getTaxRateForThisBasicSalary(float basicSalary){
		TaxRate taxRate = null;
		try {
			String query = "select * from tbl_tax_rate where lower_boundary <= "+basicSalary+" and upper_boundary >= "+basicSalary;			
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				taxRate = new TaxRate(rSet.getInt("id"), rSet.getFloat("lower_boundary"), 
						rSet.getFloat("upper_boundary"), rSet.getFloat("tax_rate_percentage"), 
						rSet.getFloat("other_deduction"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));				
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return taxRate;
	}
}// end class
