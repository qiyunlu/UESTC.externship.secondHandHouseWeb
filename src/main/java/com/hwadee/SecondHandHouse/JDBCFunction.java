package com.hwadee.SecondHandHouse;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hwadee.SecondHandHouse.*;


public class JDBCFunction {
	
	private Connection conn;


	/**
	 * <b>查询特定类型的information</b>
	 * @return List<Information>
	 */
	public List<Information> findByInforTextType(String inforTextType){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Information> list = new ArrayList<Information>();
		
		try {
			//1. 加载驱动
			//2. 获取与数据库链接
			conn = JDBCPoolContext.getConnection();
			//3. 获取ps对象
			if(inforTextType.equals("null")) {
				ps = conn.prepareStatement("select * from information order by inforPublicDate DESC");
			}
			else{
				boolean result = inforTextType.matches("[0-9]+");
				if(result) {
					ps = conn.prepareStatement("select * from information where inforID=?");
				}else{
					ps = conn.prepareStatement("select * from information where inforTextType=?  order by inforPublicDate DESC");
				}
				ps.setString(1, inforTextType);
			}
			//4. 获取ResultSet
			rs = ps.executeQuery();
			//5. 读取数据
			while( rs.next() ){
				if(rs.getInt("inforPublishYN") == 1) {
					
					Information informations = new Information();
					informations.setInforID(rs.getInt("inforID"));
					informations.setInforTitle(rs.getString("inforTitle"));
					informations.setInforPublicDate(rs.getString("inforPublicDate"));
					informations.setInforAccurateDate(rs.getString("inforAccurateDate"));
					informations.setInforContent(rs.getString("inforContent"));
					informations.setInforTextType(rs.getString("inforTextType"));
					informations.setInforPublisher(rs.getString("inforPublisher"));
					informations.setInforPublishYN(rs.getInt("inforPublishYN"));
					informations.setInforPictureType(rs.getInt("inforPictureType"));
					informations.setInforPictureUpdate(rs.getString("inforPictureUpdate"));
					informations.setInforURL(rs.getString("inforURL"));
					
					list.add(informations);
				}
			}
			
			return list;
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				//6. 关闭链接
				rs.close();
				ps.close();
				JDBCPoolContext.close(conn);
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	
	/**
	 * 删除信息
	 * 
	 */
	public boolean delete(String inforID) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = JDBCPoolContext.getConnection();
			
			ps = conn.prepareStatement("delete from information where inforID =?");
			
			ps.setInt(1,Integer.parseInt(inforID));
			
			int result = ps.executeUpdate();
		
		
			conn.commit();
			return result == 1;
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} finally {
			try {
				//6. 鍏抽棴閾炬帴
				ps.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	} 

	
	
	/**
	 * 添加信息
	 * 
	 */
	public boolean addInformation( Information infor ){
		
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			//1. 鍔犺浇椹卞姩
			//2. 鑾峰彇涓庢暟鎹簱閾炬帴
			conn = JDBCPoolContext.getConnection();
			conn.setAutoCommit(false);
			//3. 鑾峰彇ps瀵硅薄
			//3. 获取ps对象
			ps = conn.prepareStatement("INSERT INTO information(inforTitle, inforPublicDate, inforContent, inforTextType, inforPublisher, inforPublishYN, inforPictureType) VALUES(?,?,?,?,?,?,?)");
			ps.setString(1, infor.getInforTitle());
			ps.setString(2, infor.getInforPublicDate());
			ps.setString(3, infor.getInforContent());
			ps.setString(4, infor.getInforTextType());
			ps.setString(5, infor.getInforPublisher());
			ps.setInt(6, 1);
			ps.setInt(7, 0);
			
			int result = ps.executeUpdate();
			
			conn.commit();
			return result == 1;
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} finally {
			try {
				//6. 鍏抽棴閾炬帴
				ps.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	
	
	
	/**
	 * 修改信息
	 * 
	 */
	public boolean changeInformation( Information infor ){
		
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			//1. 鍔犺浇椹卞姩
			//2. 鑾峰彇涓庢暟鎹簱閾炬帴
			conn = JDBCPoolContext.getConnection();
			conn.setAutoCommit(false);
			//3. 鑾峰彇ps瀵硅薄
			//3. 获取ps对象
			ps = conn.prepareStatement("UPDATE information SET inforTitle=?, inforPublicDate=?, inforContent=?, inforTextType=?, inforPublisher=?, inforPublishYN=?, inforPictureType=? WHERE inforID=?");
			ps.setString(1, infor.getInforTitle());
			ps.setString(2, infor.getInforPublicDate());
			ps.setString(3, infor.getInforContent());
			ps.setString(4, infor.getInforTextType());
			ps.setString(5, infor.getInforPublisher());
			ps.setInt(6, 1);
			ps.setInt(7, 0);
			ps.setInt(8, infor.getInforID());
			
			int result = ps.executeUpdate();
			
			conn.commit();
			return result == 1;
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} finally {
			try {
				//6. 鍏抽棴閾炬帴
				ps.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	
	
	
	/**
	 * <b>查询所有information的ID</b>
	 * 
	 */
	public int findInforID(int i){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			//1. 加载驱动
			//2. 获取与数据库链接
			conn = JDBCPoolContext.getConnection();
			//3. 获取ps对象
			ps = conn.prepareStatement("select * from information order by inforPublicDate DESC");
			//4. 获取ResultSet
			rs = ps.executeQuery();
			//5. 读取数据
			while( rs.next() ){
					
				if(rs.getInt("inforID") == i) {
					return 1;
				}
				else{}
				
			}
			
			return 0;
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				//6. 关闭链接
				rs.close();
				ps.close();
				JDBCPoolContext.close(conn);
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return 0;
	}
	
	
	
	/**
	 * <b>查询特定类型的house</b>
	 * @return List<House>
	 */
	public List<House> findByHouseType(String houseType){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<House> list = new ArrayList<House>();
		
		try {
			//1. 加载驱动
			//2. 获取与数据库链接
			conn = JDBCPoolContext.getConnection();
			//3. 获取ps对象
			if(houseType.equals("null")) {
				ps = conn.prepareStatement("select * from house");
			}
			else{
				boolean result = houseType.matches("[0-9]+");
				if(result) {
					ps = conn.prepareStatement("select * from house h where h.houseMeasurement <=  ?");
					ps.setInt(1, Integer.parseInt(houseType));
				}else{
					ps = conn.prepareStatement("select * from house h where h.houseAddress like ? or h.houseType like ?");
					houseType = "%"+houseType+"%";
					ps.setString(1, houseType);
					ps.setString(2, houseType);
				}
				
			}
			//4. 获取ResultSet
			rs = ps.executeQuery();
			//5. 读取数据
			while(rs.next() ){
				House houses = new House();
				houses.setHouseID(rs.getInt("houseID"));
				houses.setHouseQuality(rs.getString("houseQuality"));
				houses.setHousePicture(rs.getString("housePicture"));
				houses.setHouseTitle(rs.getString("houseTitle"));
				houses.setHouseAddress(rs.getString("houseAddress"));
				houses.setHouseSituation(rs.getString("houseSituation"));
				houses.setHouseTotalPrice(rs.getInt("houseTotalPrice"));
				houses.setHousePricePerM(rs.getInt("housePricePerM"));
				houses.setHouseMeasurement(rs.getInt("houseMeasurement"));
				houses.setHouseManager(rs.getString("houseManager"));
				
				list.add(houses);
			}
			
			return list;
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				//6. 关闭链接
				rs.close();
				ps.close();
				JDBCPoolContext.close(conn);
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	
	
	/**
	 * <b>查询指定ID的house</b>
	 * @return List<House>
	 */
	public House findByHouseID(int houseID){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		House houses = new House();
		
		try {
			//1. 加载驱动
			//2. 获取与数据库链接
			conn = JDBCPoolContext.getConnection();
			//3. 获取ps对象
			ps = conn.prepareStatement("select * from house where houseID=?");
			ps.setInt(1, houseID);
			//4. 获取ResultSet
			rs = ps.executeQuery();
			//5. 读取数据
			while(rs.next() ){
				
				houses.setHouseID(rs.getInt("houseID"));
				houses.setHouseType(rs.getString("houseType"));
				houses.setHouseQuality(rs.getString("houseQuality"));
				houses.setHousePicture(rs.getString("housePicture"));
				houses.setHouseTitle(rs.getString("houseTitle"));
				houses.setHouseAddress(rs.getString("houseAddress"));
				houses.setHouseSituation(rs.getString("houseSituation"));
				houses.setHouseTotalPrice(rs.getInt("houseTotalPrice"));
				houses.setHousePricePerM(rs.getInt("housePricePerM"));
				houses.setHouseMeasurement(rs.getInt("houseMeasurement"));
				houses.setHouseManager(rs.getString("houseManager"));
				
			}
			
			return houses;
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				//6. 关闭链接
				rs.close();
				ps.close();
				JDBCPoolContext.close(conn);
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	
	
	/**
	 * <b>查询特定城市的环线</b>
	 * @return List<RoundLine>
	 */
	public List<RoundLine> findRoundNameByCityName(String cityName){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<RoundLine> list = new ArrayList<RoundLine>();
		
		try {
			//1. 加载驱动
			//2. 获取与数据库链接
			conn = JDBCPoolContext.getConnection();
			//3. 获取ps对象
			ps = conn.prepareStatement("select * from city where cityName=?");
			if(cityName.equals("null")){
				cityName = "成都市";
			}
			else{}
			ps.setString(1, cityName);
			//4. 获取ResultSet
			rs = ps.executeQuery();
			//5. 读取数据
			while( rs.next() ){
				ps = conn.prepareStatement("select * from roundline where cityId=?");
				ps.setInt(1, rs.getInt("cityId"));
				rs = ps.executeQuery();
				
				while( rs.next() ){
					RoundLine lines = new RoundLine();
					lines.setRoundName(rs.getString("roundName"));
					
					list.add(lines);
				}
			}
			
			return list;
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				//6. 关闭链接
				rs.close();
				ps.close();
				JDBCPoolContext.close(conn);
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	
	
	/**
	 * <b>查询特定城市的环线</b>
	 * @return List<RoundLine>
	 */
	public List<Subway> findSubwayNameByCityName(String cityName){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Subway> list = new ArrayList<Subway>();
		
		try {
			//1. 加载驱动
			//2. 获取与数据库链接
			conn = JDBCPoolContext.getConnection();
			//3. 获取ps对象
			ps = conn.prepareStatement("select * from city where cityName=?");
			if(cityName.equals("null")){
				cityName = "成都市";
			}
			else{}
			ps.setString(1, cityName);
			//4. 获取ResultSet
			rs = ps.executeQuery();
			//5. 读取数据
			while( rs.next() ){
				ps = conn.prepareStatement("select * from subway where cityId=?");
				ps.setInt(1, rs.getInt("cityId"));
				rs = ps.executeQuery();
				
				while( rs.next() ){
					Subway subways = new Subway();
					subways.setSubwayName(rs.getString("subwayName"));
					
					list.add(subways);
				}
			}
			
			return list;
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				//6. 关闭链接
				rs.close();
				ps.close();
				JDBCPoolContext.close(conn);
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	
	
	/**
	 * <b>查询特定城市的区域</b>
	 * @return List<City>
	 */
	public List<Area> findAreaByCityName(String cityName){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Area> list = new ArrayList<Area>();
		
		try {
			//1. 加载驱动
			//2. 获取与数据库链接
			conn = JDBCPoolContext.getConnection();
			//3. 获取ps对象
			ps = conn.prepareStatement("select * from city where cityName=?");
			if(cityName.equals("null")){
				cityName = "成都市";
			}
			else{}
			ps.setString(1, cityName);
			//4. 获取ResultSet
			rs = ps.executeQuery();
			//5. 读取数据
			while( rs.next() ){
				ps = conn.prepareStatement("select * from area where cityId=?");
				ps.setInt(1, rs.getInt("cityId"));
				rs = ps.executeQuery();
				
				while( rs.next() ){
					Area areas = new Area();
					areas.setAreaName(rs.getString("areaName"));
					
					list.add(areas);
				}
			}
			
			return list;
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				//6. 关闭链接
				rs.close();
				ps.close();
				JDBCPoolContext.close(conn);
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
}
