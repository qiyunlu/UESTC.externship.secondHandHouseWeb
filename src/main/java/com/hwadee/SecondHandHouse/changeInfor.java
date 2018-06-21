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
 * @document SecondHandHouse com.hwadee.SecondHandHouse changeInfor.java
 * @date 2016年6月16日 上午10:34:27
 */

@WebServlet("/infor/change")
public class changeInfor extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		Information infor = new Information();
		
		//连接用户数据库
		JDBCFunction fun = new JDBCFunction();
		
		String inforID = req.getParameter("inforID");
		String inforTitle = req.getParameter("inforTitle");
		String inforTextType = req.getParameter("inforTextType");
		String inforContent = req.getParameter("inforContent");
		String inforPublisher = req.getParameter("inforPublisher");
		String inforPublicDate = req.getParameter("inforPublicDate");
		
		if(inforTitle.equals("")||inforContent.equals("")||inforPublisher.equals("")||inforPublicDate.equals("")||inforID.equals("")) {
			try{
				req.setAttribute("response0", "修改失败，所有栏必须为非空");
				req.getRequestDispatcher("/login/showResult.jsp").forward(req, resp);
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
		else if(fun.findInforID(Integer.parseInt(inforID)) == 0) {
			try{
				req.setAttribute("response0", "修改失败，消息ID不存在");
				req.getRequestDispatcher("/login/showResult.jsp").forward(req, resp);
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
		else {
			
			infor.setInforID(Integer.parseInt(inforID));
			infor.setInforTitle(inforTitle);
			infor.setInforTextType(inforTextType);
			infor.setInforContent(inforContent);
			infor.setInforPublisher(inforPublisher);
			infor.setInforPublicDate(inforPublicDate);
			
			fun.changeInformation(infor);
			//显示结果
			try{
				req.setAttribute("response0", "修改成功");
				req.getRequestDispatcher("/login/showResult.jsp").forward(req, resp);
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
	}
	
}
