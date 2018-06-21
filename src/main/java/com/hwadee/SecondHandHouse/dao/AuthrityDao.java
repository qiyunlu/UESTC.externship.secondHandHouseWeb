package com.hwadee.SecondHandHouse.dao;

import java.util.List;

import com.hwadee.SecondHandHouse.entity.Authrity;

public interface AuthrityDao {
	//查找该角色所拥有的权限
	List<Authrity> findbyroleid(int roleId);
}
