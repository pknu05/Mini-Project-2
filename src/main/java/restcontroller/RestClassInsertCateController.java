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
import mapper.ClassMapper;

@WebServlet(urlPatterns = {"/api/class/selectcatelist1.json"})
public class RestClassInsertCateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Gson gson = new Gson();
       
    public RestClassInsertCateController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("chk").equals("local")) {
			long citycode = Long.parseLong(request.getParameter("refcode"));
			
			List<Localcate> list = MyBatisContext.getSqlSession().getMapper(ClassMapper.class).selectLocalcateList(citycode);
			
			Map<String, Object>map = new HashMap<>();
			map.put("list", list);
			
			response.setContentType("appilcation/json");
			
			String jsonString = gson.toJson(map);
			
			PrintWriter out = response.getWriter();
			out.print(jsonString);
			out.flush();
		}
		
		else if(request.getParameter("chk").equals("act")) {
			long actcode= Long.parseLong(request.getParameter("refcode"));
		
			List<Actdetailcate> list1 = MyBatisContext.getSqlSession().getMapper(ClassMapper.class).selectActdetailcateList(actcode);
			
			Map<String, Object>map = new HashMap<>();
			map.put("list1", list1);
			
			response.setContentType("appilcation/json");
			
			String jsonString = gson.toJson(map);
			
			PrintWriter out = response.getWriter();
			out.print(jsonString);
			out.flush();
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
