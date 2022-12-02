package kr.co.farmstory3.controller.board;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.farmstory3.dao.ArticleDAO;
import kr.co.farmstory3.vo.ArticleVO;


@WebServlet("/board/write.do")
public class WriteController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	public void init() throws ServletException {
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String group = req.getParameter("group");
		String cate = req.getParameter("cate");
		
		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/board/write.jsp");
		dispatcher.forward(req, resp);		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	//multipart 전송데이터 수신
		
		ServletContext ctx = req.getServletContext();
		String path = ctx.getRealPath("/file");
		int maxSize = 1024 * 1024 * 10; // 최대 파일 업로드 허용량 10MB
		MultipartRequest mr = new MultipartRequest(req, path, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		//전송데이터 수신
		String cate    = mr.getFilesystemName("cate");
		String title   = mr.getParameter("title");
		String content = mr.getParameter("content");
		String uid     = mr.getParameter("uid");
		String fname   = mr.getFilesystemName("fname");
		String regip   = req.getRemoteAddr();

		ArticleVO article = new ArticleVO();
		article.setRegip(cate);
		article.setTitle(title);
		article.setContent(content);
		article.setUid(uid);
		article.setFname(fname);
		article.setRegip(regip);;

		ArticleDAO dao = ArticleDAO.getInstance();
		int parent = dao.insertArticle(article);

		// 파일을 첨부했으면 파일처리
		if(fname != null){
			// 파일명 수정
			int idx = fname.lastIndexOf(".");
			String ext = fname.substring(idx);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss_");
			String now = sdf.format(new Date());
			String newName = now+uid+ext; // 20221026111323_chhak0503.txt 
			
			File oriFile = new File(path+"/"+fname);
			File newFile = new File(path+"/"+newName);
			
			oriFile.renameTo(newFile);
			
			// 파일 테이블 저장
			dao.insertFile(parent, newName, fname);
		}

		//리다이렉트
		resp.sendRedirect("/Farmstory3/board/list.do");	
	
	}
}