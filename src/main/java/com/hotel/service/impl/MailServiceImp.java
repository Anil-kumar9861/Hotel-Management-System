package com.hotel.service.impl;

import com.hotel.model.User;
import com.hotel.repository.UserRepository;
import com.hotel.service.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

@Service
public class MailServiceImp implements MailService {

    @Autowired
    private JavaMailSender javaMailSender;

    @Async
    public void sendBookingConfirmation(String toEmail, String subject, String guestName,String roomNumber, String checkIn, String checkOut) {
        MimeMessage message = javaMailSender.createMimeMessage();

        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setFrom("youremail@gmail.com"); // Change to your actual email
            helper.setTo(toEmail);
            helper.setSubject(subject);

            // HTML content
            String htmlContent = "<!DOCTYPE html>" +
                    "<html lang='en'>" +
                    "<head>" +
                    "<meta charset='UTF-8'>" +
                    "<meta name='viewport' content='width=device-width, initial-scale=1.0'>" +
                    "<style>" +
                    "body { margin: 0; padding: 0; background-color: #f6f9fc; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }" +
                    ".email-container { max-width: 600px; margin: 40px auto; background-color: #ffffff; border-radius: 12px; box-shadow: 0 6px 18px rgba(0, 0, 0, 0.06); overflow: hidden; }" +
                    ".email-header { background: #4caf50 ; color: white; padding: 30px 20px; text-align: center; }" +
                    ".email-header h1 { margin: 0; font-size: 26px; letter-spacing: 1px; }" +
                    ".email-body { padding: 30px 25px; color: #333333; }" +
                    ".email-body h2 { margin-top: 0; color: #4CAF50; font-size: 20px; }" +
                    ".email-body p { line-height: 1.7; margin-bottom: 16px; font-size: 15px; }" +
                    ".booking-details { background: #f0f4f8; padding: 15px 20px; border-radius: 8px; margin-top: 20px; }" +
                    ".booking-details p { margin: 6px 0; font-size: 14px; }" +
                    ".email-footer { background-color: #f1f1f1; text-align: center; padding: 15px; font-size: 12px; color: #777; }" +
                    "</style>" +
                    "</head>" +
                    "<body>" +
                    "<div class='email-container'>" +
                    "<div class='email-header'>" +
                    "<h1>Booking Confirmation</h1>" +
                    "</div>" +
                    "<div class='email-body'>" +
                    "<h2>Hello " + guestName + ",</h2>" +
                    "<p>We're excited to confirm your booking. Here are the details:</p>" +
                    "<div class='booking-details'>" +
                    "<p><strong>Room-Number:</strong> " + roomNumber + "</p>" +
                    "<p><strong>Check-In:</strong> " + checkIn + "</p>" +
                    "<p><strong>Check-Out:</strong> " + checkOut + "</p>" +
                    "</div>" +
                    "<p>If you have any questions or need to make changes, feel free to contact us at any time. We're here to help!</p>" +
                    "<p>Warm regards,<br><strong>Hotel Nova  Team</strong></p>" +
                    "</div>" +
                    "<div class='email-footer'>" +
                    "<p>This is an automated message. Please do not reply.</p>" +
                    "</div>" +
                    "</div>" +
                    "</body>" +
                    "</html>";


            helper.setText(htmlContent, true); // true = send as HTML

            javaMailSender.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
            // You can log this or handle it accordingly
        }
    }

    @Autowired
    private UserRepository userRepository;
    @Override
    public boolean sendPasswordResetLink(String toEmail) {
        User user = userRepository.findByEmail(toEmail);
        if (user == null) {
            return false; // Email not found
        }

        // In real life, generate token and store it with expiry
        String resetLink = "http://localhost:8081/reset-password?email=" + toEmail;

        try {
            MimeMessage message = javaMailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true);

            helper.setFrom("yourgmail.com");
            helper.setTo(toEmail);
            helper.setSubject("Password Reset Request");

            String html = "<h2>Hello " + user.getUserName() + ",</h2>" +
                    "<p>You requested to reset your password.</p>" +
                    "<p>Click the link below to reset it:</p>" +
                    "<p><a href=\"" + resetLink + "\">Reset Password</a></p>" +
                    "<br><p>If you didn't request this, please ignore this email.</p>";

            helper.setText(html, true);
            javaMailSender.send(message);
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
