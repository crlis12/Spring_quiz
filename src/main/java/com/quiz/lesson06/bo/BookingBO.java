package com.quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.dao.BookingDAO;
import com.quiz.lesson06.model.Booking;

@Service
public class BookingBO {

	@Autowired
	private BookingDAO bookingDAO;
	
	public List<Booking> getBookingList() {
		
		return bookingDAO.selectBookingList();
	}
	
	public int deleteBookingById(int id) {
		
		return bookingDAO.deleteBookingById(id);
	}
	
	
	public int addBooking(String name, String date, int day, int headcount, String phoneNumber) {
		
		return bookingDAO.insertBooking(name, date, day, headcount, phoneNumber);
	}
	
	public Booking getBookingByNameAndPhoneNumber(String name, String phoneNumber) {
		
		return bookingDAO.selectBookingByNameAndPhoneNumber(name, phoneNumber);
	}
}
