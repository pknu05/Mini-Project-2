package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mapper.MemberMapper;

import java.io.IOException;

import config.MyBatisContext;
import dto.Member;

@WebServlet(urlPatterns = { "/member/resetpw.do" })

public class MemberResetPWController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/member/member_findid.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Member obj = new Member();
		
		obj.setId(request.getParameter("id"));
		obj.setEmail(request.getParameter("email"));
		obj.setPhone(request.getParameter("phone"));
		obj.setBirth(request.getParameter("Birth"));
		
	
		
	Member ret =MyBatisContext.getSqlSession().getMapper(MemberMapper.class).findMemberId(obj);
		
		if(ret != null) {
				
			request.setAttribute("message","아이디는" + ret.getId() + "입니다");
			request.setAttribute("url", "login.do" );
			request.getRequestDispatcher("/WEB-INF/member/alert.jsp").forward(request, response);
						
			}
			else {
				request.setAttribute("message","등록된 정보가 없습니다.");
				request.setAttribute("url", "login.do" );
				request.getRequestDispatcher("/WEB-INF/member/alert.jsp").forward(request, response);
			
			}
			
			
		}
			 
 }


