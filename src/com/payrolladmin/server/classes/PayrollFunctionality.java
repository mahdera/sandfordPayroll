/**
 * 
 */
package com.payrolladmin.server.classes;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * @author mahder
 * 
 */
public class PayrollFunctionality {
	private int id;
	private String functionalityName;
	private String description;
	private String menuName;

	/**
	 * 
	 */
	public PayrollFunctionality() {
	}

	/**
	 * @param functionalityName
	 * @param description
	 * @param menuName
	 */
	public PayrollFunctionality(String functionalityName, String description,
			String menuName) {
		this.functionalityName = functionalityName;
		this.description = description;
		this.menuName = menuName;
	}

	/**
	 * @param id
	 * @param functionalityName
	 * @param description
	 * @param menuName
	 */
	public PayrollFunctionality(int id, String functionalityName, String description,
			String menuName) {
		this.id = id;
		this.functionalityName = functionalityName;
		this.description = description;
		this.menuName = menuName;
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
	 * @return the functionalityName
	 */
	public String getFunctionalityName() {
		return functionalityName;
	}

	/**
	 * @param functionalityName the functionalityName to set
	 */
	public void setFunctionalityName(String functionalityName) {
		this.functionalityName = functionalityName;
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
	 * @return the menuName
	 */
	public String getMenuName() {
		return menuName;
	}

	/**
	 * @param menuName the menuName to set
	 */
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public void addFunctionality() {
		try {
			String command = "INSERT INTO tbl_functionality VALUES(0,'"+this.getFunctionalityName()+"','"+this.getDescription()+"','"+this.getMenuName()+"')";
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void updateFunctionality() {
		try {

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void deleteFunctionality(int id) {
		try {
			String command = "DELETE FROM tbl_functionality WHERE id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<PayrollFunctionality> getAllFunctionalities() {
		List<PayrollFunctionality> list = new ArrayList<PayrollFunctionality>();
		PayrollFunctionality payrollFunctionality = null;
		try {
			String query = "SELECT * FROM tbl_payroll_functionality ORDER BY menu_rank ASC";			
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				payrollFunctionality = new PayrollFunctionality(rSet.getInt("id"),rSet.getString("functionality_name"),rSet.getString("description"),rSet.getString("menu_name"));
				list.add(payrollFunctionality);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static PayrollFunctionality getFunctionality(int id) {
		PayrollFunctionality payrollFunctionality = null;
		try {
			String query = "SELECT * FROM tbl_functionality WHERE id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				payrollFunctionality = new PayrollFunctionality(rSet.getInt("id"),rSet.getString("functionality_name"),rSet.getString("description"),rSet.getString("menu_name"));			
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return payrollFunctionality;
	}
	
	public static PayrollFunctionality getFunctionalityByFunctionalityName(String functionalityName){
		PayrollFunctionality payrollFunctionality = null;
		try {
			String query = "SELECT * FROM tbl_functionality WHERE functionality_name = '"+functionalityName+"'";
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				payrollFunctionality = new PayrollFunctionality(rSet.getInt("id"),rSet.getString("functionality_name"),rSet.getString("description"),rSet.getString("menu_name"));			
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return payrollFunctionality;
	}
}// end class
