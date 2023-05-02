package restcontroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;

import config.MyBatisContext;
import dto.Actdetailcate;
import dto.Localcate;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.ClassSelectMapper;




@WebServlet(urlPatterns = {"/api/class/selectcatelist.json"})
public class RestClassSelectCateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Gson gson = new Gson(); // 라이브러리를 이용한 객체 생성
       
    public RestClassSelectCateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ClassSelectMapper cMapper = MyBatisContext.getSqlSession().getMapper(ClassSelectMapper.class);
		
		if(request.getParameter("chk").equals("classcate")) {
			
			long actcode = Long.parseLong(request.getParameter("refcode"));
			
			List<Actdetailcate> list = cMapper.selectActdetailcateList(actcode);
			
			// 전송 데이터를 저장할 Map 객체 생성
			
			Map<String, Object> map = new HashMap<>();
			map.put("list", list);
			
			// 전송하는 데이터 타입 설정 (json 타입 문서) => default는 text/html 타입을 인식
			response.setContentType("application/json");
			
			// list 객체를 json으로 변환
			String jsonString = gson.toJson(map);
			
			// 호출된 곳으로 값 전송
			PrintWriter out = response.getWriter();
			out.print(jsonString);
			out.flush();
			
		}
		
		else if(request.getParameter("chk").equals("citycate")) {
			
			long citycode = Long.parseLong(request.getParameter("refcode"));
			
			List<Localcate> list = cMapper.selectLocalcateList(citycode);
			
			// 전송 데이터를 저장할 Map 객체 생성
			
			Map<String, Object> map = new HashMap<>();
			map.put("list", list);
			
			// 전송하는 데이터 타입 설정 (json 타입 문서) => default는 text/html 타입을 인식
			response.setContentType("application/json");
			
			// list 객체를 json으로 변환
			String jsonString = gson.toJson(map);
			
			// 호출된 곳으로 값 전송
			PrintWriter out = response.getWriter();
			out.print(jsonString);
			out.flush();
			
			// 두 개가 전송은 되는데, 데이터를 꺼낼 때 인덱스로 꺼내나? 일단 꺼내기 쉬운 건 Map 타입이다. key를 이용해서 쉽게 꺼낼 수 있음.
		}
	
	}

}
