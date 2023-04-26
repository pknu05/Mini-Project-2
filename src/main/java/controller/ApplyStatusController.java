package controller;

import java.io.IOException;
import java.util.List;

import config.MyBatisContext;
import dto.ApplyStatus;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.ApplyStatusMapper;
import service.ApplyStatusService;
import service.ApplyStatusServiceImpl;

@WebServlet(urlPatterns = {"/applytatus.do"})
public class ApplyStatusController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ApplyStatusService applyStatusService = new ApplyStatusServiceImpl(); //객체를 만들고

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
			List<ApplyStatus> list =MyBatisContext.getSqlSession().getMapper(ApplyStatusMapper.class)
				.selectApplyList();
			
			request.setAttribute("list", list);
			System.out.println(list.toString());

		request.getRequestDispatcher("/WEB-INF/apply/applytatus.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
