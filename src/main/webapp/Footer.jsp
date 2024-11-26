<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Footer</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        footer {
            background-color: #1a1a1a;
            color: #fff;
            padding: 40px 0;
            margin-top: 50px;
        }

        .footer-content {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 30px;
            padding: 0 20px;
        }

        .footer-section h3 {
            color: #fff;
            margin-bottom: 20px;
            font-size: 18px;
        }

        .footer-section ul {
            list-style: none;
            padding: 0;
        }

        .footer-section ul li {
            margin-bottom: 10px;
        }

        .footer-section ul li a {
            color: #999;
            text-decoration: none;
            transition: color 0.3s;
        }

        .footer-section ul li a:hover {
            color: #007bff;
        }

        .footer-section ul li i {
            margin-right: 10px;
            color: #007bff;
        }

        .newsletter-form {
            margin-top: 20px;
        }

        .newsletter-form input {
            padding: 8px;
            border: none;
            border-radius: 4px;
            margin-right: 5px;
            width: 200px;
        }

        .social-links {
            margin-top: 20px;
        }

        .social-links a {
            color: #fff;
            margin-right: 15px;
            font-size: 18px;
            transition: color 0.3s;
        }

        .social-links a:hover {
            color: #007bff;
        }

        .footer-bottom {
            text-align: center;
            margin-top: 40px;
            padding-top: 20px;
            border-top: 1px solid #333;
        }

        .footer-bottom p {
            color: #999;
            margin: 0;
        }
    </style>
</head>
<body>
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
</body>
</html> 