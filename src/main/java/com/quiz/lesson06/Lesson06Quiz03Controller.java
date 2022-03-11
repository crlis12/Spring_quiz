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

import com.quiz.lesson06.bo.BookingBO;
import com.quiz.lesson06.model.Booking;

@RequestMapping("/lesson06/quiz03")
@Controller
public class Lesson06Quiz03Controller {

	@Autowired
	private BookingBO bookingbo;

	// 예약 리스트
	@RequestMapping("/1")
	public String reservationList(Model model) {

		List<Booking> booking = bookingbo.getBookingList();

		model.addAttribute("booking", booking);

		return "lesson06/reservation_list";
	}
	
	
	//예약 삭제 기능
	@ResponseBody
	@PostMapping("/delete_reservation")
	public Map<String, String> delResrvation(
			@RequestParam("id") int id) {

		Map<String, String> result = new HashMap<>();

		int row = bookingbo.deleteBookingById(id);

		if (row > 0) {
			result.put("result", "success");
		} else {
			result.put("result", "error");
			result.put("errorMessage", "삭제하는데 실패했습니다.");
		}
		return result;
	}
	
	
	@RequestMapping("/add_reservation_view")
	public String addRervation() {
		
		return "lesson06/add_reservation";
	}
	
	@ResponseBody
	@RequestMapping("/add_reservation")
	public Map<String, Object> addReservation(
			@RequestParam("name") String name,
			@RequestParam("date") String date,
			@RequestParam("day") int day,
			@RequestParam("headcount") int headcount ,
			@RequestParam("phoneNumber")String phoneNumber){
		
		Map<String, Object> result = new HashMap<>();
		
		int count = bookingbo.addBooking(name, date, day, headcount, phoneNumber);
		
		if(count > 0) {
			result.put("result", "success");
		}else {
			result.put("result", "error");
			result.put("error_message", "예약에 실패했습니다.");
		}
		
		return result;
		
	}
}
