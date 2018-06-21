package com.hwadee.SecondHandHouse.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hwadee.SecondHandHouse.entity.Area;
import com.hwadee.SecondHandHouse.entity.City;
import com.hwadee.SecondHandHouse.entity.District;
import com.hwadee.SecondHandHouse.service.interfaces.AreaService;
import com.hwadee.SecondHandHouse.service.interfaces.CityService;
import com.hwadee.SecondHandHouse.util.FileUpLoad;

@Controller
@RequestMapping("/area")
public class AreaController {
	
	@Autowired
	private AreaService areaservice;
	@Autowired
	private CityService cityservice;
	
	private String projectmappath = "/Users/XYchao/Desktop/SecondHandHouse/src/main/webapp/assets/image";
	
	@RequestMapping("/findareabycityid/{cityId}")
	public @ResponseBody List<Area> findareabycityid( @PathVariable("cityId") int cityId )
	{
		
		List<Area> alist = areaservice.findareabycityid(cityId);
		
		return alist;
	}
	
	@RequestMapping("/findbyname/{areaName}")
	public @ResponseBody List<Area> findbyname( @PathVariable("areaName") String areaName )
	{
		List<Area> salist = null;
		if("".equals(areaName))
		{
			return salist;
		}
		else
		{
			salist = areaservice.searcharea(areaName);
		}
		
		return salist;
	}
	
	@RequestMapping("/deletearea/{areaId}")
	public @ResponseBody int deletearea( @PathVariable("areaId") int areaId )
	{
		
		int result = areaservice.deletearea(areaId);
		
		return result;
	}
	
	@RequestMapping(value="/updatearea", method=RequestMethod.POST)
	public @ResponseBody int updatearea(Area area )
	{
		int result = areaservice.updatearea(area);
		return result;
	}
	
	@RequestMapping(value="/addarea", method=RequestMethod.POST)
	public @ResponseBody int addarea(Area area )
	{
		int result = 0;
		if( areaservice.isexist( area.getAreaName() , areaservice.findareabycityid( area.getCityId() ) )  )
		{
			result = 0;
		}
		else
		{
			result = areaservice.addarea(area);
		}
		return result;
	}
	
	@RequestMapping(value="/addareamap", method=RequestMethod.POST)
	public String addareamap(@RequestParam("areamap") MultipartFile file,
											 @RequestParam("areaId") int areaId,
											 HttpServletRequest request, HttpServletRequest String) throws IOException
	{	
		Area area = areaservice.findbyid(areaId);
		City city = cityservice.findbyid(area.getCityId());
				
		String mappath = "/"+city.getCityName()+"/"+area.getAreaName();
		String filename = area.getAreaName()+".png";
		
		FileUpLoad.uploadFile(file, projectmappath+mappath, filename , request);
		
		area.setMap(mappath+"/"+filename);
		areaservice.updatearea(area);
		return "redirect:/city/list";
	}
}
