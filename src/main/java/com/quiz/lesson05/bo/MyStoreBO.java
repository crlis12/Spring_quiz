package com.quiz.lesson05.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson05.dao.MystoreDAO;
import com.quiz.lesson05.model.MyStore;
import com.quiz.lesson05.model.Review;

@Service
public class MyStoreBO {
	
	@Autowired
	private MystoreDAO myStoreDAO;
	public List<MyStore> getMyStoreList(){
		List<MyStore> storeList = myStoreDAO.selectMyStoreList(); 
		
		return storeList;
	}
	
	public List<Review> getmyStoreReviewById() {
		return myStoreDAO.selectmyStoreReviewById();
	}
	
	public MyStore getStoreById(int id, String name) {
		
		return myStoreDAO.selectStoreById(id, name);
	}
}
