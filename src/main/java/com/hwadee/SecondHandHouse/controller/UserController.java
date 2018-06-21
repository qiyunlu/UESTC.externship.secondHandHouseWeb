package com.hwadee.SecondHandHouse.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hwadee.SecondHandHouse.entity.Authrity;
import com.hwadee.SecondHandHouse.entity.User;
import com.hwadee.SecondHandHouse.service.interfaces.AuthrityService;
import com.hwadee.SecondHandHouse.service.interfaces.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userservice;
	@Autowired
	private AuthrityService authrityservice;
	
	//登陆
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String userlogin(@Valid @ModelAttribute("User") User user ,HttpSession session, RedirectAttributes attr,HttpServletRequest request)
	{
		if( "".equals(user.getUserAccount())||"".equals(user.getUserPassword()) )
		{
			attr.addFlashAttribute("msg","账户名或密码为空");
			return "redirect:/login/login.jsp";
		}
		User u = userservice.findbyAccount(user.getUserAccount());
		if(u.getUserPassword().equals(user.getUserPassword()))
		{
			session.setAttribute("user", u);
			return "redirect:/login/Admin.jsp";
		}
		else
		{
			attr.addFlashAttribute("msg","账户名或密码错误");
			return "redirect:/login/login.jsp";
		}
	}
	//注册
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public @ResponseBody String userregister(@Valid @ModelAttribute("User") User user ,HttpServletRequest request)
	{
		String msg = null;
		if(user.getUserAccount().equals(""))
		{
			msg="账户名不能为空";
			return msg;
		}
		else
		{
			User u = userservice.findbyAccount( user.getUserAccount() );
			if(u!=null)
			{
				msg="账户名已存在";
				return msg;
			}
		}
		String[] pw = user.getUserPassword().split(",");
		if( !pw[0].equals(pw[1]) )
		{
			msg="两次密码输入结果不相符";
			return msg;
		}
		else
		{
			user.setUserPassword(pw[0]);
			userservice.adduser(user);
			msg="注册成功";
			return msg;
		}
	}
}
