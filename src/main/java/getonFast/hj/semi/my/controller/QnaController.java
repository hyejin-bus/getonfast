package getonFast.hj.semi.my.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/my/qna")
public class QnaController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("css", "qna");
		
		String path = "/WEB-INF/views/qna/qna.jsp";
		req.getRequestDispatcher(path).forward(req, resp);
	}
}