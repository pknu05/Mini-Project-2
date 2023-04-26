package controller;

import java.io.IOException;
import java.util.List;

import dto.ApplyStatusView;
import dto.Session;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.ApplyStatusViewService;
import service.ApplyStatusViewServiceImpl;
import service.SessionService;
import service.SessionServiceImpl;

@WebServlet(urlPatterns = {"/session/select.do"})
public class SessionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SessionService sService = new SessionServiceImpl();
	private ApplyStatusViewService aService = new ApplyStatusViewServiceImpl();
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String menu = request.getParameter("menu");
		// 초기화면 menu=1(세션등록화면) => 세션조회화면으로 변경예정
		if(menu == null) {
			response.sendRedirect("select.do?menu=1");
			return;
		}
		
		if(Integer.parseInt(menu) == 1) {
			//long classcode = Long.parseLong(request.getParameter("classcode"));
			long classcode = 107;
			try {
				List<Session> list = sService.selectSessionList(classcode);
				request.setAttribute("list", list);		
			} 
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(Integer.parseInt(menu) == 2) {
			//long classcode = Long.parseLong(request.getParameter("classcode"));
			long classcode = 111;
			try {
				List<ApplyStatusView> applylist = aService.selectApplyStatusViewList(classcode);
				request.setAttribute("applylist", applylist);
			} 
			catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}
		
		request.getRequestDispatcher("/WEB-INF/session/session_workspace.jsp").forward(request, response);
	}

}
