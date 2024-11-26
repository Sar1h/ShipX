package utils;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Random;
import orders.model.SenderData;

public class TrackingNumberGenerator {
    
    public static String generateTrackingNumber(SenderData sender) {
        StringBuilder trackingNumber = new StringBuilder();
        
        // Get current timestamp
        LocalDateTime now = LocalDateTime.now();
        
        // Add first 2 digits based on year
        trackingNumber.append(now.getYear() % 100);
        
        // Add 2 digits based on month and day
        trackingNumber.append(String.format("%02d", now.getMonthValue()));
        
        // Add 2 digits based on sender's initials ASCII values
        if (sender != null && sender.getName() != null && sender.getName().length() > 0) {
            char initial = sender.getName().charAt(0);
            trackingNumber.append(String.format("%02d", (int)initial % 100));
        } else {
            trackingNumber.append("00");
        }
        
        // Add 4 random digits
        Random random = new Random();
        trackingNumber.append(String.format("%04d", random.nextInt(10000)));
        
        return trackingNumber.toString();
    }
} 