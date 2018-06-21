package com.hwadee.SecondHandHouse.dao;

import java.util.List;

import com.hwadee.SecondHandHouse.entity.Area;
import com.hwadee.SecondHandHouse.entity.City;

public interface AreaDao {
	//查到城市的城区
	List<Area> findareabycityid(int cityId);
	
	//返回所有城区
	List<Area> findallarea();
	
	//添加新城区
	int addarea(Area area);
	
	//修改城区信息
	int updatearea(Area area);
	
	//删除城区
	int deletearea(int areaId);
	
	//搜索城区
	List<Area> findbyname(String areaName);
	
	//
	Area findbyid(int areaId);
}
