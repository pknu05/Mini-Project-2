package controller;

import java.io.IOException;

import config.Hash;
import dto.Member;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.MemberService;
import service.MemberServiceImpl;

@WebServlet(urlPatterns = {"/member/login.do"})

public class MemberLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.getRequestDispatcher("/WEB-INF/member/member_login.jsp").forward(request, response);
		 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String hashPw = Hash.hashPw(request.getParameter("id"),request.getParameter("pw"));
		
		 Member obj = new Member();
		 obj.setId(request.getParameter("id"));
		 obj.setPassword(hashPw);
		 
		 MemberService mService = new MemberServiceImpl();
		 
		 Member ret = mService.selectMemberLogin(obj);
		 //System.out.println(ret.toString());
		 
		 if(ret != null) {
			 HttpSession httpSession = request.getSession();
			 httpSession.setAttribute("id", ret.getId());
			 httpSession.setAttribute("name", ret.getName());
			
			 String url = (String)httpSession.getAttribute("url");
			 if(url == null) {
				
				 request.setAttribute("message","로그인에 성공하였습니다.");
				 request.setAttribute("url", request.getContextPath() + "/home.do");
				 request.getRequestDispatcher("/WEB-INF/member/alert.jsp").forward(request, response);
			 }
			 else {
				 response.sendRedirect(url);
			 }
			 return;
		 }
		
		request.setAttribute("message", "아이디 또는 비밀번호가 틀렸습니다. 다시 확인해주세요.");
		request.setAttribute("url", request.getContextPath() + "/member/login.do" );
		request.getRequestDispatcher("/WEB-INF/member/alert.jsp").forward(request, response);
		 
	}

}
