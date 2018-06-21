package com.hwadee.SecondHandHouse.service.interfaces;

import com.hwadee.SecondHandHouse.Information;

public interface InformationService {
	//添加新城区
	int addinformation(Information infor);
	//修改城区信息
	int updateinformation(Information infor);
	//删除城区信息
	int deleteinformation(int inforID);
	
}
