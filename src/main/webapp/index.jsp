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
    <nav class="navbar">
        <div class="nav-container">
            <a href="index.jsp" class="logo">
                <img src="images/logo.png" alt="FastTrack Logo">
                <!-- <span>FastTrack Courier</span>-->
            </a>
            <div class="nav-links">
                <a href="track1.jsp">Track Package</a>
                <a href="userlogin.jsp">Book Shipment</a>
                <a href="#services">Services</a>
                <a href="#about">About Us</a>
                <a href="contactUs.jsp">Contact</a>
                <a href="userlogin.jsp" class="btn-login">Login</a>
                <a href="signup.jsp" class="btn-signup">Sign Up</a>
            </div>
            <div class="mobile-menu">
                <i class="fas fa-bars"></i>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero" style="background-image:url(https://picsum.photos/2000/1000);filter:brightness(100%);">
        <div class="hero-content">
            <h1>Fast & Reliable Courier Services</h1>
            <p>Delivering your packages safely and on time, anywhere in the world</p>
            <div class="hero-buttons">
                <a href="signup.jsp" class="btn-primary">Get Started</a>
                <a href="#services" class="btn-secondary">Learn More</a>
            </div>
        </div>
    </section>

    <!-- Tracking Section -->
    <section class="tracking-section">
        <div class="container">
            <h2>Track Your Shipment</h2>
            <p>Enter your tracking number to get real-time updates</p><br>	
            <a href="track1.jsp" class="btn-primary">Track Now</a>
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
    <br><br>

    <!-- About Section -->
    <section class="about" id="about">
        <div class="container">
        <h1><b>About Us</b></h1>
            <div class="about-content">
            <br><br>
               <p>
            At Swift Courier Services, we are committed to delivering your packages with unmatched reliability, speed, and care. 
            Whether you’re sending important documents, parcels, or personal items, our cutting-edge logistics network ensures seamless 
            delivery from pickup to destination. Experience hassle-free courier services designed to meet all your needs.
        </p>
        <br>
        <div class="about-us">
            <h2>What Makes Us Different?</h2>
            <p>
                We believe that delivering a package is more than just transportation—it’s about trust, efficiency, and excellence. 
                From real-time tracking to secure handling, we focus on providing a comprehensive experience that puts you first. 
                Our services are tailored to individuals and businesses, making us your go-to solution for all shipping requirements.
            </p>
        </div><br>
        
        <div >
            <h2>Our Key Features</h2>
            <ul>
                <li>
                    <strong>Real-Time Tracking:</strong> Monitor your shipments in real time with our advanced tracking system, providing 
                    transparency and peace of mind.
                </li>
                <li>
                    <strong>Fast and Reliable Delivery:</strong> With optimized routes and an efficient logistics network, we ensure 
                    your packages reach their destination on time.
                </li>
                <li>
                    <strong>Secure Package Handling:</strong> Your packages are our priority. We handle every shipment with the utmost care 
                    to guarantee safe delivery.
                </li>
                <li>
                    <strong>24/7 Customer Support:</strong> Our dedicated team is available round the clock to assist you with any queries 
                    or concerns.
                </li>
                <li>
                    <strong>Flexible Shipping Options:</strong> Choose from same-day, next-day, or standard delivery services to meet your specific needs.
                </li>
            </ul>
        </div><br><br><br>

        <div class="how-it-works">
            <h2>How It Works</h2>
            <ol>
                <li><strong>Step 1:</strong> Book your shipment online or at any of our service centers.</li>
                <li><strong>Step 2:</strong> Track your shipment in real time using our tracking tools.</li>
                <li><strong>Step 3:</strong> Receive updates at every step until your package is safely delivered.</li>
            </ol>
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
                    <li><a href="track1.jsp">Track Shipment</a></li>
                    <li><a href="#about">About Us</a></li>
                    <li><a href="#contact">Contact</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Services</h3>
                <ul>
                    <li>Air Freight</li>
                    <li>Ocean Freight</li>
                    <li>Land Transport</li>
                    <li>Warehousing</li>
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