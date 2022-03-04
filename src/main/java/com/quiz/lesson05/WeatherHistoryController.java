package com.quiz.lesson05;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson05.bo.WeatherHistoryBO;
import com.quiz.lesson05.model.WeatherHistory;

@RequestMapping("/lesson05")
@Controller
public class WeatherHistoryController {
	
	@Autowired
	WeatherHistoryBO weatherHistoryBO;
	
	@RequestMapping("/weather_history")
	public String quiz05(Model model) {
		List<WeatherHistory> weatherHistory = new ArrayList<WeatherHistory>();
		
		weatherHistory = weatherHistoryBO.getWeatherHistoryList();
		
		model.addAttribute("weatherHistory", weatherHistory);
		
		return "lesson05/weather_history";
	}
	
	@RequestMapping("/add_weather_view")
	public String addWeatherView() {
		return "lesson05/add_weather_history";
	}
	
	@PostMapping("/add_weather")
	public String addWeather(
			@RequestParam("date") String date,
			@RequestParam("weather") String weather,
			@RequestParam("microDust") String microDust,
			@RequestParam("temperatures") double temperatures,
			@RequestParam("precipitation") double precipitation,
			@RequestParam("WindSpeed") double windSpeed){
		
		// add data (db insert)
		weatherHistoryBO.addWeatherHistory(date, weather, microDust, temperatures, precipitation, windSpeed);
		//redirect => 날씨 정보 리스트 화면
		return "redirect:/lesson05/weather_history";  //redirect는 다시 보여줄 경로를 적어준다.
	}
}
