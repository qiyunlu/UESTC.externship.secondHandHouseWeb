package com.hwadee.SecondHandHouse.controller;



import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hwadee.SecondHandHouse.entity.Area;
import com.hwadee.SecondHandHouse.entity.City;
import com.hwadee.SecondHandHouse.entity.User;
import com.hwadee.SecondHandHouse.service.interfaces.AreaService;
import com.hwadee.SecondHandHouse.service.interfaces.CityService;
import com.hwadee.SecondHandHouse.util.FileUpLoad;

@Controller
@RequestMapping("/city")
public class CityController {
	
	@Autowired
	private CityService cityservice;
	
	@Autowired
	private AreaService areaservice;
	
	private String projectmappath = "/Users/XYchao/Desktop/SecondHandHouse/src/main/webapp/assets/image";
	
	@RequestMapping("/add")
	public String addcity( City city , RedirectAttributes attr)
	{	
		if( "".equals(city.getCityName()) )
		{
			attr.addFlashAttribute("msg","城市名不能为空！");
		}
		else
		{
			cityservice.add(city);
		}
		return "redirect:/city/list";
	}
	
	@RequestMapping("/list")
	public String citylist( Model model ,HttpServletRequest request )
	{
		User user = (User)request.getSession().getAttribute("user");
		List<City> clist = cityservice.findall();
		List<Area> alist = areaservice.findallarea();
		
		model.addAttribute("arealist", alist);
		model.addAttribute("citylist", clist);
		model.addAttribute("user", user);
		
		return "/intermediationback/city/citytree.jsp" ;
	}
	
	@RequestMapping("/findchildrenbyid/{cityId}")
	public @ResponseBody List<City> findchildrenbyid(@PathVariable("cityId") int cityId ){
		
		
		
		List<City> cclist = null;
		try {
			cclist = cityservice.findchildrenbyid(cityId);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cclist;
	}
	
	@RequestMapping("/findcitybyid/{cityId}")
	public @ResponseBody City findcitybyid(@PathVariable("cityId") int cityId ){
		City city = cityservice.findbyid(cityId);
		return city;
	}
	
	@RequestMapping("/findcitybyname/{cityName}")
	public @ResponseBody List<City> findcitybyname(@PathVariable("cityName") String cityName ){
		
		List<City> sclist = cityservice.searchcity(cityName);
		return sclist;
	}
	
	@RequestMapping(value="/updatecity", method=RequestMethod.POST)
	public @ResponseBody int updatecity(City city )
	{
		int result = 0;
		if( city.getCityId() == city.getParentCityId() )
		{
			return 0 ;
		}
		else
		{
			result = cityservice.updatecity(city);
		}
		return result;
	}
	
	@RequestMapping(value="/addcitymap", method=RequestMethod.POST)
	public String addareamap(@RequestParam("citymap") MultipartFile file,
											 @RequestParam("cityId") int cityId,
											 HttpServletRequest request, HttpServletRequest String) throws IOException
	{	
		City city = cityservice.findbyid(cityId);
				
		String mappath = "/"+city.getCityName();
		String filename = city.getCityName()+".png";
		
		FileUpLoad.uploadFile(file, projectmappath+mappath, filename , request);
		
		city.setMap(mappath+"/"+filename);
		cityservice.updatecity(city);
		return "redirect:/city/list";
	}
}
