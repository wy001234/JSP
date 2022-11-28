package service.user1;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class modifyService {
	
	private static  modifyService instance = new modifyService();
	public static  modifyService getInstance() {
		return instance;
	};
	
	private modifyService() {}
	
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		return "/user1/modify.jsp";
	}

}
