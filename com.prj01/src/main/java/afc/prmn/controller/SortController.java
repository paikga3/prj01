package afc.prmn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SortController {
	
	@RequestMapping(value="/quickSort.do")
	public String quickSort() {
		return "sort/quickSort";
	}
	
	@RequestMapping(value="/countingSort.do")
	public String countingSort() {
		return "sort/countingSort";
	}
}
