//package tech.stabnashiamunashe.eprocurement.Services;
//
//import org.springframework.stereotype.Service;
//import tech.stabnashiamunashe.eprocurement.Models.Tender;
//
//@Service
//public class EmailService {
//
//    private final JavaMailSender mailSender;
//
//    public void sendTenderReleaseNotification(Tender tender) {
//        SimpleMailMessage message = new SimpleMailMessage();
//        message.setTo("vendor@example.com"); // Replace with actual vendor emails
//        message.setSubject("New Tender Released: " + tender.getTitle());
//        message.setText("A new tender has been released. Please visit the portal to submit your bid.");
//        mailSender.send(message);
//    }
//
//    public void sendTenderClosureNotification(Tender tender) {
//        SimpleMailMessage message = new SimpleMailMessage();
//        message.setTo("vendor@example.com"); // Replace with actual vendor emails
//        message.setSubject("Tender Closed: " + tender.getTitle());
//        message.setText("The tender has been closed. Thank you for your participation.");
//        mailSender.send(message);
//    }
//}