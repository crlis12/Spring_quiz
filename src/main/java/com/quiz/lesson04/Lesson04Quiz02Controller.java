package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson04.bo.RealtorBO;
import com.quiz.lesson04.model.Realtor;

@Controller
public class Lesson04Quiz02Controller {
	
	
	@Autowired
	private RealtorBO realtorBO;
	
	// http://localhost/lesson04/quiz02/1
	@RequestMapping("/lesson04/quiz02/1")
	public String quiz02_1() {
		return "lesson04/add_realtor";
	}
	
	//http://localhost/lesson04/quiz02/add_realtor
	@PostMapping("/lesson04/quiz02/add_realtor")
	public String addRealtor(
			@ModelAttribute Realtor realtor,
			Model model) {
		
		// db insert -> 그 키가 무엇인지 받아옴
		realtorBO.addRealtor(realtor);
		
		
		// 방금 insert 된 데이터를 db select
		realtor = realtorBO.getRealtorById(realtor.getId()); //id값을 가져와서 select해준다
		
		model.addAttribute("realtor", realtor);
		return "lesson04/after_add_realtor";
	}
}
