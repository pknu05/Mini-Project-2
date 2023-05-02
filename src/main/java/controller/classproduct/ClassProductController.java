package controller.classproduct;

import java.io.IOException;
import java.util.List;

import dto.ClassSessionView;
import dto.Classproduct;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.ClassProductService;
import service.ClassProductServiceImpl;

@WebServlet(urlPatterns = { "/class/product.do" })
public class ClassProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//long classcode = 118;
		long classcode = Long.parseLong(request.getParameter("classcode"));
		System.out.println(classcode);
			
		ClassProductService service = new ClassProductServiceImpl();
		
		List<ClassSessionView> list1 = service.selectClassSessionView(classcode);
		
		//List<Review> list = mapper.selectReviewAll();
		
		Classproduct product = service.selectClassproductOne(classcode);
		
		//Double.parseDouble(product.getLatitude());
		//Double.parseDouble(product.getLongitude());	
		
		request.setAttribute("product", product);
		request.setAttribute("list1", list1);
		//request.setAttribute("list", list);		
		request.getRequestDispatcher("/WEB-INF/class/product.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
	}
}
