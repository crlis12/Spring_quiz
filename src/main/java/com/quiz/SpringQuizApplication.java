package com.quiz;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


// @EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class}) //DB에러 DB를 사용하지 않겠다. DB를 찾지 않겠다

@SpringBootApplication
public class SpringQuizApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringQuizApplication.class, args);
	}
	
	 

}
