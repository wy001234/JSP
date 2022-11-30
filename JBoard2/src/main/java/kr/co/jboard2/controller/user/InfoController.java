package kr.co.jboard2.controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonObject;

import kr.co.jboard2.dao.UserDAO;
import kr.co.jboard2.vo.UserVO;

@WebServlet("/user/info.do")
public class InfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String uid = req.getParameter("uid");
			
			req.setAttribute(uid, uid);
			
			//로그인 페이지 출력
			RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/user/info.jsp");
			dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uid = req.getParameter("uid");
		String pass = req.getParameter("pass");
		
		UserVO vo = UserDAO.getInstance().selectUser(uid, pass);
		
		JsonObject json = new JsonObject();
		
		if(vo != null) {
			json.addProperty("result", 1);	
						
		}else {	
			json.addProperty("result", 0);			

		}
		
		PrintWriter writer = resp.getWriter();
		writer.print(json.toString());
		
		
	}
}