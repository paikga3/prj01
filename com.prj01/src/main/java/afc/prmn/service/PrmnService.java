package afc.prmn.service;

import java.util.List;

import afc.prmn.vo.Shop;

public interface PrmnService {
	public List<Shop> inquireShopList();
	
	public void save(Shop shop);
}
