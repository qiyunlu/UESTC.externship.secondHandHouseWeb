package com.hwadee.SecondHandHouse.entity;

public class Area {
	private int areaId;
	private String areaName;
	private int cityId;
	private String remark;
	private String map;
	public String getMap() {
		return map;
	}
	public void setMap(String map) {
		this.map = map;
	}
	public int getAreaId() {
		return areaId;
	}
	public void setAreaId(int areaId) {
		this.areaId = areaId;
	}
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	public int getCityId() {
		return cityId;
	}
	public void setCityId(int cityId) {
		this.cityId = cityId;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "Area [areaId=" + areaId + ", areaName=" + areaName + ", cityId=" + cityId + ", remark=" + remark + "]";
	}
}
