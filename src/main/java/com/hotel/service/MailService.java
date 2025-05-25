package com.hotel.service;


public interface MailService {
    public void sendBookingConfirmation(String toEmail, String subject, String guestName,String roomNo, String checkIn, String checkOut);
    public boolean sendPasswordResetLink(String toEmail);
}
