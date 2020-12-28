package com.palette.orkney.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class mypageInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session=request.getSession();
		
		if(session.getAttribute("login") == null) {
			response.sendRedirect(request.getContextPath()+"/member/memberLogin.do");
			
			return false;
		}
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}

}
