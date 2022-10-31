package kr.co.jboard1.dao;

public class UserDAO {
	private static UserDAO instance = new UserDAO();
	public static UserDAO getInstance() {
		return instance;
	}
	private UserDAO() {}
	
	//기본 CRUD
	//반환값을 모를경우 void
	public void insertUser() {}
	public void selectUser() {}
	public void selectUsers() {}
	public void updateUser() {}
	public void deleteUser() {}
	
	
	
	
}
