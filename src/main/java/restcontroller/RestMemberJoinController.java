package restcontroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import java.util.Map;

import com.google.gson.Gson;

import config.Hash;
import config.MyBatisContext;

import dto.Member;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import mapper.MemberMapper;

@WebServlet(urlPatterns = {"/api/member/join.json"})
public class RestMemberJoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private Gson gson = new Gson() ; //라이브러리를 이용한 객체 생성
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hashPw=Hash.hashPw(request.getParameter("id"),request.getParameter("pw"));
		
		Member obj = new Member();
		obj.setId(request.getParameter("id"));
		obj.setPassword(hashPw);
		obj.setName(request.getParameter("name"));
		obj.setEmail(request.getParameter("email"));
		obj.setPhone(request.getParameter("phone"));
		obj.setGender(request.getParameter("gender"));
		obj.setBirth(request.getParameter("birth"));
		System.out.println(obj.toString());

		int ret =MyBatisContext.getSqlSession().getMapper(MemberMapper.class).insertMemberOne(obj);
		
		response.setContentType("application/json");
		Map<String, Object> map  =new HashMap<>();
		map.put("result", 0);
		if(ret == 1) {		
			map.put("ret", 1);
		}
		String jsonString = gson.toJson(map);
		PrintWriter out = response.getWriter();
		out.print(jsonString);
		out.flush();
	}
	
}

