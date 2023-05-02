package controller;

import java.io.IOException;

import dto.Apply;
import dto.ClassSessionView;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.ApplyService;
import service.ApplyServiceImpl;

@WebServlet(urlPatterns = { "/apply/insert.do" })
public class ApplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println(request.getParameter("sessionno"));

		ApplyService aService = new ApplyServiceImpl();
		ClassSessionView obj = aService.selectClassSessionViewOne(Long.parseLong(request.getParameter("sessionno")));
		System.out.println(obj.toString());
		
		request.setAttribute("sessionno", request.getParameter("sessionno"));
		
		request.setAttribute("cnt", obj.getCnt());
		request.setAttribute("maximum", obj.getMaximum());
		request.setAttribute("totalprice", obj.getTotalprice());
	
		request.getRequestDispatcher("/WEB-INF/apply/insert.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int per= Integer.parseInt(request.getParameter("person"));//유효성 검사때문에 넣은것 값 확인 할때 지워햐함
		long sessionno = Long.parseLong(request.getParameter("sessionno"));
		
		HttpSession httpsession = request.getSession();
		String id = (String)httpsession.getAttribute("id");
		
		Apply obj = new Apply();
		obj.setPerson(per);
		obj.setMemberid(id);
		obj.setSessionno(sessionno);
		
		System.out.println(obj.toString());

//		Apply obj = new Apply();
//		obj.setPerson(Long.parseLong(request.getParameter("person")));
//		obj.setMemberid(request.getParameter("test2"));
//		obj.setSessionno(Long.parseLong(request.getParameter("13")));
//		System.out.println(obj.toString());

		ApplyService service = new ApplyServiceImpl();
		int ret= service.insertApply(obj);
		System.out.println(ret);
					
//			HttpSession httpSession = request.getSession();
		
//			
//			String person = request.getParameter("person");
//			String memberid = (String) request.getSession().getAttribute("memberid");
//			String sessionno = request.getParameter("sessionno");
			
//			String url = (String) httpSession.getAttribute("url");
//			System.out.println("apply.do => " + url);
			
		if(ret == 1) {
			response.sendRedirect(request.getContextPath() + "/member/mypage.do?menu=3");
			// 절대경로 ->  src="<${pageContext.request.contextPath}member/mypage.do>"
		}
		else {
//			response.sendRedirect(url);
			response.sendRedirect(request.getContextPath() + "/apply/insert.do?sessionno="+sessionno);
		}		

	}
}
				
		
		
	