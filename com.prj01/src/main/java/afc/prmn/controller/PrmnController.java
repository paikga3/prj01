package afc.prmn.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import afc.prmn.service.PrmnService;
import afc.prmn.vo.Shop;

@Controller
@RequestMapping(value="/prmn")
public class PrmnController {
	
	@Resource(name="prmnService")
	private PrmnService prmnService;
	
	@RequestMapping("/list.do")
	public String goPrmnList(Model model) {
		
		List<Shop> shopList = prmnService.inquireShopList();
		
		model.addAttribute("list", shopList);
		return "prmn/prmnList";
	}
	
	@RequestMapping(value="/merge.do", method=RequestMethod.POST)
	public String merge(@RequestBody Shop shopList, Model model) {
		
		prmnService.save(shopList);
		return goPrmnList(model);
	}
	
}
