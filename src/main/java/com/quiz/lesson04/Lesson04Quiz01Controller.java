package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.bo.SellerBO;
import com.quiz.lesson04.model.Seller;

@RequestMapping("/lesson04/quiz01")
@Controller
public class Lesson04Quiz01Controller {
	
	@Autowired
	private SellerBO sellerBO;
	
	//http://localhost/lesson04/quiz01/1
	@GetMapping("/1")
	public String quiz01_1( ) {
		
		return "lesson04/add_seller";
	}
	
	
	
	@PostMapping("/add_seller")
	public String addSeller(
			@RequestParam("nickname") String nickname,
			@RequestParam(value = "profileImageUrl",required = false) String profileImageUrl,
			@RequestParam("temperature") double temperature) {
		
		sellerBO.AddSeller(nickname, profileImageUrl, temperature);
		
		return "lesson04/after_add_seller";
	}
	
	//문제2
	// http://localhost/lesson04/quiz01/seller_info
	// http://localhost/lesson04/quiz01/seller_info?id=3
	@RequestMapping("/seller_info")
	public String sellerInfo(
			@RequestParam(value="id", required = false) Integer id,
			Model model) {  // Model한테 seller 에서 가져온 데이터를 가지고온다
			
			Seller seller = null;
			if(id == null) {
				seller = sellerBO.getLastSeller();
			} else {
				seller = sellerBO.getSellerById(id);
			}
			model.addAttribute("seller", seller); // 가져올 키값 map형태
			
			
		return "lesson04/seller_info";
	}
}
