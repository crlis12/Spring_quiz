package com.quiz.lesson03.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson03.model.RealEstate;

@Repository
public interface RealEstateDAO {

	public RealEstate selectRealEstateList(int id);	
	
	public List<RealEstate> selectRealEstateListByRentPrice(int rentPrice);
	
	public List<RealEstate> selectRealEstateListByAreaAndPrice(
			@Param("area")int area,  //Param 하나의 맵으로 어노테이션 해준다 mapper에 한번에 넘겨주기 위해서 사용한다 
			@Param("price")int price); // @PAram은 파라미터들을 amp으로 구성해준다.
	
}


