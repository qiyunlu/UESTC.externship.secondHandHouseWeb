package com.hwadee.SecondHandHouse.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hwadee.SecondHandHouse.dao.CityDao;
import com.hwadee.SecondHandHouse.entity.City;
import com.hwadee.SecondHandHouse.service.interfaces.CityService;

@Service
public class CityServiceImpl implements CityService {
	
	@Autowired
	private CityDao citydao;
	
	//添加城市
	public int add( City city ) {
		// TODO Auto-generated method stub
		
		citydao.addcity(city);
		
		return 0;
	}
	
	//查找所有
	public List<City> findall() {
		// TODO Auto-generated method stub
		
		return citydao.findall();
	}

	public City findbyid(int cityId) {
		// TODO Auto-generated method stub
		City city = citydao.findbyid(cityId);
		return city;
	}
	
	//查找子城市id
	public List<City> findchildrenbyid(int cityId) {
		// TODO Auto-generated method stub
		List<City> cclist = citydao.findchildrenbyid(cityId);
		return cclist;
	}

	public int updatecity(City city) {
		// TODO Auto-generated method stub
		int result = citydao.updatecity(city);
		return result;
	}

	public List<City> searchcity(String cityName) {
		// TODO Auto-generated method stub
		List<City> sclist = citydao.findbyname("%"+cityName+"%");
		return sclist;
	}
	
}
