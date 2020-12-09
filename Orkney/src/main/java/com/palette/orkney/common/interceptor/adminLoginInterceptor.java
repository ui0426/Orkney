package com.palette.orkney.common.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class adminLoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub
		
		HttpSession session=request.getSession();
		Map login=(Map)session.getAttribute("login");
		if(login==null||(login!=null&&login.get("AUTHORITY").equals("회원"))) {
			response.sendRedirect(request.getContextPath()+"/views/error/transError.jsp");
			return false;
		}
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}

}
