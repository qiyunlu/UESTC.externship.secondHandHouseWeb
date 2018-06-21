package com.hwadee.SecondHandHouse.service.interfaces;

import java.util.List;

import com.hwadee.SecondHandHouse.entity.District;

public interface DistrictService {
	//查找属于该城区的所有片区
	List<District> finddistrictbyareaid(int areaId);
	//查找该片区的信息
	District finddistrictbydistrictid(int districtId);
	//更新该片区信息
	int updatedis(District district);
	//添加新片区信息
	int adddistrict(District district);
	//判断该片区是否存在以判断执行修改还是新添操作
	boolean isexist(String districtName,List<District> dlist);
	//搜索片区
	List<District> findbyname( String districtName );
}
