package controller.book;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDAO;
import vo.BookVO;

@WebServlet("/book/list.do")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<BookVO> books = BookDAO.getInstance().selectBooks();
		
		// View에서 데이터 출력을 위한 request Scope 데이터 설정 
		req.setAttribute("books", books);
				
				// forward
		RequestDispatcher dispatcher = req.getRequestDispatcher("/book/list.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
