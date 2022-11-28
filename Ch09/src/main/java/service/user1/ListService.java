package service.user1;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.User1Dao;
import vo.User1Vo;

public class ListService {
	
	private static ListService instance = new ListService();
	public static ListService getInstance() {
		return instance;
	};
	
	private ListService() {}
	
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		

		
		return "/user1/list.jsp";
	}

	
}
