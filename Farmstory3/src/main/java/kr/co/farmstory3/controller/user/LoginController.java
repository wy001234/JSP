package kr.co.farmstory3.controller.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.farmstory3.dao.UserDAO;
import kr.co.farmstory3.vo.UserVO;



@WebServlet("/user/login.do")
public class LoginController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	public void init() throws ServletException {
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/user/login.jsp");
		dispatcher.forward(req, resp);		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		// 데이터 수신
				String uid  = req.getParameter("uid");
				String pass = req.getParameter("pass");
				
				//String auto = req.getParameter("auto");
				
				// 데이터베이스 처리
				UserDAO dao = UserDAO.getInstance();
				UserVO vo = dao.selectUser(uid, pass);
			
				// 로그인 처리
				if(vo != null) {
					// 회원 맞음
					HttpSession session = req.getSession(); // 현재 클라이언트 세션 구함
					session.setAttribute("sessUser", vo);
					
					resp.sendRedirect("/Farmstory3/board/list.do");
					
				}else {
					// 회원 아님
					resp.sendRedirect("/Farmstory3/user/login.do?success=100");			
				}	
	
	}
}
