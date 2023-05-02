package restcontroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;

import config.MyBatisContext;
import dto.ClassSessionView;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.ClassSelectMapper;

@WebServlet(urlPatterns = { "/api/class/selectclasslist.json" })
public class RestClassListSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Gson gson = new Gson(); // 라이브러리를 이용한 객체 생성

	public RestClassListSelectController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		ClassSelectMapper cMapper = MyBatisContext.getSqlSession().getMapper(ClassSelectMapper.class);

		if (request.getParameter("classdate") == null) {
			Map<String, Object> map = new HashMap<>();
			
			//System.out.println(request.getParameter("keyword"));

			map.put("citycode", request.getParameter("citycode"));
			map.put("localcode", request.getParameter("localcode"));
			map.put("activitycode", request.getParameter("activitycode"));
			map.put("actcode", request.getParameter("actcode"));
			map.put("classlevel", request.getParameter("classlevel"));
			map.put("minprice", request.getParameter("minprice"));
			map.put("maxprice", request.getParameter("maxprice"));
			map.put("keyword", request.getParameter("keyword"));

			List<ClassSessionView> list = cMapper.selectClassSessionViewList2(map);
			
			// 전송 데이터를 저장할 Map 객체 생성

			Map<String, Object> map1 = new HashMap<>();
			map1.put("list", list);

			// 전송하는 데이터 타입 설정 (json 타입 문서) => default는 text/html 타입을 인식
			response.setContentType("application/json");

			// list 객체를 json으로 변환
			String jsonString = gson.toJson(map1);

			// 호출된 곳으로 값 전송
			PrintWriter out = response.getWriter();
			out.print(jsonString);
			out.flush();
		}

		else {
			Map<String, Object> map = new HashMap<>();

			map.put("citycode", request.getParameter("citycode"));
			map.put("localcode", request.getParameter("localcode"));
			map.put("activitycode", request.getParameter("activitycode"));
			map.put("actcode", request.getParameter("actcode"));
			map.put("classdate", request.getParameter("classdate"));
			map.put("classlevel", request.getParameter("classlevel"));
			map.put("minprice", request.getParameter("minprice"));
			map.put("maxprice", request.getParameter("maxprice"));
			map.put("keyword", request.getParameter("keyword"));

			List<ClassSessionView> list = cMapper.selectClassSessionViewList1(map);
			// System.out.println(list.toString());

			// 전송 데이터를 저장할 Map 객체 생성

			Map<String, Object> map1 = new HashMap<>();
			map1.put("list", list);

			// 전송하는 데이터 타입 설정 (json 타입 문서) => default는 text/html 타입을 인식
			response.setContentType("application/json");

			// list 객체를 json으로 변환
			String jsonString = gson.toJson(map1);

			// 호출된 곳으로 값 전송
			PrintWriter out = response.getWriter();
			out.print(jsonString);
			out.flush();
		}

	}

}
