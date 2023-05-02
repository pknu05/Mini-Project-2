package controller;

import java.io.IOException;

import dto.Session;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.SessionService;
import service.SessionServiceImpl;

@WebServlet(urlPatterns = {"/session/update.do"})
public class SessionUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SessionService sService = new SessionServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long classcode = Long.parseLong(request.getParameter("classcode"));
		//long classcode = 107;
		long no = Long.parseLong(request.getParameter("no"));
		
		Session obj = new Session();
		obj.setClasscode(classcode);
		obj.setNo(no);
		
		try {
			Session info = sService.selectSessionOne(obj);
			long price = sService.selectPriceOne(classcode);   

			request.setAttribute("info", info);
			request.setAttribute("price", price);
			
		} catch (Exception e) {
			e.printStackTrace();
			return;
		}
		request.getRequestDispatcher("/WEB-INF/session/session_update.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long classcode = Long.parseLong(request.getParameter("classcode"));
		//long classcode = 107;
		long no = Long.parseLong(request.getParameter("no"));
		
		Session obj = new Session();
		obj.setNo(no);
		obj.setClasscode(classcode);
		
		obj.setMinimum(Long.parseLong(request.getParameter("min")));
		obj.setMaximum(Long.parseLong(request.getParameter("max")));
		obj.setClassdate(request.getParameter("date"));
		obj.setClassday(request.getParameter("day"));
		obj.setClassstart(request.getParameter("start"));
		obj.setClassend(request.getParameter("end"));
		float num = Float.parseFloat(request.getParameter("rate"))*0.01f;
		obj.setDiscount(1f - Math.round(num*100)/100.0f); // 소수점 둘째자리까지
		obj.setAddprice(Long.parseLong(request.getParameter("addprice")));
		obj.setClasslevel(request.getParameter("level"));
		//System.out.println(obj.toString());
		
		
		try {
			int ret = sService.updateSessionOne(obj);
			System.out.println(ret);
			if(ret == 1) {
				response.sendRedirect("select.do?menu=1&classcode="+classcode);
			}
			else {
				response.sendRedirect("update.do?no="+no+"&classcode="+classcode);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return;
		}
				
	}

}
