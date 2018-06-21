/**
 * 版权声明......大概没用
 */
package com.hwadee.SecondHandHouse;

/**
 * @author Administrator
 * @document SecondHandHouse com.hwadee.SecondHandHouse City.java
 * @date 2016年6月13日 上午10:48:42
 */
public class City {
	
	private int cityId;
	private int parentCityId;
	private String cityName;
	private String remark;
	private String map;
	
	public int getCityId() {
		return cityId;
	}
	public void setCityId(int cityId) {
		this.cityId = cityId;
	}
	public int getParentCityId() {
		return parentCityId;
	}
	public void setParentCityId(int parentCityId) {
		this.parentCityId = parentCityId;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getMap() {
		return map;
	}
	public void setMap(String map) {
		this.map = map;
	}
	
}
