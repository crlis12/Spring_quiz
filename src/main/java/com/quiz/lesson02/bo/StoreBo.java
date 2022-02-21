package com.quiz.lesson02.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson02.dao.StoreDao;
import com.quiz.lesson02.model.Store;

@Service
public class StoreBo {
	
	@Autowired
	private StoreDao storeDao; //의존성 주입
	
	public List<Store> getStoreList(){
		List<Store> storeList = storeDao.selectStoreList();
		
		
		return storeList;
		
	}
}
