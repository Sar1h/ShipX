package admin.model;

public class QuestionsData {
    private int id;
    private String name;
    private String email;
    private String subject;
    private String message;
    private String reply;
    private String status;
    private String timestamp;

    public QuestionsData(int id, String name, String email, String subject, 
                        String message, String reply, String status, String timestamp) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.subject = subject;
        this.message = message;
        this.reply = reply;
        this.status = status;
        this.timestamp = timestamp;
    }

    // Getters and Setters
    public int getId() { return id; }
    public String getName() { return name; }
    public String getEmail() { return email; }
    public String getSubject() { return subject; }
    public String getMessage() { return message; }
    public String getReply() { return reply; }
    public String getStatus() { return status; }
    public String getTimestamp() { return timestamp; }
} 