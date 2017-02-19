package afc.prmn.vo;

import java.util.List;

public class Shop {
	private int shopNo;
	private String shopName;
	private String shopLocation;
	private String shopStatus;
	private List<Shop> shopList;
	public List<Shop> getShopList() {
		return shopList;
	}
	public void setShopList(List<Shop> shopList) {
		this.shopList = shopList;
	}
	public int getShopNo() {
		return shopNo;
	}
	public void setShopNo(int shopNo) {
		this.shopNo = shopNo;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public String getShopLocation() {
		return shopLocation;
	}
	public void setShopLocation(String shopLocation) {
		this.shopLocation = shopLocation;
	}
	public String getShopStatus() {
		return shopStatus;
	}
	public void setShopStatus(String shopStatus) {
		this.shopStatus = shopStatus;
	}
	
	@Override
	public String toString() {
		return "{'shopNo':'" + getShopNo() + "','shopName':'" + getShopName() + "','shopLocation':'" + getShopLocation() + "','shopStatus':'" + getShopStatus() + "'}";
	}
}
