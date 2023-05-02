package controller.classproduct;

import java.io.IOException;
import java.util.List;

import dto.Activitycate;
import dto.Citycate;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.ClassSelectService;
import service.ClassSelectServiceImpl;

@WebServlet("/class/select.do")
public class ClassSelectController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("search") == null) {
			response.sendRedirect("select.do?search=list");
			return;
		}
		
		ClassSelectService cService = new ClassSelectServiceImpl();
		
		List<Activitycate> list1 = cService.classActivitycateList();
		List<Citycate> list2 = cService.classCitycateList();
		
		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2);
		
		request.getRequestDispatcher("/WEB-INF/class/select.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(request, response);
		
	}
	
	
}
