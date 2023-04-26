package restcontroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;

import config.MyBatisContext;
import dto.Session;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.ReviewMapper;

@WebServlet(urlPatterns = { "/api/class/product.json" })
public class RestClassProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Gson gson = new Gson(); // 라이브러리를 이용한 객체 생성

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Long no = Long.parseLong(request.getParameter("no"));

		// mapper를 이용한 결과 조회
		ReviewMapper mapper = MyBatisContext.getSqlSession().getMapper(ReviewMapper.class);
		Session session = mapper.SelectSession(no);
		
		System.out.println(session.toString());

		response.setContentType("application/json");

		Map<String, Object> map = new HashMap<>();
		map.put("session", session);
		String jsonString = gson.toJson(map);

		PrintWriter out = response.getWriter();
		out.print(jsonString);
		out.flush();
	}
}
