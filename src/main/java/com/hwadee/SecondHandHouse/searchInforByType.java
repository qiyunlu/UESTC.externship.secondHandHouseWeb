/**
 * 版权声明......大概没用
 */
package com.hwadee.SecondHandHouse;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Administrator
 * @document SecondHandHouse com.hwadee.SecondHandHouse searchInfor.java
 * @date 2016年6月16日 上午9:36:15
 */

@WebServlet("/infor/search")
public class searchInforByType extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		String inforTextType = null;
		inforTextType = req.getParameter("inforTextType");
		
		
		try{
			req.setAttribute("response0", "查找成功");
			req.setAttribute("response1", inforTextType);
			req.getRequestDispatcher("/login/showResu1t.jsp").forward(req, resp);
		}catch (Exception e) {
			// TODO: handle exception
		}
	}
	
}
