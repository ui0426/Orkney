package com.palette.orkney.common.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	         throws Exception {
	      
	      HttpSession session=request.getSession();
	      Map login=(Map)session.getAttribute("login");
	      if(login == null) {
	         //로그인이 안된상태
	    	  response.sendRedirect(request.getContextPath()+"/views/error/transError.jsp");
				
				return false;
	         
	      }else {
	         return super.preHandle(request, response, handler);         
	      }
	      
	      
	      
	   }
}
