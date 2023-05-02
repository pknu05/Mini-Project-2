package filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

// 로그인 했을 때, 마지막 페이지로 이동 -> 그러나, 로그인 주소와 로그아웃 주소는 저장하면 안 됨

@WebFilter(urlPatterns = {"/class/*", "/member/*", "/home.do", "/apply/*"})
public class URLFilter implements Filter {

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		
		HttpSession httpSession = request.getSession();
		
		String uri = request.getRequestURI();
		//System.out.println(uri);
		
		if(!uri.contains("login.do") && !uri.contains("logout.do") && !uri.contains("findid.do") && !uri.contains("join.do")) {
			
			// session에 로그인 정보가 없을 때, url 주소를 url에 넣고, login.do 페이지로 보냄
			
			String queryString = request.getQueryString();
			
			if(queryString == null) {
				httpSession.setAttribute("url", request.getRequestURI());
				System.out.println("customer filter => " + request.getRequestURI());
			}
			else {
				httpSession.setAttribute("url", request.getRequestURI()+"?"+queryString);
				System.out.println("customer filter => " + request.getRequestURI()+"?"+queryString);
			}
		}
		
		arg2.doFilter(arg0, arg1);
		
	}
}
