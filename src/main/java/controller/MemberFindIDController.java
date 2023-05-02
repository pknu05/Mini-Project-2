package controller;

import java.io.IOException;

import dto.Member;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.MemberService;
import service.MemberServiceImpl;

@WebServlet(urlPatterns = { "/member/findid.do" })

public class MemberFindIDController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/member/member_findid.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Member obj = new Member();

		obj.setName(request.getParameter("name"));
		obj.setEmail(request.getParameter("email"));
		obj.setPhone(request.getParameter("phone"));

		MemberService service = new MemberServiceImpl();

		Member ret = service.findMemberId(obj);

		if (ret != null) {

			request.setAttribute("message", "아이디는" + ret.getId() + "입니다");
			request.setAttribute("url", "login.do");
			request.getRequestDispatcher("/WEB-INF/member/alert.jsp").forward(request, response);

		} else {
			request.setAttribute("message", "등록된 정보가 없습니다.");
			request.setAttribute("url", "login.do");
			request.getRequestDispatcher("/WEB-INF/member/alert.jsp").forward(request, response);

		}

	}

}
