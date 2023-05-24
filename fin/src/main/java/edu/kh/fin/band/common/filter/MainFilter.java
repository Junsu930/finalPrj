package edu.kh.fin.band.common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class MainFilter
 */

@WebFilter(filterName = "mainFilter", urlPatterns="/*")
public class MainFilter extends HttpFilter implements Filter {

	 @Override
		public void init() throws ServletException {
			System.out.println("필터 실행");
		}
	 
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		ServletContext application = request.getServletContext();
		
		String contextPath = ((HttpServletRequest)request).getContextPath();
				
		application.setAttribute("contextPath", contextPath);
		
		System.out.println(contextPath);
		
		chain.doFilter(request, response);
		
		
	}


}
