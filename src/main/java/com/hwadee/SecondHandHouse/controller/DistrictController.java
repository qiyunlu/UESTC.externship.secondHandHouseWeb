package com.hwadee.SecondHandHouse.controller;

import com.hwadee.SecondHandHouse.util.FileUpLoad;
import org.apache.commons.io.FileUtils;  
import org.slf4j.Logger;  
import org.slf4j.LoggerFactory;  
import org.springframework.stereotype.Controller;  
import org.springframework.web.bind.annotation.RequestMapping;  
import org.springframework.web.bind.annotation.RequestParam;  
import org.springframework.web.multipart.MultipartFile;  
  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;


import java.io.File;  
import java.io.IOException;  
import java.io.OutputStream;  


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hwadee.SecondHandHouse.entity.Area;
import com.hwadee.SecondHandHouse.entity.City;
import com.hwadee.SecondHandHouse.entity.District;
import com.hwadee.SecondHandHouse.service.interfaces.AreaService;
import com.hwadee.SecondHandHouse.service.interfaces.CityService;
import com.hwadee.SecondHandHouse.service.interfaces.DistrictService;

@Controller
@RequestMapping("/district")
public class DistrictController {
	
	@Autowired
	private DistrictService districtservice;
	@Autowired
	private AreaService areaservice;
	@Autowired
	private CityService cityservice;
	
	Logger logger = LoggerFactory.getLogger(DistrictController.class);
	
	private String projectmappath = "/Users/XYchao/Desktop/SecondHandHouse/src/main/webapp/assets/image";
	
	@RequestMapping("/finddistrictbyareaid/{areaId}")
	public @ResponseBody List<District> findchildrenbyid(@PathVariable("areaId") int areaId )
	{
		List<District> dlist = null;
		try {
			dlist = districtservice.finddistrictbyareaid(areaId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dlist;
	}
	
	@RequestMapping("/findbyname/{districtName}")
	public @ResponseBody List<District> findbyname(@PathVariable("districtName") String districtName )
	{
		List<District> sdlist = districtservice.findbyname(districtName);
		return sdlist;
	}
	
	@RequestMapping("/finddistrictbydistrictid/{districtId}")
	public @ResponseBody District finddistrictbydistrictid(@PathVariable("districtId") int districtId ){
		District district = districtservice.finddistrictbydistrictid(districtId);
		return district;
	}
	
	@RequestMapping(value="/savedistrictinfo", method=RequestMethod.POST)
	public @ResponseBody int savedistrictinfo(District district )
	{
		if(district.getDistrictId()==0)
		{
			return 1;
		}
		
		List<District> dlist = districtservice.finddistrictbyareaid(district.getAreaId());
		int l = dlist.size();
		for( int i = 0 ; i < l ; i++ )
		{
			if( district.getDistrictName().equals(dlist.get(i).getDistrictName()) )
			{
				return 0;
			}
		}
		int result = districtservice.updatedis(district);
		return result;
	}
	
	@RequestMapping(value="/adddistrictinfo", method=RequestMethod.POST)
	public @ResponseBody int adddistrictinfo(District district )
	{
		int result;
		if( districtservice.isexist(district.getDistrictName(),districtservice.finddistrictbyareaid(district.getAreaId())) )
		{
			result = 0;
		}
		else
		{
			result = districtservice.adddistrict(district);
		}
		return result;
	}
	
	@RequestMapping(value="/adddistrictmap", method=RequestMethod.POST)
	public String adddistrictmap(@RequestParam("dismap") MultipartFile file,
											 @RequestParam("disId") int disId,
											 HttpServletRequest request, HttpServletRequest String) throws IOException
	{	
		District dis = districtservice.finddistrictbydistrictid(disId);
		Area area = areaservice.findbyid(dis.getAreaId());
		City city = cityservice.findbyid(area.getCityId());
				
		String mappath = "/"+city.getCityName()+"/"+area.getAreaName()+"/"+dis.getDistrictName();
		String filename = dis.getDistrictName()+".png";
		
		FileUpLoad.uploadFile(file, projectmappath+mappath, filename , request);
		
		dis.setMap(mappath+"/"+filename);
		districtservice.updatedis(dis);
		return "redirect:/city/list";
	}
}
