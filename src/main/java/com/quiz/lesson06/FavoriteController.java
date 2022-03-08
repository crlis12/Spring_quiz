package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.FavoriteBO;
import com.quiz.lesson06.model.Favorites;

@Controller
public class FavoriteController {
	
	@Autowired
	private FavoriteBO favoriteBO;
	
	@RequestMapping("/lesson06/add_favorite_view")
	public String quiz01() {
		return "lesson06/add_favorite";
	}
	
	//즐겨찾기 추가 수행 - AJAX가 요청하는 API
	@ResponseBody
	@PostMapping("/lesson06/quiz01/add_favorite")
	public Map<String, String> addFavorite(
			@RequestParam("name") String name,
			@RequestParam("url") String url){
		
		// DB insert
		favoriteBO.addFavorite(name, url);
		
		
		// 응답값 구성(map -> json String)
		Map<String, String> result = new HashMap<>();
		result.put("result", "success");
		
		//응답값 리턴
		return result;
		
		
	}
	//즐겨찾기 목록 화면
	@RequestMapping("/lesson06/quiz01/favorite_list_view")
	public String favoriteListView(Model model) {
		// db select
		List<Favorites> favoriteList = favoriteBO.getFavoriteList();
		//model에 담는다
		model.addAttribute("favorites", favoriteList);
		return "lesson06/favorite_list";
	}
	
	// 중복확인
	@ResponseBody
	@RequestMapping("")
	public Map<String, Boolean> isDuplication(
			@RequestParam("url") String url){
		
		Map<String, Boolean> result = new HashMap();
		result.put("is_duplication", favoriteBO.existUserByUrl(url));
		
		return result;
	}
}
