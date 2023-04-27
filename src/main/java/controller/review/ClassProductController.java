package controller.review;

import java.io.IOException;
import java.util.List;

import config.MyBatisContext;
import dto.ClassSessionView;
import dto.Classproduct;
import dto.Review;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.ReviewMapper;

@WebServlet(urlPatterns = { "/class/product.do" })
public class ClassProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		long classcode = 107;
		
		// 매퍼x -> 서비스 o 햐야함
		ReviewMapper mapper = MyBatisContext.getSqlSession().getMapper(ReviewMapper.class);
		
		List<ClassSessionView> list1 = mapper.ClassSessionViewSelect(classcode);
		List<Review> list = mapper.selectReviewAll();
		Classproduct product = mapper.SelectClassproduct(classcode);

		Double.parseDouble(product.getLatitude());
		Double.parseDouble(product.getLongitude());	

//		request.setAttribute("obj", product);
			
		
		ClassSessionView obj = new ClassSessionView();
		for(ClassSessionView obj1:list1) {
			obj.setClasscode(obj1.getClasscode());
			obj.setTitle(obj1.getTitle());
			obj.setPostcode(obj1.getPostcode());
			obj.setAddress1(obj1.getAddress1());
			obj.setAddress2(obj1.getAddress2());
			obj.setAddress3(obj1.getAddress3());
			obj.setLatitude(obj1.getLatitude());
			obj.setLongitude(obj1.getLongitude());
			obj.setPrice(obj1.getPrice());
			obj.setIntro(obj1.getIntro());
			obj.setCurriculum(obj1.getCurriculum());
			obj.setInstructor(obj1.getInstructor());
			obj.setHit(obj1.getHit());
			obj.setRegdate(obj1.getRegdate());
			obj.setChk(obj1.getChk());
			obj.setLocalcode(obj1.getLocalcode());
			obj.setActcode(obj1.getActcode());
			obj.setMemberid(obj1.getMemberid());
			obj.setNo(obj1.getNo());
			obj.setCnt(obj1.getCnt());
			obj.setMinimum(obj1.getMinimum());
			obj.setMaximum(obj1.getMaximum());
			obj.setClassday(obj1.getClassday());
			obj.setClassstart(obj1.getClassstart());
			obj.setClassend(obj1.getClassend());
			obj.setDiscount(obj1.getDiscount());
			obj.setAddprice(obj1.getAddprice());
			obj.setClasslevel(obj1.getClasslevel());
			obj.setSeregdate(obj1.getSeregdate());
			obj.setLocalcate(obj1.getLocalcate());
			obj.setCitycode(obj1.getCitycode());
			obj.setActdetailcate(obj1.getActdetailcate());
			obj.setActivitycode(obj1.getActivitycode());
			obj.setActcate(obj1.getActcate());
			obj.setTotalprice(obj1.getTotalprice());
		}	
		request.setAttribute("obj", obj);
		request.setAttribute("list", list);
		request.setAttribute("list1", list1);

		request.getRequestDispatcher("/WEB-INF/class/product.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
	}
}
