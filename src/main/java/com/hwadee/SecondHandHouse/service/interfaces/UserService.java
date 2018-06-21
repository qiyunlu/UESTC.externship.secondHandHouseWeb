package com.hwadee.SecondHandHouse.service.interfaces;

import com.hwadee.SecondHandHouse.entity.User;

public interface UserService {
	//根据账户查找User
	User findbyAccount(String userAccount);
	
	//注册用户
	int adduser(User user);
}
