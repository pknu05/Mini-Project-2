package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.MemberService;
import service.MemberServiceImpl;

import java.io.IOException;

import config.Hash;
import dto.Member;

@WebServlet(urlPatterns = {"/member/join.do"})
public class MemberJoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private MemberService mService = new MemberServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/WEB-INF/member/member_join.jsp").forward(request, response);
	}

	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hashPw = Hash.hashPw(request.getParameter("id"),request.getParameter("password"));
		Member obj = new Member();
		obj.setId(request.getParameter("id"));
		obj.setPassword(hashPw);
		obj.setName(request.getParameter("name"));
		obj.setEmail(request.getParameter("email"));
		obj.setPhone(request.getParameter("phone"));
		obj.setGender(request.getParameter("gender"));
		obj.setBirth(request.getParameter("birth"));
		
		
		
	
		int ret =mService.insertMemberOne(obj);
		if(ret == 1) {
			
			request.setAttribute("message", "회원가입이 완료되었습니다.");
			request.setAttribute("url", "login.do" );
			request.getRequestDispatcher("/WEB-INF/member/alert.jsp").forward(request, response);
//			response.sendRedirect("login.do");
			return ;
				
		}
		request.setAttribute("message", "회원가입에 실패하였습니다.");
		request.setAttribute("url", "join.do" );
		request.getRequestDispatcher("/WEB-INF/member/alert.jsp").forward(request, response);
//		response.sendRedirect(request.getContextPath()+"/member/join.do");
		
	
	}
	

}
