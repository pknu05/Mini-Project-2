package filter;

import java.io.IOException;

import config.MyBatisContext;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

// 로그인이 필요한 페이지 => 로그인 여부 확인

@WebFilter(urlPatterns = {"/member/mypage.do", "/class/insert.do", "/apply/insert.do", "/session/*"})
public class LoginFilter implements Filter {

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		
		// System.out.println("customer filter => " + request.getRequestURL());
		
		// 해당 주소로 접근했을 때만, 그 주소를 출력,
		// 해당하지 않는 주소라면, 출력하지 않음(null이 아니라, 출력을 하지 않음 => 반응을 안 한다)
		
		HttpSession httpSession = request.getSession();
		
		String id = (String)httpSession.getAttribute("id");
		
		if(id == null) {
			
			response.sendRedirect(request.getContextPath() + "/member/login.do");
			return; // 메소드 종료
		}
		
		arg2.doFilter(arg0, arg1);

	}

	
	
	
}
