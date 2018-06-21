package com.hwadee.SecondHandHouse.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hwadee.SecondHandHouse.dao.AreaDao;
import com.hwadee.SecondHandHouse.dao.DistrictDao;
import com.hwadee.SecondHandHouse.entity.Area;
import com.hwadee.SecondHandHouse.entity.District;
import com.hwadee.SecondHandHouse.service.interfaces.AreaService;

@Service
public class AreaServiceImpl implements AreaService {
	
	@Autowired
	private AreaDao areadao;
	@Autowired
	private DistrictDao districtdao;
	
	public List<Area> findareabycityid(int cityId) {
		// TODO Auto-generated method stub
		
		
		List<Area> alist = areadao.findareabycityid(cityId);
		
		return alist;
	}


	public List<Area> findallarea() {
		// TODO Auto-generated method stub
		
		List<Area> alist = areadao.findallarea();
		return alist;
	}


	public Boolean isexist(String areaname, List<Area> alist) {
		// TODO Auto-generated method stub
		for( int i = 0 ; i < alist.size() ; i++ )
		{
			if( areaname.equals(alist.get(i).getAreaName()) )
			{
				return true;
			}
		}
		
		return false;
	}


	public int addarea(Area area) {
		// TODO Auto-generated method stub
		
		int result = areadao.addarea(area);
		
		return result;
	}


	public int updatearea(Area area) {
		// TODO Auto-generated method stub
		
		int result = areadao.updatearea(area);
		
		return result;
	}


	public int deletearea(int areaId) {
		// TODO Auto-generated method stub
		
		int result = 0;
		result = areadao.deletearea(areaId);
		
		List<District> dlist = districtdao.finddistrictbyareaid(areaId);
		int length = dlist.size();
		
		for(int i = 0 ; i<length ; i++ )
		{
			dlist.get(i).setAreaId(0);
			districtdao.updatedis(dlist.get(i));
		}
		
		
		return result;
	}


	public List<Area> searcharea(String areaName) {
		// TODO Auto-generated method stub
		List<Area> salist = areadao.findbyname("%"+areaName+"%");
		return salist;
	}


	public Area findbyid(int areaId) {
		// TODO Auto-generated method stub
		Area area = areadao.findbyid(areaId);
		
		return area;
	}

}
