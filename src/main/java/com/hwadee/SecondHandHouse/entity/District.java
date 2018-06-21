package com.hwadee.SecondHandHouse.entity;

public class District {
	private int districtId;
	private String districtName;
	private int areaId;
	private String remark;
	private String map;
	public String getMap() {
		return map;
	}
	public void setMap(String map) {
		this.map = map;
	}
	public int getDistrictId() {
		return districtId;
	}
	public void setDistrictId(int districtId) {
		this.districtId = districtId;
	}
	public String getDistrictName() {
		return districtName;
	}
	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}
	public int getAreaId() {
		return areaId;
	}
	public void setAreaId(int areaId) {
		this.areaId = areaId;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "District [districtId=" + districtId + ", districtName=" + districtName + ", areaId=" + areaId + "]";
	}
	
}
