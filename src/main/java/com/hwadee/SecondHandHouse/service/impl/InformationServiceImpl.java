package com.hwadee.SecondHandHouse.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hwadee.SecondHandHouse.Information;
import com.hwadee.SecondHandHouse.dao.InformationDao;
import com.hwadee.SecondHandHouse.service.interfaces.InformationService;

@Service
public class InformationServiceImpl implements InformationService {
	
	@Autowired
	private InformationDao informatiodao;

	public int addinformation(Information infor) {
		int result = informatiodao.addinformation(infor);
		
		return result;
	}

	public int updateinformation(Information infor) {
		int result = informatiodao.updateinformation(infor);
		
		return result;
	}

	public int deleteinformation(int inforID) {
		// TODO Auto-generated method stub
		int result = informatiodao.deleteinformation(inforID);
		return result;
	}

}
