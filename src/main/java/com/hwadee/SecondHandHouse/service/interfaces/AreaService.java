package com.hwadee.SecondHandHouse.service.interfaces;

import java.util.List;

import com.hwadee.SecondHandHouse.entity.Area;
import com.hwadee.SecondHandHouse.entity.City;

public interface AreaService {
	//根据城市查找城区
	List<Area> findareabycityid(int cityId);
	//查找所有城区
	List<Area> findallarea();
	//检查是否名称重复
	Boolean isexist(String areaname , List<Area> alist);
	//添加新城区
	int addarea(Area area);
	//修改城区信息
	int updatearea(Area area);
	//删除城区信息
	int deletearea(int areaId);
	//搜索城区
	List<Area> searcharea(String areaName);
	
	Area findbyid(int areaId);
}
