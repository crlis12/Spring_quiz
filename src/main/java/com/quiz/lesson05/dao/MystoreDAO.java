package com.quiz.lesson05.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson05.model.MyStore;
import com.quiz.lesson05.model.Review;

@Repository
public interface MystoreDAO {
	
	public List<MyStore> selectMyStoreList();
	
	public List<Review> selectmyStoreReviewById();
	
	public MyStore selectStoreById(
			@Param("id") int id,
			@Param("name")String name);
}
