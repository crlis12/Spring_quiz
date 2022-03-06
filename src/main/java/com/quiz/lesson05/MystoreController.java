package com.quiz.lesson05;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson05.bo.MyStoreBO;
import com.quiz.lesson05.model.MyStore;
import com.quiz.lesson05.model.Review;

@RequestMapping("/lesson05")
@Controller
public class MystoreController {

	@Autowired
	private MyStoreBO myStoreBO;

	@RequestMapping("/mystore")
	public String quiz06(Model model) {
		List<MyStore> storeList = new ArrayList<>();

		storeList = myStoreBO.getMyStoreList();

		model.addAttribute("storeList", storeList);

		return "lesson05/mystore";
	}

	@RequestMapping("/mystore_review")
	public String getmyStoreReview(
			Model model,
			@RequestParam("id") int id,
			@RequestParam("name") String name) {
		
		List<Review> review = new ArrayList<>();
		MyStore mystore = null;

		mystore = myStoreBO.getStoreById(id, name);

		review = myStoreBO.getmyStoreReviewById();

		model.addAttribute("review", review);
		model.addAttribute("mystore", mystore);

		return "lesson05/mystore_review";
	}
}
