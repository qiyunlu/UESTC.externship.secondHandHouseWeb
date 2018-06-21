package com.hwadee.SecondHandHouse.service.interfaces;

import java.util.List;

import com.hwadee.SecondHandHouse.entity.City;

public interface CityService {
	//添加城市
	int add( City city );
	
	//查找所有城市
	List<City> findall();
	
	//根据id查找城市
	City findbyid(int cityId);
	
	//查找子城市id
	List<City> findchildrenbyid(int cityId);
	
	//修改city的信息
	int updatecity(City city);
	
	//搜索city
	List<City> searchcity(String cityName);
}
