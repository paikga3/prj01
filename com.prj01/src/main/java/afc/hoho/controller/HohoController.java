package afc.hoho.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HohoController {
	
	@RequestMapping(value="/hoho.do")
	public String hohoinit() {
		return "haha/hoho";
	}
}
