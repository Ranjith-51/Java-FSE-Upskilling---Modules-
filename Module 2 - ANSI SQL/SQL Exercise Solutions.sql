CREATE DATABASE community_event_portal;
USE community_event_portal;

-- Table: Users
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    city VARCHAR(100) NOT NULL,
    registration_date DATE NOT NULL
);

-- Table: Events
CREATE TABLE Events (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    city VARCHAR(100) NOT NULL,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    status ENUM('upcoming', 'completed', 'cancelled'),
    organizer_id INT,
    FOREIGN KEY (organizer_id) REFERENCES Users(user_id)
);

-- Table: Sessions
CREATE TABLE Sessions (
    session_id INT PRIMARY KEY AUTO_INCREMENT,
    event_id INT,
    title VARCHAR(200) NOT NULL,
    speaker_name VARCHAR(100) NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

-- Table: Registrations
CREATE TABLE Registrations (
    registration_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    event_id INT,
    registration_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

-- Table: Feedback
CREATE TABLE Feedback (
    feedback_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    event_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comments TEXT,
    feedback_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

-- Table: Resources
CREATE TABLE Resources (
    resource_id INT PRIMARY KEY AUTO_INCREMENT,
    event_id INT,
    resource_type ENUM('pdf', 'image', 'link'),
    resource_url VARCHAR(255) NOT NULL,
    uploaded_at DATETIME NOT NULL,
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);
-- USERS
INSERT INTO Users (user_id, full_name, email, city, registration_date) VALUES
(1, 'Alice Johnson', 'alice@example.com', 'New York', '2025-06-20'),
(2, 'Bob Smith', 'bob@example.com', 'Los Angeles', '2025-06-15'),
(3, 'Charlie Lee', 'charlie@example.com', 'Chicago', '2025-06-10'),
(4, 'Diana King', 'diana@example.com', 'New York', '2025-03-20'),
(5, 'Ethan Hunt', 'ethan@example.com', 'Los Angeles', '2025-06-25'),
(6, 'Grace Kim', 'grace@example.com', 'San Francisco', '2025-07-01'),
(7, 'Ivan Drew', 'ivan@example.com', 'New York', '2025-06-30'); -- unregistered user

-- EVENTS
INSERT INTO Events (event_id, title, description, city, start_date, end_date, status, organizer_id) VALUES
(1, 'Tech Innovators Meetup', 'Tech talks and networking.', 'New York', '2025-07-10 10:00:00', '2025-07-10 16:00:00', 'upcoming', 1),
(2, 'AI & ML Conference', 'AI breakthroughs.', 'Chicago', '2025-06-15 09:00:00', '2025-06-15 17:00:00', 'completed', 3),
(3, 'Frontend Bootcamp', 'Frontend dev crash course.', 'Los Angeles', '2025-07-05 10:00:00', '2025-07-07 16:00:00', 'upcoming', 2),
(4, 'HealthTech Expo', 'Healthcare meets tech.', 'Chicago', '2025-07-15 09:00:00', '2025-07-16 16:00:00', 'upcoming', 4);

-- SESSIONS
INSERT INTO Sessions (session_id, event_id, title, speaker_name, start_time, end_time) VALUES
(1, 1, 'Opening Keynote', 'Alice Johnson', '2025-07-10 10:00:00', '2025-07-10 11:00:00'),
(2, 1, 'Future of Web', 'Bob Smith', '2025-07-10 11:15:00', '2025-07-10 12:15:00'),
(3, 2, 'AI in Medicine', 'Charlie Lee', '2025-06-15 09:30:00', '2025-06-15 11:00:00'),
(4, 3, 'HTML & CSS', 'Bob Smith', '2025-07-05 10:00:00', '2025-07-05 12:00:00'),
(5, 3, 'JavaScript Basics', 'Alice Johnson', '2025-07-05 11:30:00', '2025-07-05 13:00:00'),
(6, 4, 'Telemedicine Panel', 'Grace Kim', '2025-07-15 10:00:00', '2025-07-15 12:00:00');

-- REGISTRATIONS
INSERT INTO Registrations (registration_id, user_id, event_id, registration_date) VALUES
(1, 1, 1, '2025-07-01'),
(2, 2, 1, '2025-07-02'),
(3, 3, 2, '2025-06-01'),
(4, 4, 2, '2025-03-28'),
(5, 5, 3, '2025-06-28'),
(6, 1, 4, '2025-07-03'),
(7, 2, 4, '2025-07-03');

-- FEEDBACK
INSERT INTO Feedback (feedback_id, user_id, event_id, rating, comments, feedback_date) VALUES
(1, 1, 1, 2, 'Needs better structure.', '2025-07-02'),
(2, 2, 1, 5, 'Fantastic!', '2025-07-03'),
(3, 3, 2, 4, 'Insightful.', '2025-06-16'),
(4, 4, 2, 5, 'Loved it.', '2025-06-17'),
(5, 1, 2, 5, 'Engaging.', '2025-06-18'),
(6, 2, 2, 5, 'Excellent.', '2025-06-19'),
(7, 3, 2, 5, 'Top notch.', '2025-06-20'),
(8, 4, 2, 5, 'Brilliant.', '2025-06-21'),
(9, 5, 2, 5, 'Very clear.', '2025-06-22'),
(10, 1, 2, 5, 'Super helpful.', '2025-06-23'),
(11, 2, 2, 5, 'Amazing insights.', '2025-06-24');

-- RESOURCES
INSERT INTO Resources (resource_id, event_id, resource_type, resource_url, uploaded_at) VALUES
(1, 1, 'pdf', 'https://portal.com/tech-agenda.pdf', '2025-07-01 10:00:00'),
(2, 2, 'image', 'https://portal.com/ai-image.jpg', '2025-06-10 09:00:00'),
(3, 3, 'link', 'https://portal.com/frontend-links', '2025-07-03 15:00:00');

-- EX 1: User Upcoming Events
SELECT u.full_name, e.title, e.city, e.start_date
FROM Users u
JOIN Registrations r ON u.user_id = r.user_id
JOIN Events e ON r.event_id = e.event_id
WHERE e.status = 'upcoming' AND u.city = e.city
ORDER BY e.start_date;

-- EX 2: Top Rated Events (min 10 feedbacks)
SELECT e.title, AVG(f.rating) AS avg_rating, COUNT(*) AS feedback_count
FROM Feedback f
JOIN Events e ON f.event_id = e.event_id
GROUP BY e.event_id
HAVING COUNT(*) >= 10
ORDER BY avg_rating DESC;

-- EX 3: Inactive Users (last 90 days)
SELECT u.full_name, u.email
FROM Users u
LEFT JOIN Registrations r ON u.user_id = r.user_id
WHERE r.registration_date IS NULL OR r.registration_date < CURDATE() - INTERVAL 90 DAY;

-- EX 4: Peak Session Hours (10 AM to 12 PM)
SELECT e.title, COUNT(*) AS session_count
FROM Sessions s
JOIN Events e ON s.event_id = e.event_id
WHERE TIME(s.start_time) BETWEEN '10:00:00' AND '12:00:00'
GROUP BY e.event_id;

-- EX 5: Most Active Cities
SELECT u.city, COUNT(DISTINCT r.user_id) AS total_users
FROM Users u
JOIN Registrations r ON u.user_id = r.user_id
GROUP BY u.city
ORDER BY total_users DESC
LIMIT 5;

-- EX 6: Event Resource Summary
SELECT e.title,
  SUM(resource_type = 'pdf') AS pdfs,
  SUM(resource_type = 'image') AS images,
  SUM(resource_type = 'link') AS links
FROM Resources r
JOIN Events e ON r.event_id = e.event_id
GROUP BY e.event_id;

-- EX 7: Low Feedback Alerts (rating < 3)
SELECT u.full_name, e.title AS event_name, f.rating, f.comments
FROM Feedback f
JOIN Users u ON f.user_id = u.user_id
JOIN Events e ON f.event_id = e.event_id
WHERE f.rating < 3;

-- EX 8: Sessions per Upcoming Event
SELECT e.title, COUNT(s.session_id) AS session_count
FROM Events e
LEFT JOIN Sessions s ON e.event_id = s.event_id
WHERE e.status = 'upcoming'
GROUP BY e.event_id;

-- EX 9: Organizer Event Summary
SELECT u.full_name AS organizer, 
       COUNT(e.event_id) AS total_events,
       SUM(e.status = 'upcoming') AS upcoming,
       SUM(e.status = 'completed') AS completed,
       SUM(e.status = 'cancelled') AS cancelled
FROM Events e
JOIN Users u ON e.organizer_id = u.user_id
GROUP BY u.user_id;

-- EX 10: Feedback Gap (events with no feedback)
SELECT e.title
FROM Events e
JOIN Registrations r ON e.event_id = r.event_id
LEFT JOIN Feedback f ON r.event_id = f.event_id
WHERE f.feedback_id IS NULL
GROUP BY e.event_id;

-- EX 11: Daily New User Count (last 7 days)
SELECT registration_date, COUNT(*) AS new_users
FROM Users
WHERE registration_date >= CURDATE() - INTERVAL 7 DAY
GROUP BY registration_date;

-- EX 12: Event with Maximum Sessions
SELECT e.title, COUNT(s.session_id) AS total_sessions
FROM Events e
JOIN Sessions s ON e.event_id = s.event_id
GROUP BY e.event_id
ORDER BY total_sessions DESC
LIMIT 1;

-- EX 13: Average Rating per City
SELECT e.city, AVG(f.rating) AS avg_rating
FROM Feedback f
JOIN Events e ON f.event_id = e.event_id
GROUP BY e.city;

-- EX 14: Most Registered Events (Top 3)
SELECT e.title, COUNT(r.registration_id) AS total_regs
FROM Events e
JOIN Registrations r ON e.event_id = r.event_id
GROUP BY e.event_id
ORDER BY total_regs DESC
LIMIT 3;

-- EX 15: Event Session Time Conflict
SELECT s1.event_id, s1.title AS session1, s2.title AS session2
FROM Sessions s1
JOIN Sessions s2 ON s1.event_id = s2.event_id AND s1.session_id < s2.session_id
WHERE s1.start_time < s2.end_time AND s2.start_time < s1.end_time;

-- EX 16: Unregistered Active Users (last 30 days)
SELECT u.full_name, u.email
FROM Users u
LEFT JOIN Registrations r ON u.user_id = r.user_id
WHERE u.registration_date >= CURDATE() - INTERVAL 30 DAY
  AND r.user_id IS NULL;

-- EX 17: Multi-Session Speakers
SELECT speaker_name, COUNT(*) AS session_count
FROM Sessions
GROUP BY speaker_name
HAVING session_count > 1;

-- EX 18: Events with No Resources
SELECT e.title
FROM Events e
LEFT JOIN Resources r ON e.event_id = r.event_id
WHERE r.resource_id IS NULL;

-- EX 19: Completed Events with Feedback Summary
SELECT e.title, COUNT(DISTINCT r.user_id) AS total_registrations, AVG(f.rating) AS avg_rating
FROM Events e
LEFT JOIN Registrations r ON e.event_id = r.event_id
LEFT JOIN Feedback f ON e.event_id = f.event_id
WHERE e.status = 'completed'
GROUP BY e.event_id;

-- EX 20: User Engagement Index
SELECT u.full_name, 
       COUNT(DISTINCT r.event_id) AS events_attended,
       COUNT(DISTINCT f.feedback_id) AS feedbacks_given
FROM Users u
LEFT JOIN Registrations r ON u.user_id = r.user_id
LEFT JOIN Feedback f ON u.user_id = f.user_id
GROUP BY u.user_id;

-- EX 21: Top Feedback Providers
SELECT u.full_name, COUNT(*) AS feedback_count
FROM Feedback f
JOIN Users u ON f.user_id = u.user_id
GROUP BY f.user_id
ORDER BY feedback_count DESC
LIMIT 5;

-- EX 22: Duplicate Registrations Check
SELECT user_id, event_id, COUNT(*) AS reg_count
FROM Registrations
GROUP BY user_id, event_id
HAVING reg_count > 1;

-- EX 23: Registration Trends (last 12 months)
SELECT DATE_FORMAT(registration_date, '%Y-%m') AS month, COUNT(*) AS registrations
FROM Registrations
WHERE registration_date >= CURDATE() - INTERVAL 12 MONTH
GROUP BY month
ORDER BY month;

-- EX 24: Average Session Duration per Event
SELECT e.title, 
       ROUND(AVG(TIMESTAMPDIFF(MINUTE, s.start_time, s.end_time))) AS avg_duration_minutes
FROM Sessions s
JOIN Events e ON s.event_id = e.event_id
GROUP BY e.event_id;

-- EX 25: Events Without Sessions
SELECT e.title
FROM Events e
LEFT JOIN Sessions s ON e.event_id = s.event_id
WHERE s.session_id IS NULL;
