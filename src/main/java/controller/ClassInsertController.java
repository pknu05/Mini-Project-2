package controller;

import java.io.IOException;
import java.util.List;

import config.MyBatisContext;
import dto.Activitycate;
import dto.Citycate;
import dto.Classimage;
import dto.Classproduct;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.ClassMapper;
import service.ClassInsertService;
import service.ClassInsertServiceImpl;

@MultipartConfig
@WebServlet(urlPatterns = { "/class/insert.do" })
public class ClassInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ClassInsertService cService = new ClassInsertServiceImpl();
		
		List<Citycate> list = cService.selectCitycateList(); 
		List<Activitycate> list1 = cService.selectActivitycateList();
  
		request.setAttribute("list" , list); request.setAttribute("list1", list1); 
		
		request.getRequestDispatcher("/WEB-INF/class/insert.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Classproduct obj = new Classproduct();
		
		String id =(String)request.getSession().getAttribute("id");
		
		obj.setTitle(request.getParameter("title"));
		obj.setPostcode(request.getParameter("postcode"));
		obj.setAddress1(request.getParameter("address1"));
		obj.setAddress2(request.getParameter("address2"));
		obj.setAddress3(request.getParameter("address3"));
		obj.setNickname(request.getParameter("nickname"));
		obj.setIntro(request.getParameter("intro"));
		obj.setInstructor(request.getParameter("instructor"));
		obj.setCurriculum(request.getParameter("curriculum"));
		obj.setLocalcode(Long.parseLong(request.getParameter("localcode")));
		obj.setActcode(Long.parseLong(request.getParameter("actcode")));
		obj.setPrice(Long.parseLong(request.getParameter("price")));
		obj.setMemberid(id);
		obj.setLatitude("35.15883991156001");
		obj.setLongitude("129.15806348324026");
		
		// System.out.println(obj.toString());
		
		ClassInsertService cService = new ClassInsertServiceImpl();
		
		int ret;
		try {
			ret = cService.insertClassOne(obj);
			System.out.println(ret);
			if(ret==1) {
				
				request.setAttribute("message", "클래스 등록 완료했습니다.");
				request.setAttribute("url", request.getContextPath()+"/member/mypage.do?menu=2");
				
			}
			else {
				
				request.setAttribute("message", "클래스 등록 실패했습니다.");
				request.setAttribute("url", "insert.do");
			}
			
			request.getRequestDispatcher("/WEB-INF/class/alert.jsp").forward(request, response);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
