package controller.review;

import java.io.IOException;
import java.util.List;

import config.MyBatisContext;
import dto.Review;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.ReviewMapper;

@WebServlet(urlPatterns = { "/review/selectreview.do" })
public class SelectInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ReviewMapper mapper = MyBatisContext.getSqlSession().getMapper(ReviewMapper.class);
		List<Review> list = mapper.selectReviewAll();

		request.setAttribute("list", list);

		request.getRequestDispatcher("/WEB-INF/review/selectreview.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Long no = Long.parseLong(request.getParameter("no"));
		System.out.println(no);
		ReviewMapper mapper = MyBatisContext.getSqlSession().getMapper(ReviewMapper.class);
		int ret = mapper.deleteReviewOne(no);

		if (ret == 1) {
			response.sendRedirect("selectreview.do");
		} 
		else {
			response.sendRedirect("selectreview.do");
		}
	}
}
