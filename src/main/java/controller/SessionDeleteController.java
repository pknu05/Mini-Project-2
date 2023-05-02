package controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.SessionService;
import service.SessionServiceImpl;

@WebServlet(urlPatterns = {"/session/delete.do"})
public class SessionDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SessionService sService = new SessionServiceImpl();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] chk = request.getParameterValues("chk[]");	
		//long classcode = Long.parseLong(request.getParameter("classcode"));
		long classcode = 107;
		
		Map<String, Object> map = new HashMap<>();
		map.put("chk", chk);
		map.put("classcode", classcode);
		
		try {
			sService.deleteSessionList(map);
			response.sendRedirect("select.do?menu=1&classcode="+classcode);
		} catch (Exception e) {
			e.printStackTrace();
			return;
		}
		
		
	}

}
