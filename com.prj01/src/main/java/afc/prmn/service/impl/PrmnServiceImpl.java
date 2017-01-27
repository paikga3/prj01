package afc.prmn.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import afc.prmn.dao.PrmnDAO;
import afc.prmn.service.PrmnService;
import afc.prmn.vo.Shop;

@Service("prmnService")
public class PrmnServiceImpl implements PrmnService {

	@Resource(name="prmnDAO")
	private PrmnDAO prmnDAO;
	
	@Override
	public List<Shop> inquireShopList() {
		return prmnDAO.inquireShopList();
	}

	@Override
	public void save(Shop shop) {
		prmnDAO.save(shop);
		
	}

}
