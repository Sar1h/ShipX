<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FastTrack Courier Services</title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <!-- Navigation -->
    <jsp:include page="Header.jsp" />

    <!-- Hero Section -->
    <section class="hero" style="background-image:url(https://picsum.photos/2000/1000);filter:brightness(100%);">
        <div class="hero-content">
            <h1>Fast & Reliable Courier Services</h1>
            <p>Delivering your packages safely and on time, anywhere in the world</p>
            <div class="hero-buttons">
                <a href="#services" class="btn-primary">Get Started</a>
                <a href="#about" class="btn-secondary">Learn More</a>
            </div>
        </div>
    </section>

    <!-- Tracking Section -->
    <section class="tracking-section">
        <div class="container">
            <h2>Track Your Shipment</h2>
            <p>Enter your tracking number to get real-time updates</p><br>	
            <a href="track.jsp" class="btn-primary">Track Now</a>
            <!-- form action="tracking.jsp" method="GET" class="tracking-form">
                <input type="text" name="trackingNumber" placeholder="Enter your tracking number" required>
                <button type="submit" class="btn-primary">Track Now</button>
            </form-->
        </div>
    </section>

    <!-- Services Section -->
    <section class="services" id="services">
        <div class="container">
            <h2>Our Services</h2>
            <div class="services-grid">
                <div class="service-card">
                    <i class="fas fa-plane"></i>
                    <h3>Air Freight</h3>
                    <p>Express worldwide delivery via air with real-time tracking</p>
                </div>
                <div class="service-card">
                    <i class="fas fa-ship"></i>
                    <h3>Ocean Freight</h3>
                    <p>Cost-effective shipping solutions for larger cargo</p>
                </div>
                <div class="service-card">
                    <i class="fas fa-truck"></i>
                    <h3>Land Transport</h3>
                    <p>Reliable door-to-door delivery services</p>
                </div>
                <div class="service-card">
                    <i class="fas fa-warehouse"></i>
                    <h3>Warehousing</h3>
                    <p>Secure storage and inventory management</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="features">
        <div class="container">
            <h2>Why Choose FastTrack</h2>
            <div class="features-grid">
                <div class="feature">
                    <i class="fas fa-clock"></i>
                    <h3>24/7 Support</h3>
                    <p>Round-the-clock customer service to assist you anytime</p>
                </div>
                <div class="feature">
                    <i class="fas fa-shield-alt"></i>
                    <h3>Secure Shipping</h3>
                    <p>Full insurance coverage for your valuable packages</p>
                </div>
                <div class="feature">
                    <i class="fas fa-globe"></i>
                    <h3>Global Network</h3>
                    <p>Extensive network covering over 200 countries</p>
                </div>
                <div class="feature">
                    <i class="fas fa-dollar-sign"></i>
                    <h3>Best Rates</h3>
                    <p>Competitive pricing with no hidden charges</p>
                </div>
            </div>
        </div>
    </section>

    <!-- About Section -->
    <section class="about" id="about">
        <div class="container">
            <div class="about-content">
            <br><br>
                <div class="about-text">
                    <h2>About FastTrack Courier</h2>
                    <p>With over 15 years of experience in the logistics industry, FastTrack Courier has been delivering excellence and reliability to our customers worldwide.</p>
                    <ul class="about-features">
                        <li><i class="fas fa-check"></i> Professional and experienced team</li>
                        <li><i class="fas fa-check"></i> Modern tracking technology</li>
                        <li><i class="fas fa-check"></i> Customized shipping solutions</li>
                        <li><i class="fas fa-check"></i> Environmentally conscious operations</li>
                    </ul>
                    <br>
                    <a href="about" class="btn-primary">Read More</a>
                </div>
                <!-- div class="about-image">
                    <img src="images/about-img.jpg" alt="About FastTrack">
                </div--><br><br>	
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section class="contact" id="contact">
        <div class="container">
            <h2>Contact Us</h2>
            <div class="contact-grid">
                <div class="contact-info">
                    <h3>Get in Touch</h3>
                    <div class="info-item">
                        <i class="fas fa-map-marker-alt"></i>
                        <p>S.P.I.T, Munshi Nagar<br>Andheri, Mumbai 400053</p>
                    </div>
                    <div class="info-item">
                        <i class="fas fa-phone"></i>
                        <p>+91 8767157052</p>
                    </div>
                    <div class="info-item">
                        <i class="fas fa-envelope"></i>
                        <p>info@fasttrack.com</p>
                    </div>
                    <div class="social-links">
                        <a href="#"><i class="fab fa-facebook"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-linkedin"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
                <div class="contact-form">
                    <form action="CustQueriesController" method="post">
                        <div class="form-group">
                            <input type="text" name="name" placeholder="Your Name" required>
                        </div>
                        <div class="form-group">
                            <input type="email" name="email" placeholder="Your Email" required>
                        </div>
                        <div class="form-group">
                            <input type="text" name="subject" placeholder="Subject" required>
                        </div>
                        <div class="form-group">
                            <textarea name="message" placeholder="Your Message" required></textarea>
                        </div>
                        <button type="submit" class="btn-primary">Send Message</button>
                    </form>
                    <br><br>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="footer-content">
            <div class="footer-section">
                <h3>Quick Links</h3>
                <ul>
                    <li><a href="#services">Services</a></li>
                    <li><a href="tracking.jsp">Track Shipment</a></li>
                    <li><a href="#about">About Us</a></li>
                    <li><a href="contactUs.jsp">Contact</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Services</h3>
                <ul>
                    <li><a href="services#air-freight">Air Freight</a></li>
                    <li><a href="services#ocean-freight">Ocean Freight</a></li>
                    <li><a href="services#land-transport">Land Transport</a></li>
                    <li><a href="services#warehousing">Warehousing</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Contact Info</h3>
                <ul>
                    <li><i class="fas fa-phone"></i> +91 8767157052</li>
                    <li><i class="fas fa-envelope"></i> info@fastrack.com</li>
                    <li><i class="fas fa-map-marker-alt"></i> SPIT, Azad Nagar, Mumbai 400058</li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Newsletter</h3>
                <form class="newsletter-form">
                    <input type="email" placeholder="Enter your email">
                    <button type="submit" class="btn-primary">Subscribe</button>
                </form>
                <div class="social-links">
                    <a href="#"><i class="fab fa-facebook"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-linkedin"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2024 FastTrack Courier. All rights reserved.</p>
        </div>
    </footer>

    <!-- JavaScript -->
    <script src="js/main.js"></script>
</body>
</html>