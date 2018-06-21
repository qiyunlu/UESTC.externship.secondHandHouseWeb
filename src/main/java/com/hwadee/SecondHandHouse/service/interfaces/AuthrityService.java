package com.hwadee.SecondHandHouse.service.interfaces;

import java.util.List;

import com.hwadee.SecondHandHouse.entity.Authrity;

public interface AuthrityService {
	//查找某角色的权限
	List<Authrity> findbyroleid(int roleId);
}
