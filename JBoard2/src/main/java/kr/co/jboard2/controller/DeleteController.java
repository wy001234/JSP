package kr.co.jboard2.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jboard2.dao.ArticleDAO;

@WebServlet("/delete.do")
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String pg = req.getParameter("pg");
		String parent = req.getParameter("parent");
		String no = req.getParameter("no");
		
		ArticleDAO dao = ArticleDAO.getInstance();
		
		//글삭제 + 댓글 삭제
		dao.deleteArticle(no, parent);
		
		//파일 삭제(테이블)
		String fileName = dao.deleteFile(no);

		resp.sendRedirect("/JBoard1/list.jsp?pg="+pg);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	
	}

	
}
