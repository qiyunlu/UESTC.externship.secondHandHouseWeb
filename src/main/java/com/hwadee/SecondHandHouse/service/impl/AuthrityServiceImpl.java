package com.hwadee.SecondHandHouse.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hwadee.SecondHandHouse.dao.AuthrityDao;
import com.hwadee.SecondHandHouse.entity.Authrity;
import com.hwadee.SecondHandHouse.service.interfaces.AuthrityService;

@Service
public class AuthrityServiceImpl implements AuthrityService {
	
	@Autowired
	private AuthrityDao authritydao;
	
	public List<Authrity> findbyroleid(int roleId) {
		// TODO Auto-generated method stub
		List<Authrity> alist = authritydao.findbyroleid(roleId);
		
		return alist;
	}

}
