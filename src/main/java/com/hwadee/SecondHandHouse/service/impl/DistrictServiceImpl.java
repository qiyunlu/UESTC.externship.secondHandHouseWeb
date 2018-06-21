package com.hwadee.SecondHandHouse.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hwadee.SecondHandHouse.dao.DistrictDao;
import com.hwadee.SecondHandHouse.entity.District;
import com.hwadee.SecondHandHouse.service.interfaces.DistrictService;

@Service
public class DistrictServiceImpl implements DistrictService {
	
	@Autowired
	DistrictDao districtdao;
	
	public List<District> finddistrictbyareaid(int areaId) {
		// TODO Auto-generated method stub
		
		List<District> dlist = districtdao.finddistrictbyareaid(areaId);
		
		return dlist;
	}

	public District finddistrictbydistrictid(int districtId) {
		// TODO Auto-generated method stub
		
		District district = districtdao.finddistrictbydistrictid(districtId);
		
		return district;
	}

	public int updatedis(District district) {
		// TODO Auto-generated method stub
		int result = districtdao.updatedis(district);
		return result;
	}

	public int adddistrict(District district) {
		// TODO Auto-generated method stub
		int result = districtdao.adddistrict(district);
		return result;
	}

	public boolean isexist(String districtName, List<District> dlist) {
		// TODO Auto-generated method stub
		
		for( int i = 0 ; i<dlist.size() ; i++ )
		{
			if( districtName.equals(dlist.get(i).getDistrictName()) )
			{
				return true;
			}
		}
		return false;
	}

	public List<District> findbyname(String districtName) {
		// TODO Auto-generated method stub
		List<District> sdlist = districtdao.findbyname("%"+districtName+"%");
		
		return sdlist;
	}
}
