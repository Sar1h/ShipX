package admin.model;

public class CustQuestionData {
    private int id;
    private String name;
    private String email;
    private String subject;
    private String message;
    private String timestamp;

    public CustQuestionData(int id, String name, String email, String subject, String message, String timestamp) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.subject = subject;
        this.message = message;
        this.timestamp = timestamp;
    }

    // Getters
    public int getId() { return id; }
    public String getName() { return name; }
    public String getEmail() { return email; }
    public String getSubject() { return subject; }
    public String getMessage() { return message; }
    public String getTimestamp() { return timestamp; }
} 