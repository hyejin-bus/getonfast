package getonFast.hj.semi.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import getonFast.hj.semi.member.service.MemberService;
import getonFast.hj.semi.member.vo.Member;

@WebServlet("/member/login")
public class loginServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("css", "style");

		// ********************************************************************************
		String beforeUrl = req.getHeader("referer");

		if (beforeUrl != null && !beforeUrl.equals(req.getRequestURL().toString())) {
			req.getSession().setAttribute("beforeUrl", beforeUrl);
		}
		// ********************************************************************************

		String path = "/WEB-INF/views/member/login.jsp";
		req.getRequestDispatcher(path).forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String memberEmail = req.getParameter("email");
		String memberPw = req.getParameter("pwd1");
		

		try {

			MemberService service = new MemberService();

			Member loginMember = service.login(memberEmail, memberPw);
			
			HttpSession session = req.getSession();
			
			
			
			if (loginMember != null) {
				
				if (loginMember.getStatusCode() == 11) {

					session.setAttribute("loginMember", loginMember);

					session.setMaxInactiveInterval(60 * 60 * 24);

					Cookie cookie = new Cookie("saveId", memberEmail);

					if (req.getParameter("save") != null) {

						cookie.setMaxAge(60 * 60 * 24 * 30);

					} else {

						cookie.setMaxAge(0);

					}

					cookie.setPath(req.getContextPath());

					resp.addCookie(cookie);
					

					
					if(loginMember.getGradeCode() > 0) {
						
						resp.sendRedirect(req.getContextPath() + "/adminSpace/insert");
						System.out.println("admin hi");
						
					}else {
						
						resp.sendRedirect((String)req.getSession().getAttribute("beforeUrl"));
						
					}

				} else if (loginMember.getStatusCode() == 12) {
				
					System.out.println("12");

					session.setAttribute("message", "????????? ???????????????.");
					resp.sendRedirect(req.getContextPath());
				}

			} else { // ????????? ????????? ??????

//        	 out.println("<script language='javascript'>");
//        	 out.println("alert('?????????')");
//        	 out.println("location.href = 'login'");
//        	 out.println("</script>");
//        	 
				session.setAttribute("message", "????????? ?????? ??????????????? ????????? ?????????.");
				resp.sendRedirect("login");
			
			}

			
			
		} catch (Exception e) {
			e.printStackTrace();

			String errorMessage = "????????? ??? ????????? ??????????????????.";

			req.setAttribute("errorMessage", errorMessage);
			req.setAttribute("e", e);

			String path = "/WEB-INF/views/common/error.jsp";

			RequestDispatcher dispatcher = req.getRequestDispatcher(path);

			dispatcher.forward(req, resp);

		}

	}

}
