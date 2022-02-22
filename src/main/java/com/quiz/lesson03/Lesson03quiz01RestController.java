package com.quiz.lesson03;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;
import com.quiz.lesson03.model.RealEstate;

@RequestMapping("/lesson03/quiz01")
@RestController
public class Lesson03quiz01RestController {
	
	@Autowired
	private RealEstateBO realEstateBO;
	
	// 요청 URL: http://localhost/lesson03/quiz01/1
	@RequestMapping("/1")
	
	
	public RealEstate quiz01(
			@RequestParam("id") int id) {
		 
		return realEstateBO.getRealEstateList(id);
	}
	
	// http://localhost/lesson03/quiz01/2?rent_price=90
	@RequestMapping("/2")
	public List<RealEstate> quiz01_2(
			@RequestParam("rent_price") int rentPrice) {
		return realEstateBO.getRealEstateListByRentPrice(rentPrice);
	}
}
