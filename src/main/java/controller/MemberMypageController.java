package controller;

import java.io.IOException;
import java.util.List;

import config.Hash;
import dto.ApplyStatusView;
import dto.Classproduct;
import dto.Member;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.ApplyStatusViewService;
import service.ApplyStatusViewServiceImpl;
import service.ClassInsertService;
import service.ClassInsertServiceImpl;
import service.MemberService;
import service.MemberServiceImpl;

@WebServlet(urlPatterns = {"/member/mypage.do"})
public class MemberMypageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String menu = request.getParameter("menu");
		
		MemberService mService = new MemberServiceImpl();
		ClassInsertService cService = new ClassInsertServiceImpl();
		ApplyStatusViewService aService = new ApplyStatusViewServiceImpl();
		
		String id =(String)request.getSession().getAttribute("id");
		
		if(menu == null) {
			response.sendRedirect("mypage.do?menu=1"); //=>menu=1로 추후에 변경
			return;
		}
		
		// 1. 회원 정보 변경
		
		if(Integer.parseInt(menu) == 1) {
		
			Member obj = mService.selectMemberOne(id);
			
			request.setAttribute("obj",obj);
			
		}
		
		// 2. 내 클래스 등록관리
		
		else if(Integer.parseInt(menu) == 2) {
			
			List<Classproduct> list = cService.selectMyClassList(id);
			
			System.out.println(list.toString());
			
			request.setAttribute("list", list);
			
		}
		
		// 3. 클래스 신청 내역
		
		else if(Integer.parseInt(menu)==3) {
			
			try {
				List<ApplyStatusView> list = aService.selectApplyStatusViewListById(id);
				System.out.println(list.toString());
				request.setAttribute("applylist", list);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		// 5. 리뷰 내역 관리
		
		else if(Integer.parseInt(menu)==5) {
			
		}
		request.getRequestDispatcher("/WEB-INF/member/member_mypage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//회원정보수정
		int menu = Integer.parseInt(request.getParameter("menu"));
		
		if(menu == 1) {
			String id = (String) request.getSession().getAttribute("id");
			Member obj = new Member();
			obj.setId(id);
			obj.setName(request.getParameter("name"));
			obj.setEmail(request.getParameter("email"));
			obj.setPhone(request.getParameter("phone"));
			
			MemberService mService = new MemberServiceImpl();
			
			int ret = mService.updateMemberOne(obj);
		
			if(ret == 1 ) {

				request.setAttribute("message", "회원정보가 변경되었습니다.");
				request.setAttribute("url", "./mypage.do?menu=" + menu );
				
			}else {
				request.setAttribute("message","회원정보변경에 실패하였습니다");
				request.setAttribute("url", "./mypage.do?menu=" + menu );
			}
			request.getRequestDispatcher("/WEB-INF/member/alert.jsp").forward(request, response);
			
		}
		else if (menu == 2) {
			
		}
		
		else if (menu == 3) {
			
			
		}
		
		// 비밀번호 재설정
		
		else if (menu == 4) {
			
			String hashPw =Hash.hashPw((String)request.getSession().getAttribute("id"), request.getParameter("password"));
			String hashNPw =Hash.hashPw((String) request.getSession().getAttribute("id"),request.getParameter("newpassword"));
			String hashNPw1 =Hash.hashPw((String) request.getSession().getAttribute("id"),request.getParameter("newpassword1"));
			
			Member obj = new Member();
			
			obj.setId((String) request.getSession().getAttribute("id"));
			obj.setPassword(hashPw);
			obj.setNewpassword(hashNPw);
			obj.setNewpassword(hashNPw1);
			
			MemberService mService = new MemberServiceImpl();
			
			int ret = mService.updateMemberPassword(obj);
			
			System.out.println(ret);			
			
			if(ret == 1 ) {
				
				response.sendRedirect("mypage.do?menu=" + menu);
			
			}
			else {
				
			}
			
		}
		else if (menu ==5 ) {
			
			
		}
		
		//회원탈퇴
		
		else if (menu == 6) {
			
			HttpSession httpsession = request.getSession();
			String id =(String)httpsession.getAttribute("id");
			String pw =request.getParameter("password");
			String pwHash =Hash.hashPw(id, pw);
			
			Member obj = new Member();
			obj.setId(id);
			obj.setPassword(pwHash);

			MemberService mService = new MemberServiceImpl();
			
			int ret = mService.deleteMemberOne(obj);
		
			if ( ret == 1 ) {
				
				httpsession.invalidate();
				request.setAttribute("message","회원탈퇴가 완료되었습니다 이용해주셔서 감사합니다🙇‍♀️");
				request.setAttribute("url", request.getContextPath() + "/home.do" );
	
			}
			
			else {
				
				request.setAttribute("message","회원탈퇴가 완료되었습니다 이용해주셔서 감사합니다🙇‍♀️");
				request.setAttribute("url", "mypage.do?menu=" + menu);
				
			}
			
			request.getRequestDispatcher("/WEB-INF/member/alert.jsp").forward(request, response);
			
			
		}
		
	}

}