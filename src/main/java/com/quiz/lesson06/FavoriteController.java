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
	
	// 주소 중복확인
	@ResponseBody  // 없으면 view를 찾는다 ajax로 오는 요청은 무조건 responsBody가 있어야 한다
	@PostMapping("/lesson06/quiz02/is_duplication")
	public Map<String, Boolean> isDuplication(
			@RequestParam("url") String url){
		
		Map<String, Boolean> result = new HashMap<>();
		Favorites favorite =  favoriteBO.getFavoriteByUrl(url);
		
		if(favorite == null) { // 중복아님
			result.put("result", false);
		}else {	// 중복
			result.put("result", true);
		}
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/lesson06/quiz02/delete_favorite")
	public Map<String, String> deleteFavorite(
			@RequestParam("id") int id){
		
		Map<String,String> result = new HashMap<>();
		
		int row = favoriteBO.deleteFavoriteById(id);
		
		if(row > 0) {
			result.put("result", "success");
		}else {
			result.put("result", "error");
			result.put("errorMessage", "삭제하는데 실패했습니다.");
		}
		return result;
		
	}
}
