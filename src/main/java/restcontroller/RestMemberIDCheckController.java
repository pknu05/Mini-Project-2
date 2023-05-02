package restcontroller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.MemberMapper;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;

import config.MyBatisContext;

@WebServlet(urlPatterns = {"/api/member/idcheck.json"})
public class RestMemberIDCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private Gson gson = new Gson();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id =request.getParameter("id");
		int ret = MyBatisContext.getSqlSession().getMapper(MemberMapper.class).selectMemberIDCheck(id);
		
		response.setContentType("application/json");
		Map<String, Object> map = new HashMap<>();
		map.put("ret", ret);
		String jsonString = gson.toJson(map);
		
		PrintWriter out = response.getWriter();
		out.print(jsonString);
		out.flush();
		
	}

	

}
