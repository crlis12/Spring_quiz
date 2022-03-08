package com.quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.dao.FavoriteDAO;
import com.quiz.lesson06.model.Favorites;

@Service
public class FavoriteBO {
	
	
	@Autowired
	private FavoriteDAO favoriteDAO;
	public void addFavorite(String name, String url) {
		
		favoriteDAO.insertFavorite(name, url);
	}
	
	public List<Favorites> getFavoriteList(){
		
		return favoriteDAO.selectFavoriteList();
	}
	
	public boolean existUserByUrl(String url) {
		
		return favoriteDAO.existUserByUrl(url);
	}
}
