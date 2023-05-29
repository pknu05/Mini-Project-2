package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mapper.MemberMapper;
import service.MemberService;

import java.io.IOException;

import javax.xml.crypto.dsig.TransformService;

import config.Hash;
import config.MyBatisContext;
import dto.Member;

@WebServlet(urlPatterns = { "/member/resetpw1.do" })

public class MemberResetUpdatePWController extends HttpServlet {
	private static final long serialVersionUID = 1L;

		private MemberService mService =new service.MemberServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher("/WEB-INF/member/member_resetpassword.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id =(String)request.getSession().getAttribute("id");
		String hashNPw =Hash.hashPw((String) request.getSession().getAttribute("id"),request.getParameter("newpassword"));
		String hashNPw1 =Hash.hashPw((String) request.getSession().getAttribute("id"),request.getParameter("newpassword1"));
		
		
		Member obj = new Member();
		
		obj.setId(id);
		obj.setNewpassword(hashNPw);
		obj.setNewpassword(hashNPw1);
		
		int ret =MyBatisContext.getSqlSession().getMapper(MemberMapper.class).updateMemberPassword(obj);
		
		if(ret != 0 ) {
			HttpSession httpsession = request.getSession();
			httpsession.setAttribute(hashNPw1, obj);
		}
		
		
		
		
		System.out.println(ret);
		if (ret ==1 ) {
			request.setAttribute("message","비밀번호 변경이 완료되었습니다");
			request.setAttribute("url", "login.do" );
			request.getRequestDispatcher("/WEB-INF/member/alert.jsp").forward(request, response);
			
		}
			request.setAttribute("message","비밀번호 변경이 실패하였습니다.");
			request.setAttribute("url", "resetpw1.do" );
			request.getRequestDispatcher("/WEB-INF/member/alert.jsp").forward(request, response);
			
		}
		 
			
	}
