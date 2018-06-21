package com.hwadee.SecondHandHouse.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.hwadee.SecondHandHouse.entity.Authrity;
import com.hwadee.SecondHandHouse.entity.User;
import com.hwadee.SecondHandHouse.service.interfaces.AuthrityService;

public class AuthInterceptor implements HandlerInterceptor {
	@Autowired
	AuthrityService authrityservice;
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		if(user==null)
		{
			response.sendRedirect("/login/login.jsp");
			return false;
		}
		
		List<Authrity> alist = authrityservice.findbyroleid(user.getRoleId());
		int l = alist.size();
		String s = request.getRequestURI().split("//?")[1];
		for( int i = 0 ; i < l ; i++ )
		{
			if( s.equals(alist.get(i).getAuthName()) )
			{
				return true;
			}
		}
		response.sendRedirect("/login/home.jsp");
		return false;
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
