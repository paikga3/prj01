package afc.prmn.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.ConversionService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import afc.prmn.service.PrmnService;
import afc.prmn.vo.Shop;

@Controller
@RequestMapping(value="/prmn")
public class PrmnController {
	
	@Resource(name="prmnService")
	private PrmnService prmnService;
	
	@Autowired
	private ConversionService conversionService;
	
	
	@RequestMapping(value = "/init.do" ,method = {RequestMethod.GET, RequestMethod.POST})
	public String goPrmn() {
		return "prmn/prmnList";
	}
	
	@RequestMapping(value = "/list.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String getPrmnList(Model model) {
		List<Shop> shopList = prmnService.inquireShopList();
		model.addAttribute("list", shopList);
		return "jsonView";
	}
	
	@RequestMapping(value="/merge.do", method=RequestMethod.POST)
	public String merge(@RequestParam List<Shop> param) {
		Shop shop = new Shop();
		shop.setShopList(param);
		prmnService.save(shop);
		return goPrmn();
	}
}
