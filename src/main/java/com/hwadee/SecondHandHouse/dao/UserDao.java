package com.hwadee.SecondHandHouse.dao;

import com.hwadee.SecondHandHouse.entity.User;

public interface UserDao {
	
	//根据用户名查找用户
	User findbyAccount(String userAccount);
	
	//注册用户
	int adduser(User user);
}
