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
 * @document SecondHandHouse com.hwadee.SecondHandHouse deleteInfor.java
 * @date 2016年6月15日 下午8:14:13
 */

@WebServlet("/infor/delete")
public class deleteInfor extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//连接用户数据库
		JDBCFunction fun = new JDBCFunction();
		
		req.setCharacterEncoding("UTF-8");
		String inforID = req.getParameter("inforID");
		
		if(inforID.equals("")) {
			try{
				req.setAttribute("response0", "删除失败，消息ID不能为空");
				req.getRequestDispatcher("/login/showResult.jsp").forward(req, resp);
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
		else if(fun.findInforID(Integer.parseInt(inforID)) == 0) {
			try{
				req.setAttribute("response0", "删除失败，消息ID不存在");
				req.getRequestDispatcher("/login/showResult.jsp").forward(req, resp);
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
		else {
			
			fun.delete(inforID);
			
			//显示结果
			try{
				req.setAttribute("response0", "删除成功");
				req.getRequestDispatcher("/login/showResult.jsp").forward(req, resp);
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
	}
}
