package afc.prmn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import afc.prmn.vo.LoginVo;

@Controller
public class LoginController {
	@RequestMapping(value="/login.do", method={RequestMethod.GET, RequestMethod.POST})
	public String goLogin() {
		return "login/login";
	}
	
	@RequestMapping(value="/loginPrc.do", method={RequestMethod.POST})
	public String loginPrc(@ModelAttribute LoginVo loginVo, Model model) {
		
		if("admin".equals(loginVo.getId()) && "1234".equals(loginVo.getPw())) {
			model.addAttribute("res", "success");
		} else {
			model.addAttribute("res", "fail");
		}
		return "jsonView";
	}
	
	@RequestMapping(value="/test.do", method={RequestMethod.GET})
	public String testPage() {
		return "test/test";
	}
	@RequestMapping(value="/test2.do", method={RequestMethod.GET})
	public String testPage2() {
		return "test/test2";
	}
}
