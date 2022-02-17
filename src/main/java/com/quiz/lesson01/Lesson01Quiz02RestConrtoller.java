package com.quiz.lesson01;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/lesson01/quiz02")
@RestController
public class Lesson01Quiz02RestConrtoller {

	// http:localhost:8080/lesson01/quiz02/1
	@RequestMapping("/1")
	public List<Map<String, Object>> movieList() {
		List<Map<String, Object>> movieList = new ArrayList();

		Map<String, Object> movie1 = new HashMap<>();
		movie1.put("rate", 15);
		movie1.put("director", "봉준호");
		movie1.put("time", 131);
		movie1.put("title", "기생충");
		movieList.add(movie1);

		Map<String, Object> movie2 = new HashMap<>();
		movie2.put("rate", 0);
		movie2.put("director", "로베르토 베니니");
		movie2.put("time", 116);
		movie2.put("title", "인생은 아름다워");
		movieList.add(movie2);

		Map<String, Object> movie3 = new HashMap<>();
		movie3.put("rate", 12);
		movie3.put("director", "크리스토퍼 놀란");
		movie3.put("time", 147);
		movie3.put("title", "인셉션");
		movieList.add(movie3);

		Map<String, Object> movie4 = new HashMap<>();
		movie4.put("rate", 19);
		movie4.put("director", "윤종빈");
		movie4.put("time", 133);
		movie4.put("title", "범죄와의 전쟁 : 나쁜놈들 전생시다");
		movieList.add(movie4);

		Map<String, Object> movie5 = new HashMap<>();
		movie5.put("rate", 15);
		movie5.put("director", "프란시스 로렌스");
		movie5.put("time", 137);
		movie5.put("title", "헝거게임");
		movieList.add(movie5);

		return movieList;
	}

	@RequestMapping("/2")
	public List<Data> quiz01_2() {
		List<Data> DataList = new ArrayList<>();
		Data data1 = new Data();
		data1.setTitle("안녕하세요 가입인사 드립니다.");
		data1.setUser("hagulu");
		data1.setContent("안녕하세요.가입했어요.앞으로 잘 부탁 드립니다. 활동 열심히 하겠습니다.");
		DataList.add(data1);

		Data data2 = new Data();
		data2.setTitle("안녕하세요 가입인사 드립니다.");
		data2.setUser("hagulu");
		data2.setContent("안녕하세요.가입했어요.앞으로 잘 부탁 드립니다. 활동 열심히 하겠습니다.");
		DataList.add(data2);

		Data data3 = new Data();
		data3.setTitle("안녕하세요 가입인사 드립니다.");
		data3.setUser("hagulu");
		data3.setContent("안녕하세요.가입했어요.앞으로 잘 부탁 드립니다. 활동 열심히 하겠습니다.");
		DataList.add(data3);

		Data data4 = new Data();
		data4.setTitle("안녕하세요 가입인사 드립니다.");
		data4.setUser("hagulu");
		data4.setContent("안녕하세요.가입했어요.앞으로 잘 부탁 드립니다. 활동 열심히 하겠습니다.");
		DataList.add(data4);

		Data data5 = new Data();
		data5.setTitle("안녕하세요 가입인사 드립니다.");
		data5.setUser("hagulu");
		data5.setContent("안녕하세요.가입했어요.앞으로 잘 부탁 드립니다. 활동 열심히 하겠습니다.");
		DataList.add(data5);

		return DataList;
	}

	@RequestMapping("/3")
	public ResponseEntity<Data> quiz02_3() {
		Data data = new Data();
		data.setTitle("dd");
		data.setUser("asdasd");
		data.setContent("안녕하세요");
		return new ResponseEntity<>(data, HttpStatus.INTERNAL_SERVER_ERROR);
	}

}
