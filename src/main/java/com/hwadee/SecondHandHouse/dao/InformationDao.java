package com.hwadee.SecondHandHouse.dao;

import com.hwadee.SecondHandHouse.Information;

public interface InformationDao {
	int deleteinformation(int inforID);
	//添加新城区
	int addinformation(Information infor);
	
	//修改城区信息
	int updateinformation(Information infor);
		

}
