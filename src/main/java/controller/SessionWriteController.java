package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.SessionService;
import service.SessionServiceImpl;

import java.io.IOException;

import dto.Session;

@WebServlet(urlPatterns = {"/session/write.do"})
public class SessionWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SessionService sService = new SessionServiceImpl();
      
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 클래스 가격 받아오기
		long classcode = Long.parseLong(request.getParameter("classcode"));
		//long classcode = 107;
		
		try {
			long price = sService.selectPriceOne(classcode);
			if(price >= 0) {
				request.setAttribute("price", price);
			}
			
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		request.getRequestDispatcher("/WEB-INF/session/session_write.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long classcode = Long.parseLong(request.getParameter("classcode"));
		//long classcode = 107;
		
		Session obj = new Session();
		obj.setClasscode(classcode); // 테스트
		obj.setMinimum(Long.parseLong(request.getParameter("min")));
		obj.setMaximum(Long.parseLong(request.getParameter("max")));
		obj.setClassdate(request.getParameter("date"));
		obj.setClassday(request.getParameter("day"));
		obj.setClassstart(request.getParameter("start"));
		obj.setClassend(request.getParameter("end"));
		
		obj.setClasslevel(request.getParameter("level"));
		obj.setAddprice(Long.parseLong(request.getParameter("addprice")));
		

		
		System.out.println(request.getParameter("rate"));
		System.out.println(Long.parseLong(request.getParameter("rate")));
		System.out.println(Float.parseFloat(request.getParameter("rate")));
		
		if(Long.parseLong(request.getParameter("rate")) == 0) {
			obj.setDiscount( Long.parseLong(request.getParameter("rate")));
		}
		else {
			float num = Float.parseFloat(request.getParameter("rate"))*0.01f;
			obj.setDiscount(Math.round(num*100)/100.0f); // 소수점 둘째자리까지
		}
		
		
		System.out.println(obj.toString());
		
		
		try {
			int ret = sService.insertSessionOne(obj);
			System.out.println(ret);
			if(ret == 1) {
				response.sendRedirect("select.do?menu=1&classcode="+classcode);
			}
			else {
				response.sendRedirect("write.do?classcode="+classcode);
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("select.do?menu=1&classcode="+classcode);
		}
		
		
	}

}
