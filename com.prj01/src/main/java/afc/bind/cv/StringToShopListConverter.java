package afc.bind.cv;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.core.convert.converter.Converter;

import afc.prmn.vo.Shop;

public class StringToShopListConverter implements Converter<String, List<Shop>> { 
	
	@Override
	public List<Shop> convert(String text) {
		List<Shop> shopList = new ArrayList<Shop>();
		text = text.replaceAll("&quot;|\\[|\\]", "");
		String[] shopListTextArr = text.split("(?<=\\}),(?=\\{)");
		for(String shopText : shopListTextArr) {
			shopText = shopText.replaceAll("\\{|\\}", "");
			String[] shopTextArr = shopText.split(",");
			Shop shop = new Shop();
			for(String propertyStr : shopTextArr) {
				Pattern regex = Pattern.compile("((?<=\\:).+)|.+(?=\\:)");
				Matcher matcher = regex.matcher(propertyStr);
				if(matcher.find()) {
					switch(matcher.group()){
						case "shopNo":
							matcher.find();
							shop.setShopNo(Integer.parseInt(matcher.group()));
							break;
						case "shopName":
							matcher.find();
							shop.setShopName(matcher.group());
							break;
						case "shopLocation":
							matcher.find();
							shop.setShopLocation(matcher.group());
							break;
						case "shopStatus":
							matcher.find();
							shop.setShopStatus(matcher.group());
							break;
					}
				}
			}
			shopList.add(shop);
		}
		
		return shopList;
	}
	
}
