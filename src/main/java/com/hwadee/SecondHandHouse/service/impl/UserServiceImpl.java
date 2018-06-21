package com.hwadee.SecondHandHouse.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hwadee.SecondHandHouse.dao.UserDao;
import com.hwadee.SecondHandHouse.entity.User;
import com.hwadee.SecondHandHouse.service.interfaces.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userdao;
	
	public User findbyAccount(String userAccount) {
		// TODO Auto-generated method stub
		
		User user = userdao.findbyAccount(userAccount);
		
		return user;
	}

	public int adduser(User user) {
		// TODO Auto-generated method stub
		
		int result = userdao.adduser(user);
		
		return result;
	}

}
