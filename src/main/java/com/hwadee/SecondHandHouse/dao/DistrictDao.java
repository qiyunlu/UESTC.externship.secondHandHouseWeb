package com.hwadee.SecondHandHouse.dao;

import java.util.List;

import com.hwadee.SecondHandHouse.entity.District;

public interface DistrictDao {
	//查找该片区所属的城区
	List<District> finddistrictbyareaid(int areaId);
	
	//查找该片区的信息
	District finddistrictbydistrictid(int districtId);
	
	//更新该片区的信息
	int updatedis(District district);
	
	
	
	//添加新片区
	int adddistrict(District district);
	
	//查找所有片区
	List<District> findalldistrict();
	
	//搜索片区
	List<District> findbyname( String districtName );
}
