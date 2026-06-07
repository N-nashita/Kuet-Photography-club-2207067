<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="KUETPhotoClub.Default" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kuet Photography Club</title>
    <link rel="stylesheet" href="Content/site.css">
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Edu+NSW+ACT+Hand+Pre:wght@400..700&family=Edu+SA+Hand:wght@400..700&family=Roboto:ital,wght@0,100..900;1,100..900&display=swap"
          rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <style>
        .ex-btn {
            padding: 10px 28px;
            background: #7e6e53;
            color: white;
            border-radius: 8px;
            text-decoration: none;
            font-size: 1rem;
            font-weight: 600;
            transition: background 0.2s;
            margin-bottom: 25px;
        }
            .ex-btn:hover {
                background: #a89c7d;
                color: white;
            }
    </style>
</head>

<body>
    <header class="nav-bar">
        <div class="header">
            <img class="pp" src="Content/photos/KUET-Logo.png" alt="KUET Logo" />
            <span class="headerText">Khulna University of Engineering and Technology</span>
        </div>
        <button class="hamburger" id="hamburger">
            <span></span>
            <span></span>
            <span></span>
        </button>
        <nav class="nav" id="nav">
            <ul class="nav-links">
                <li><a href="#cover">Home</a></li>
                <li><a href="#about">About</a></li>
                <li><a href="#photo-gallery">Gallery</a></li>
                <li><a href="#gallery">Members</a></li>
                <li><a href="#contact">Contact</a></li>
                <li><a href="#log-in">LogIn</a></li>
            </ul>
        </nav>
    </header>

    <section class="cover" id="cover">
        <div class="heading cover-heading">
            <img class="cover-logo" src="Content/photos/club logo.jpg" alt="KUETPS Logo" />
            <div class="cover-text">
                <h1>Kuet Photographic Society</h1>
                <p class="cover-slogan">Our Photos Speak for Us.</p>
                <button class="join-btn" type="button" onclick="openJoinForm()">Join Now &rarr;</button>
            </div>
        </div>
    </section>

    <!-- Join Form Modal -->
    <div id="joinModal" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5); z-index: 9999; overflow-y: auto;">
        <div style="background-color: white; padding: 40px; border-radius: 12px; width: 90%; max-width: 500px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 24px;">
                <h2 style="margin: 0; color: #333;">Join KUET Photography Club</h2>
                <button onclick="closeJoinForm()" style="background: none; border: none; font-size: 28px; cursor: pointer; color: #666;">×</button>
            </div>

            <form id="joinForm" method="post" onsubmit="submitJoinForm(event)">
                <div style="margin-bottom: 16px;">
                    <label style="display: block; margin-bottom: 6px; color: #333; font-weight: 500;">Full Name</label>
                    <input type="text" name="fullName" placeholder="Your Full Name" required style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 6px; box-sizing: border-box;" />
                </div>

                <div style="margin-bottom: 16px;">
                    <label style="display: block; margin-bottom: 6px; color: #333; font-weight: 500;">Email Address</label>
                    <input type="email" name="email" placeholder="your.email@example.com" required style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 6px; box-sizing: border-box;" />
                </div>

                <div style="margin-bottom: 16px;">
                    <label style="display: block; margin-bottom: 6px; color: #333; font-weight: 500;">Phone Number</label>
                    <input type="tel" name="phone" placeholder="+880 1XX XXX XXXX" required style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 6px; box-sizing: border-box;" />
                </div>

                <div style="margin-bottom: 16px;">
                    <label style="display: block; margin-bottom: 6px; color: #333; font-weight: 500;">Department/Batch</label>
                    <input type="text" name="department" placeholder="e.g., CSE/2022" required style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 6px; box-sizing: border-box;" />
                </div>

                <div style="margin-bottom: 24px;">
                    <label style="display: block; margin-bottom: 6px; color: #333; font-weight: 500;">Why do you want to join?</label>
                    <textarea name="reason" placeholder="Tell us why you're interested in joining..." required style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 6px; box-sizing: border-box; height: 100px; resize: vertical;"></textarea>
                </div>

                <button type="submit" style="width: 100%; padding: 12px; background-color: #7e6e53; color: white; border: none; border-radius: 6px; font-size: 16px; font-weight: 600; cursor: pointer; transition: background-color 0.3s;">
                    Submit Request
                </button>
            </form>
        </div>
    </div>

    <!-- About Section -->
    <section class="about-section" id="about">
        <div class="about-container">
            <h2>About Us</h2>
            <p class="about-mission">
                <strong>Our Mission:</strong> The Kuet Photographic Society is committed to advancing the art and
                science of photography within the university community. We empower our members through education,
                collaboration, and opportunities for creative expression, striving for excellence and innovation in
                every endeavor.
            </p>
            <p class="about-history">
                <strong>Who We Are:</strong> Established in 2010, the Kuet Photographic Society serves as a
                distinguished platform for both emerging and experienced photographers at Khulna University of
                Engineering and Technology. Through curated workshops, exhibitions, competitions, and collaborative
                projects, we foster a vibrant culture of visual storytelling and professional growth.
            </p>
            <div class="about-activities">
                <h3>Our Activities</h3>
                <div class="activities-slideshow" id="activities-slideshow">
                    <asp:Repeater ID="activitiesRepeater" runat="server">
                        <ItemTemplate>
                            <div class="activity-card <%# Container.ItemIndex == 0 ? "active" : "" %>">
                                <img src="<%# Eval("PhotoPath") %>" alt="<%# Eval("Title") %>" class="activity-icon" />
                                <h4><%# Eval("Title") %></h4>
                                <p><%# Eval("Description") %></p>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
            <script>
                // Slideshow for activities
                const activityCards = document.querySelectorAll('#activities-slideshow .activity-card');
                let currentActivity = 0;
                setInterval(() => {
                    activityCards[currentActivity].classList.remove('active');
                    currentActivity = (currentActivity + 1) % activityCards.length;
                    activityCards[currentActivity].classList.add('active');
                }, 3000);
            </script>
        </div>
    </section>

    <!-- Photo Gallery -->
    <section class="infinite-scroll-section" id="photo-gallery">
        <div class="scroll-container">
            <h2>Photo Gallery</h2>
            <div class="infinite-scroll-wrapper">
                <div class="infinite-scroll">
                    <asp:Repeater ID="photosRepeater" runat="server">
                        <ItemTemplate>
                            <div class="scroll-item">
                                <img src="<%# Eval("ImagePath") %>" alt="<%# Eval("Caption") %>" />
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </section>

    <!-- Executive Committee Section -->
    <section class="gallery-section" id="gallery">
        <div class="gallery-container" style="text-align:center;">
            <h2>Meet Our Executive Committee</h2>
            <p style="color:#5d5047; font-size:1.1rem; margin-bottom:24px;">
                Our club is led by a passionate team of photography enthusiasts.
            </p>
            <a href="Committee.aspx" class="ex-btn">
                Meet the Team &rarr;
            </a>
        </div>
    </section>

    <footer class="contact" id="contact">
        <div class="footer-wrapper">
            <div class="footer-content">
                <div class="footer-section">
                    <h3>About Us</h3>
                    <p>
                        Kuet Photographic Society is dedicated to advancing photography within Khulna University of
                        Engineering and Technology.
                    </p>
                </div>
                <div class="footer-section">
                    <h3>Quick Links</h3>
                    <ul>
                        <li><a href="#cover">Home</a></li>
                        <li><a href="#gallery">Gallery</a></li>
                        <li><a href="#about">About</a></li>
                        <li><a href="#contact">Contact</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h3>Contact Info</h3>
                    <p>Email: <a href="mailto:kuetps.official@gmail.com">kuetps.official@gmail.com</a></p>
                    <p>Location: Khulna University of Engineering and Technology</p>
                </div>
                <div class="footer-section">
                    <h3>Follow Us</h3>
                    <div class="social-icons">
                        <a class="fb" href="https://www.facebook.com/kuetps/" target="_blank" aria-label="Facebook">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a class="insta" href="https://www.instagram.com/kuetps.official/" target="_blank"
                           aria-label="Instagram"><i class="fab fa-instagram"></i></a>
                        <a class="mail" href="mailto:kuetps.official@gmail.com" aria-label="Email">
                            <i class="fas fa-envelope"></i>
                        </a>
                        <a class="linkedin" href="https://www.linkedin.com/company/kuet-photographic-society-kuetps"
                           target="_blank" aria-label="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2026 Kuet Photographic Society. All rights reserved.</p>
                <a class="back-to-top" href="#cover">Back to top ↑</a>
            </div>
        </div>
    </footer>

    <script>
        // Hamburger menu
        const hamburger = document.getElementById('hamburger');
        const nav = document.getElementById('nav');

        hamburger.addEventListener('click', () => {
            nav.classList.toggle('active');
            hamburger.classList.toggle('active');
        });

        const navLinks = document.querySelectorAll('.nav-links a');
        navLinks.forEach(link => {
            link.addEventListener('click', () => {
                nav.classList.remove('active');
                hamburger.classList.remove('active');
            });
        });

        // Join form modal
        function openJoinForm() {
            var modal = document.getElementById('joinModal');
            modal.style.display = 'block';
            modal.style.paddingTop = '60px';
        }

        function closeJoinForm() {
            document.getElementById('joinModal').style.display = 'none';
        }

        function submitJoinForm(event) {
            event.preventDefault();
            const formData = new FormData(document.getElementById('joinForm'));
            const data = {
                fullName: formData.get('fullName'),
                email: formData.get('email'),
                phone: formData.get('phone'),
                department: formData.get('department'),
                reason: formData.get('reason')
            };

            // Send to server via AJAX
            fetch('JoinRequest.aspx', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(data)
            }).then(response => response.json())
            .then(result => {
                if (result.success) {
                    alert('Your request has been submitted successfully!');
                    closeJoinForm();
                    document.getElementById('joinForm').reset();
                } else {
                    alert('Error submitting request. Please try again.');
                }
            }).catch(error => {
                console.error('Error:', error);
                alert('An error occurred. Please try again.');
            });
        }

        // Close modal when clicking outside
        document.getElementById('joinModal').addEventListener('click', function (event) {
            if (event.target === this) {
                closeJoinForm();
            }
        });
    </script>

</body>

</html>
