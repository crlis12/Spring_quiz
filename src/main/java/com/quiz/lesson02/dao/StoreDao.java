package com.quiz.lesson02.dao;

import java.util.List; 

import org.springframework.stereotype.Repository;

import com.quiz.lesson02.model.Store;

@Repository
public interface StoreDao {
	public List<Store> selectStoreList(); // bo한테 넘겨준다
}
