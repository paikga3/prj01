package afc.prmn.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import afc.prmn.vo.Shop;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("prmnDAO")
public class PrmnDAO extends EgovAbstractMapper {
	
	public void save(Shop shop) {
		update("Prmn.saveShopList", shop);
	}
	
	public List<Shop> inquireShopList() {
		return selectList("Prmn.shopList");
	}
}
