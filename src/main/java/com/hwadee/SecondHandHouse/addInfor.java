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
 * @document SecondHandHouse com.hwadee.SecondHandHouse InforManage.java
 * @date 2016年6月15日 下午2:12:55
 */
	
@WebServlet("/infor/add")
public class addInfor extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		Information infor = new Information();
		
		String inforTitle = req.getParameter("inforTitle");
		String inforTextType = req.getParameter("inforTextType");
		String inforContent = req.getParameter("inforContent");
		String inforPublisher = req.getParameter("inforPublisher");
		String inforPublicDate = req.getParameter("inforPublicDate");
		
		infor.setInforTitle(inforTitle);
		infor.setInforTextType(inforTextType);
		infor.setInforContent(inforContent);
		infor.setInforPublisher(inforPublisher);
		infor.setInforPublicDate(inforPublicDate);
		
		if(inforTitle.equals("")||inforContent.equals("")||inforPublisher.equals("")||inforPublicDate.equals("")) {
			try{
				req.setAttribute("response0", "添加失败，所有栏必须为非空");
				req.getRequestDispatcher("/login/showResult.jsp").forward(req, resp);
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
		else {
			//连接用户数据库
			JDBCFunction fun = new JDBCFunction();
			fun.addInformation(infor);
			
			//显示结果
			try{
				req.setAttribute("response0", "添加成功");
				req.getRequestDispatcher("/login/showResult.jsp").forward(req, resp);
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
	}
}