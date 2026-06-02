-- ============================================================
-- Milestone 5 — DML Scripts
-- SkillPortal: Skill Exchange & Session Management System
-- Includes: INSERT, UPDATE, DELETE, and Validation Queries
-- ============================================================

SET FOREIGN_KEY_CHECKS = 0;

-- INSERT data into admin
TRUNCATE TABLE admin;
INSERT INTO admin (id, username, password) VALUES ('1', 'admin', 'admin123');

-- INSERT data into skills
TRUNCATE TABLE skills;
INSERT INTO skills (id, skill_name) VALUES ('1', 'Python Programming');
INSERT INTO skills (id, skill_name) VALUES ('2', 'Web Development');
INSERT INTO skills (id, skill_name) VALUES ('3', 'Data Science');
INSERT INTO skills (id, skill_name) VALUES ('4', 'Machine Learning');
INSERT INTO skills (id, skill_name) VALUES ('5', 'UI/UX Design');
INSERT INTO skills (id, skill_name) VALUES ('6', 'JavaScript');
INSERT INTO skills (id, skill_name) VALUES ('7', 'Database Design');
INSERT INTO skills (id, skill_name) VALUES ('8', 'Cybersecurity');
INSERT INTO skills (id, skill_name) VALUES ('9', 'Mobile Development');
INSERT INTO skills (id, skill_name) VALUES ('10', 'Cloud Computing');

-- INSERT data into students
TRUNCATE TABLE students;
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('1', 'Owais Shah', 'owaisshah1@example.com', 'student123', 'default.png', '2024-09-07 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('2', 'Vanessa Gillani', 'vanessagillani2@example.com', 'student123', 'default.png', '2024-11-02 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('3', 'Omar Butt', 'omarbutt3@example.com', 'student123', 'default.png', '2025-03-08 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('4', 'Gina Zaidi', 'ginazaidi4@example.com', 'student123', 'default.png', '2024-09-23 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('5', 'Lubna Rajput', 'lubnarajput5@example.com', 'student123', 'default.png', '2024-09-09 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('6', 'Bilal Raza', 'bilalraza6@example.com', 'student123', 'default.png', '2024-10-26 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('7', 'Omar Warsi', 'omarwarsi7@example.com', 'student123', 'default.png', '2025-02-02 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('8', 'Bilal Abbasi', 'bilalabbasi8@example.com', 'student123', 'default.png', '2025-03-03 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('9', 'Palwasha Zaidi', 'palwashazaidi9@example.com', 'student123', 'default.png', '2024-12-17 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('10', 'Omar Sheikh', 'omarsheikh10@example.com', 'student123', 'default.png', '2025-01-29 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('11', 'Rania Khan', 'raniakhan11@example.com', 'student123', 'default.png', '2025-03-14 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('12', 'Komal Rajput', 'komalrajput12@example.com', 'student123', 'default.png', '2024-11-27 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('13', 'Rania Chaudhry', 'raniachaudhry13@example.com', 'student123', 'default.png', '2024-10-26 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('14', 'Waheed Khattak', 'waheedkhattak14@example.com', 'student123', 'default.png', '2024-09-27 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('15', 'Faraz Niazi', 'farazniazi15@example.com', 'student123', 'default.png', '2024-09-25 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('16', 'Waqas Lodhi', 'waqaslodhi16@example.com', 'student123', 'default.png', '2025-02-02 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('17', 'Qasim Ali', 'qasimali17@example.com', 'student123', 'default.png', '2025-03-06 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('18', 'Dina Zaidi', 'dinazaidi18@example.com', 'student123', 'default.png', '2024-10-02 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('19', 'Yusuf Raza', 'yusufraza19@example.com', 'student123', 'default.png', '2025-01-20 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('20', 'Sara Memon', 'saramemon20@example.com', 'student123', 'default.png', '2025-01-26 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('21', 'Musa Malik', 'musamalik21@example.com', 'student123', 'default.png', '2024-09-12 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('22', 'Qadir Cheema', 'qadircheema22@example.com', 'student123', 'default.png', '2025-03-17 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('23', 'Sara Raza', 'sararaza23@example.com', 'student123', 'default.png', '2024-10-30 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('24', 'Gina Niazi', 'ginaniazi24@example.com', 'student123', 'default.png', '2024-11-11 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('25', 'Dina Memon', 'dinamemon25@example.com', 'student123', 'default.png', '2024-10-12 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('26', 'Xena Lodhi', 'xenalodhi26@example.com', 'student123', 'default.png', '2024-10-24 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('27', 'Qadir Gillani', 'qadirgillani27@example.com', 'student123', 'default.png', '2025-02-27 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('28', 'Ruba Malik', 'rubamalik28@example.com', 'student123', 'default.png', '2025-02-03 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('29', 'Owais Mirza', 'owaismirza29@example.com', 'student123', 'default.png', '2025-01-15 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('30', 'Umair Dogar', 'umairdogar30@example.com', 'student123', 'default.png', '2024-10-12 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('31', 'Dina Niazi', 'dinaniazi31@example.com', 'student123', 'default.png', '2024-11-09 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('32', 'Owais Cheema', 'owaischeema32@example.com', 'student123', 'default.png', '2025-02-23 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('33', 'Usman Hassan', 'usmanhassan33@example.com', 'student123', 'default.png', '2024-10-29 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('34', 'Chloe Javed', 'chloejaved34@example.com', 'student123', 'default.png', '2024-12-12 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('35', 'Rania Malik', 'raniamalik35@example.com', 'student123', 'default.png', '2024-10-25 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('36', 'Kamil Javed', 'kamiljaved36@example.com', 'student123', 'default.png', '2024-10-25 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('37', 'Palwasha Virk', 'palwashavirk37@example.com', 'student123', 'default.png', '2024-12-11 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('38', 'Palwasha Tariq', 'palwashatariq38@example.com', 'student123', 'default.png', '2024-10-07 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('39', 'Qasim Butt', 'qasimbutt39@example.com', 'student123', 'default.png', '2024-11-03 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('40', 'Vanessa Zaidi', 'vanessazaidi40@example.com', 'student123', 'default.png', '2024-11-07 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('41', 'Vanessa Rajput', 'vanessarajput41@example.com', 'student123', 'default.png', '2025-01-28 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('42', 'Zara Memon', 'zaramemon42@example.com', 'student123', 'default.png', '2024-10-27 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('43', 'Isha Warsi', 'ishawarsi43@example.com', 'student123', 'default.png', '2025-01-05 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('44', 'Faraz Hassan', 'farazhassan44@example.com', 'student123', 'default.png', '2024-09-29 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('45', 'Junaid Mirza', 'junaidmirza45@example.com', 'student123', 'default.png', '2025-02-22 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('46', 'Babar Malik', 'babarmalik46@example.com', 'student123', 'default.png', '2024-12-08 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('47', 'Yusuf Tariq', 'yusuftariq47@example.com', 'student123', 'default.png', '2025-01-14 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('48', 'Qasim Khan', 'qasimkhan48@example.com', 'student123', 'default.png', '2025-02-22 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('49', 'Umair Shah', 'umairshah49@example.com', 'student123', 'default.png', '2025-02-22 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('50', 'Imran Gillani', 'imrangillani50@example.com', 'student123', 'default.png', '2025-03-16 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('51', 'Palwasha Khattak', 'palwashakhattak51@example.com', 'student123', 'default.png', '2024-09-29 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('52', 'Sara Rajput', 'sararajput52@example.com', 'student123', 'default.png', '2024-10-11 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('53', 'Dina Khan', 'dinakhan53@example.com', 'student123', 'default.png', '2025-03-04 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('54', 'Umair Farooqi', 'umairfarooqi54@example.com', 'student123', 'default.png', '2025-01-07 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('55', 'Waheed Qureshi', 'waheedqureshi55@example.com', 'student123', 'default.png', '2025-01-08 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('56', 'Gina Iqbal', 'ginaiqbal56@example.com', 'student123', 'default.png', '2025-02-11 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('57', 'Ghazi Abbasi', 'ghaziabbasi57@example.com', 'student123', 'default.png', '2024-10-10 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('58', 'Xena Mirza', 'xenamirza58@example.com', 'student123', 'default.png', '2025-01-17 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('59', 'Yasmin Yousaf', 'yasminyousaf59@example.com', 'student123', 'default.png', '2024-09-01 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('60', 'Maaz Javed', 'maazjaved60@example.com', 'student123', 'default.png', '2025-01-04 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('61', 'Bilal Shah', 'bilalshah61@example.com', 'student123', 'default.png', '2024-12-02 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('62', 'Tariq Dogar', 'tariqdogar62@example.com', 'student123', 'default.png', '2024-09-15 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('63', 'Pari Raza', 'pariraza63@example.com', 'student123', 'default.png', '2024-09-22 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('64', 'Umair Virk', 'umairvirk64@example.com', 'student123', 'default.png', '2024-09-18 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('65', 'Waheed Zaidi', 'waheedzaidi65@example.com', 'student123', 'default.png', '2025-03-16 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('66', 'Isha Butt', 'ishabutt66@example.com', 'student123', 'default.png', '2025-02-16 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('67', 'Ehan Mirza', 'ehanmirza67@example.com', 'student123', 'default.png', '2024-11-07 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('68', 'Hira Rajput', 'hirarajput68@example.com', 'student123', 'default.png', '2024-10-25 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('69', 'Imran Abbasi', 'imranabbasi69@example.com', 'student123', 'default.png', '2025-03-02 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('70', 'Tariq Orakzai', 'tariqorakzai70@example.com', 'student123', 'default.png', '2025-02-19 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('71', 'Palwasha Memon', 'palwashamemon71@example.com', 'student123', 'default.png', '2024-12-22 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('72', 'Hira Sheikh', 'hirasheikh72@example.com', 'student123', 'default.png', '2024-10-01 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('73', 'Pari Cheema', 'paricheema73@example.com', 'student123', 'default.png', '2024-09-17 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('74', 'Vicky Ahmed', 'vickyahmed74@example.com', 'student123', 'default.png', '2025-01-29 00:00:00');
INSERT INTO students (id, full_name, email, password, profile_pic, created_at) VALUES ('75', 'Javeria Cheema', 'javeriacheema75@example.com', 'student123', 'default.png', '2025-01-29 00:00:00');

-- INSERT data into teachers
TRUNCATE TABLE teachers;
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('1', 'Omar Khan', 'tomarkhan1@example.com', 'teacher123', 'Dedicated to making complex topics simple and practical.', '2', '21.45', 'default.png', '2024-09-09 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('2', 'Vicky Malik', 'tvickymalik2@example.com', 'teacher123', 'PhD candidate with strong foundations in theory and practice.', '8', '23.92', 'default.png', '2025-01-03 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('3', 'Nadia Zaidi', 'tnadiazaidi3@example.com', 'teacher123', 'Expert practitioner who loves teaching and mentoring.', '19', '38.81', 'default.png', '2024-11-02 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('4', 'Ehan Pirzada', 'tehanpirzada4@example.com', 'teacher123', 'Researcher and developer bridging academia and industry.', '4', '14.85', 'default.png', '2024-12-20 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('5', 'Waqas Rajput', 'twaqasrajput5@example.com', 'teacher123', 'Published author and workshop facilitator.', '15', '53.19', 'default.png', '2024-09-14 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('6', 'Ruba Siddiqui', 'trubasiddiqui6@example.com', 'teacher123', 'Passionate educator with years of industry experience.', '13', '46.41', 'default.png', '2024-09-28 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('7', 'Pari Abbasi', 'tpariabbasi7@example.com', 'teacher123', 'Researcher and developer bridging academia and industry.', '18', '32.43', 'default.png', '2024-12-18 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('8', 'Layla Gillani', 'tlaylagillani8@example.com', 'teacher123', 'Startup founder sharing real-world technical skills.', '8', '53.72', 'default.png', '2024-09-20 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('9', 'Cyrus Siddiqui', 'tcyrussiddiqui9@example.com', 'teacher123', 'Passionate educator with years of industry experience.', '18', '51.8', 'default.png', '2024-09-24 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('10', 'Waheed Dogar', 'twaheeddogar10@example.com', 'teacher123', 'Expert practitioner who loves teaching and mentoring.', '14', '34.28', 'default.png', '2024-10-25 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('11', 'Zara Hassan', 'tzarahassan11@example.com', 'teacher123', 'Expert practitioner who loves teaching and mentoring.', '13', '10.11', 'default.png', '2024-12-09 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('12', 'Qasim Tariq', 'tqasimtariq12@example.com', 'teacher123', 'Certified professional with a hands-on teaching style.', '14', '44.83', 'default.png', '2025-03-07 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('13', 'Javeria Virk', 'tjaveriavirk13@example.com', 'teacher123', 'Expert practitioner who loves teaching and mentoring.', '7', '24.84', 'default.png', '2024-09-15 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('14', 'Lubna Zaidi', 'tlubnazaidi14@example.com', 'teacher123', 'Passionate educator with years of industry experience.', '11', '12.86', 'default.png', '2025-01-28 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('15', 'Ehan Warsi', 'tehanwarsi15@example.com', 'teacher123', 'PhD candidate with strong foundations in theory and practice.', '6', '12.84', 'default.png', '2025-01-09 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('16', 'Faraz Qureshi', 'tfarazqureshi16@example.com', 'teacher123', 'Dedicated to making complex topics simple and practical.', '20', '13.4', 'default.png', '2024-10-31 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('17', 'Zara Shah', 'tzarashah17@example.com', 'teacher123', 'Award-winning instructor known for clear explanations.', '8', '38.95', 'default.png', '2024-09-11 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('18', 'Noor Raza', 'tnoorraza18@example.com', 'teacher123', 'Published author and workshop facilitator.', '19', '38.26', 'default.png', '2024-11-20 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('19', 'Qasim Baig', 'tqasimbaig19@example.com', 'teacher123', 'Former software engineer now focused on education.', '8', '23.28', 'default.png', '2024-10-04 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('20', 'Qadir Iqbal', 'tqadiriqbal20@example.com', 'teacher123', 'Startup founder sharing real-world technical skills.', '11', '56.45', 'default.png', '2024-09-19 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('21', 'Ahmed Tariq', 'tahmedtariq21@example.com', 'teacher123', 'Award-winning instructor known for clear explanations.', '19', '59.8', 'default.png', '2024-09-19 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('22', 'Imran Baig', 'timranbaig22@example.com', 'teacher123', 'PhD candidate with strong foundations in theory and practice.', '9', '16.62', 'default.png', '2024-11-29 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('23', 'Emma Dogar', 'temmadogar23@example.com', 'teacher123', 'Former software engineer now focused on education.', '10', '17.89', 'default.png', '2025-01-18 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('24', 'Tooba Iqbal', 'ttoobaiqbal24@example.com', 'teacher123', 'Award-winning instructor known for clear explanations.', '17', '10.39', 'default.png', '2025-01-20 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('25', 'Tariq Siddiqui', 'ttariqsiddiqui25@example.com', 'teacher123', 'Expert practitioner who loves teaching and mentoring.', '9', '15.77', 'default.png', '2024-09-28 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('26', 'Vanessa Chaudhry', 'tvanessachaudhry26@example.com', 'teacher123', 'Certified professional with a hands-on teaching style.', '10', '40.24', 'default.png', '2025-03-03 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('27', 'Vicky Baig', 'tvickybaig27@example.com', 'teacher123', 'Certified professional with a hands-on teaching style.', '17', '34.43', 'default.png', '2024-09-14 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('28', 'Faraz Rajput', 'tfarazrajput28@example.com', 'teacher123', 'Certified professional with a hands-on teaching style.', '2', '10.18', 'default.png', '2025-03-17 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('29', 'Isha Farooqi', 'tishafarooqi29@example.com', 'teacher123', 'Expert practitioner who loves teaching and mentoring.', '15', '37.58', 'default.png', '2024-12-19 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('30', 'Javeria Khan', 'tjaveriakhan30@example.com', 'teacher123', 'Dedicated to making complex topics simple and practical.', '3', '57.25', 'default.png', '2025-02-24 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('31', 'Junaid Zaidi', 'tjunaidzaidi31@example.com', 'teacher123', 'Passionate educator with years of industry experience.', '12', '39.13', 'default.png', '2024-10-08 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('32', 'Babar Butt', 'tbabarbutt32@example.com', 'teacher123', 'Passionate educator with years of industry experience.', '10', '28.23', 'default.png', '2024-09-11 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('33', 'Waqas Baig', 'twaqasbaig33@example.com', 'teacher123', 'Researcher and developer bridging academia and industry.', '4', '27.68', 'default.png', '2025-01-22 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('34', 'Amina Chaudhry', 'taminachaudhry34@example.com', 'teacher123', 'Researcher and developer bridging academia and industry.', '6', '58.81', 'default.png', '2024-10-16 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('35', 'Amina Ahmed', 'taminaahmed35@example.com', 'teacher123', 'Expert practitioner who loves teaching and mentoring.', '11', '49.12', 'default.png', '2024-12-15 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('36', 'Qadir Dogar', 'tqadirdogar36@example.com', 'teacher123', 'Certified professional with a hands-on teaching style.', '6', '49.37', 'default.png', '2024-09-28 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('37', 'Yusuf Ali', 'tyusufali37@example.com', 'teacher123', 'Startup founder sharing real-world technical skills.', '8', '19.98', 'default.png', '2024-12-27 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('38', 'Waqas Iqbal', 'twaqasiqbal38@example.com', 'teacher123', 'Researcher and developer bridging academia and industry.', '8', '11.18', 'default.png', '2024-10-20 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('39', 'Zara Khattak', 'tzarakhattak39@example.com', 'teacher123', 'Certified professional with a hands-on teaching style.', '3', '58.34', 'default.png', '2024-11-11 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('40', 'Waqas Warsi', 'twaqaswarsi40@example.com', 'teacher123', 'Published author and workshop facilitator.', '18', '26.56', 'default.png', '2024-09-08 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('41', 'Hassan Farooqi', 'thassanfarooqi41@example.com', 'teacher123', 'Expert practitioner who loves teaching and mentoring.', '19', '58.13', 'default.png', '2024-11-07 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('42', 'Chloe Siddiqui', 'tchloesiddiqui42@example.com', 'teacher123', 'Award-winning instructor known for clear explanations.', '14', '27.28', 'default.png', '2024-11-20 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('43', 'Babar Warsi', 'tbabarwarsi43@example.com', 'teacher123', 'Dedicated to making complex topics simple and practical.', '13', '54.98', 'default.png', '2024-10-19 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('44', 'Qasim Ali', 'tqasimali44@example.com', 'teacher123', 'Published author and workshop facilitator.', '1', '36.0', 'default.png', '2025-01-16 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('45', 'Ruba Abbasi', 'trubaabbasi45@example.com', 'teacher123', 'Former software engineer now focused on education.', '14', '13.5', 'default.png', '2025-02-18 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('46', 'Vicky Javed', 'tvickyjaved46@example.com', 'teacher123', 'Dedicated to making complex topics simple and practical.', '10', '35.36', 'default.png', '2025-02-18 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('47', 'Amina Javed', 'taminajaved47@example.com', 'teacher123', 'Published author and workshop facilitator.', '10', '37.72', 'default.png', '2024-10-20 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('48', 'Amina Niazi', 'taminaniazi48@example.com', 'teacher123', 'Expert practitioner who loves teaching and mentoring.', '20', '38.46', 'default.png', '2024-12-13 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('49', 'Javeria Khan', 'tjaveriakhan49@example.com', 'teacher123', 'Certified professional with a hands-on teaching style.', '10', '20.51', 'default.png', '2025-01-27 00:00:00');
INSERT INTO teachers (id, full_name, email, password, bio, experience, hourly_rate, profile_pic, created_at) VALUES ('50', 'Maaz Javed', 'tmaazjaved50@example.com', 'teacher123', 'Startup founder sharing real-world technical skills.', '15', '32.11', 'default.png', '2024-10-25 00:00:00');

-- INSERT data into teacher_skills
TRUNCATE TABLE teacher_skills;
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('1', '1', '3');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('2', '1', '2');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('3', '1', '5');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('4', '1', '8');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('5', '2', '2');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('6', '2', '4');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('7', '2', '5');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('8', '3', '4');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('9', '3', '3');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('10', '4', '1');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('11', '5', '8');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('12', '5', '2');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('13', '6', '7');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('14', '6', '4');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('15', '6', '10');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('16', '6', '9');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('17', '7', '4');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('18', '7', '3');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('19', '7', '1');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('20', '7', '7');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('21', '8', '7');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('22', '9', '3');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('23', '9', '9');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('24', '10', '1');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('25', '10', '9');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('26', '10', '4');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('27', '10', '7');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('28', '11', '8');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('29', '12', '8');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('30', '12', '9');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('31', '13', '8');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('32', '13', '9');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('33', '13', '7');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('34', '14', '3');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('35', '14', '8');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('36', '14', '9');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('37', '14', '10');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('38', '15', '5');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('39', '15', '9');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('40', '16', '4');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('41', '16', '5');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('42', '16', '8');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('43', '16', '1');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('44', '17', '4');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('45', '17', '5');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('46', '17', '6');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('47', '18', '9');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('48', '18', '2');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('49', '18', '3');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('50', '19', '4');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('51', '19', '7');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('52', '20', '4');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('53', '20', '2');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('54', '21', '7');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('55', '21', '6');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('56', '21', '8');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('57', '21', '4');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('58', '22', '4');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('59', '23', '7');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('60', '23', '1');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('61', '23', '10');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('62', '23', '4');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('63', '24', '6');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('64', '25', '7');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('65', '25', '10');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('66', '25', '4');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('67', '26', '4');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('68', '26', '5');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('69', '26', '7');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('70', '26', '10');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('71', '27', '7');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('72', '28', '7');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('73', '28', '3');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('74', '28', '8');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('75', '29', '10');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('76', '29', '9');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('77', '30', '7');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('78', '31', '2');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('79', '32', '3');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('80', '32', '8');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('81', '32', '10');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('82', '32', '1');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('83', '33', '7');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('84', '33', '6');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('85', '33', '4');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('86', '34', '6');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('87', '34', '10');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('88', '34', '7');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('89', '34', '3');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('90', '35', '5');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('91', '35', '2');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('92', '35', '8');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('93', '35', '1');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('94', '36', '6');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('95', '37', '2');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('96', '37', '1');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('97', '38', '4');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('98', '39', '1');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('99', '39', '3');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('100', '40', '3');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('101', '40', '8');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('102', '41', '10');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('103', '42', '8');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('104', '42', '5');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('105', '43', '3');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('106', '43', '2');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('107', '43', '10');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('108', '44', '2');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('109', '44', '1');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('110', '44', '5');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('111', '45', '7');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('112', '45', '4');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('113', '45', '2');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('114', '45', '5');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('115', '46', '2');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('116', '46', '5');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('117', '47', '10');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('118', '48', '6');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('119', '49', '6');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('120', '49', '2');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('121', '49', '10');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('122', '49', '1');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('123', '50', '8');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('124', '50', '2');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('125', '50', '7');
INSERT INTO teacher_skills (id, teacher_id, skill_id) VALUES ('126', '50', '3');

-- INSERT data into sessions
TRUNCATE TABLE sessions;
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('1', '59', '46', 'Data Science', 'Looking for project guidance.', '2025-03-17 16:30', '120', 'cancelled', '2024-12-21 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('2', '35', '21', 'Machine Learning', NULL, '2025-02-22 12:45', '60', 'cancelled', '2025-01-24 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('3', '49', '22', 'Python Programming', 'Looking for project guidance.', '2025-04-24 10:45', '60', 'completed', '2024-11-06 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('4', '44', '18', 'Cloud Computing', 'Need help debugging my code.', '2025-04-11 16:00', '60', 'pending', '2024-11-01 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('5', '53', '32', 'Mobile Development', NULL, '2025-04-02 15:45', '120', 'pending', '2024-09-24 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('6', '38', '15', 'Database Design', 'Need help debugging my code.', '2025-04-03 12:30', '120', 'completed', '2024-12-18 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('7', '71', '22', 'JavaScript', 'Need help debugging my code.', '2025-05-27 12:30', '90', 'confirmed', '2024-10-01 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('8', '25', '21', 'Web Development', 'Need help debugging my code.', '2025-06-17 10:15', '60', 'cancelled', '2024-11-10 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('9', '68', '39', 'UI/UX Design', 'I need help with basics.', '2025-03-21 12:15', '90', 'confirmed', '2024-11-17 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('10', '2', '46', 'Mobile Development', 'Can we focus on practical examples?', '2025-04-11 08:00', '90', 'confirmed', '2025-02-11 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('11', '63', '7', 'Python Programming', 'Want to improve my portfolio.', '2025-04-13 15:45', '120', 'completed', '2024-10-18 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('12', '7', '17', 'Cybersecurity', 'I need help with basics.', '2025-02-16 14:45', '30', 'pending', '2024-10-09 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('13', '20', '37', 'UI/UX Design', 'I need help with basics.', '2025-04-04 09:45', '60', 'cancelled', '2024-12-25 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('14', '57', '20', 'Cloud Computing', 'Looking for project guidance.', '2025-04-19 17:00', '30', 'confirmed', '2025-02-08 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('15', '28', '17', 'Web Development', 'Can we focus on practical examples?', '2025-04-02 10:00', '60', 'pending', '2024-12-14 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('16', '58', '45', 'Cloud Computing', 'Looking for project guidance.', '2025-04-15 08:15', '90', 'completed', '2025-02-27 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('17', '59', '5', 'Machine Learning', 'I have an upcoming exam.', '2025-06-30 18:15', '120', 'pending', '2025-01-18 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('18', '29', '42', 'Data Science', 'I have an upcoming exam.', '2025-03-08 09:00', '60', 'completed', '2025-01-31 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('19', '73', '19', 'Cybersecurity', 'I need help with basics.', '2025-05-30 12:45', '90', 'cancelled', '2024-12-22 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('20', '11', '39', 'Python Programming', 'Looking for project guidance.', '2025-04-23 17:30', '30', 'pending', '2024-10-29 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('21', '74', '38', 'Python Programming', NULL, '2025-04-09 17:00', '60', 'cancelled', '2025-01-11 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('22', '57', '18', 'Data Science', 'Want to improve my portfolio.', '2025-05-22 18:45', '30', 'cancelled', '2024-11-29 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('23', '53', '22', 'JavaScript', 'Need help debugging my code.', '2025-02-26 10:30', '120', 'cancelled', '2024-11-13 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('24', '52', '49', 'Mobile Development', 'I need help with basics.', '2025-05-27 09:30', '90', 'completed', '2024-09-30 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('25', '52', '33', 'Python Programming', 'Need help debugging my code.', '2025-06-18 15:45', '30', 'confirmed', '2025-01-11 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('26', '47', '40', 'Cybersecurity', 'Need help debugging my code.', '2025-05-24 08:15', '90', 'confirmed', '2024-11-13 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('27', '57', '45', 'Cybersecurity', 'I need help with basics.', '2025-02-07 18:15', '60', 'completed', '2025-01-20 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('28', '2', '36', 'Database Design', 'I need help with basics.', '2025-03-29 09:45', '30', 'confirmed', '2025-01-06 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('29', '38', '33', 'UI/UX Design', 'Looking for project guidance.', '2025-06-03 15:15', '120', 'confirmed', '2024-12-08 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('30', '25', '39', 'Mobile Development', 'Need help debugging my code.', '2025-03-06 09:30', '120', 'completed', '2025-01-08 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('31', '35', '1', 'UI/UX Design', 'Need help debugging my code.', '2025-04-17 17:45', '60', 'cancelled', '2025-01-16 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('32', '62', '23', 'JavaScript', 'Want to improve my portfolio.', '2025-06-19 14:45', '90', 'confirmed', '2025-02-26 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('33', '31', '37', 'Database Design', 'Can we focus on practical examples?', '2025-05-16 08:30', '120', 'cancelled', '2024-12-08 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('34', '20', '32', 'Python Programming', 'Can we focus on practical examples?', '2025-06-08 17:30', '30', 'cancelled', '2024-09-26 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('35', '68', '30', 'Python Programming', 'Need help debugging my code.', '2025-03-08 14:15', '30', 'cancelled', '2025-03-20 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('36', '34', '22', 'Cloud Computing', 'Need help debugging my code.', '2025-05-12 18:00', '90', 'cancelled', '2024-11-21 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('37', '63', '35', 'Python Programming', 'Want to improve my portfolio.', '2025-02-17 11:30', '60', 'pending', '2024-12-21 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('38', '13', '49', 'Web Development', 'Looking for project guidance.', '2025-03-14 12:00', '30', 'completed', '2024-09-15 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('39', '38', '23', 'JavaScript', 'Looking for project guidance.', '2025-03-09 11:45', '60', 'confirmed', '2024-10-15 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('40', '11', '40', 'Database Design', 'Want to improve my portfolio.', '2025-04-02 15:15', '60', 'cancelled', '2025-02-11 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('41', '33', '30', 'UI/UX Design', 'Need help debugging my code.', '2025-02-02 15:30', '60', 'pending', '2024-12-23 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('42', '45', '38', 'UI/UX Design', 'Need help debugging my code.', '2025-05-19 12:45', '90', 'confirmed', '2024-12-08 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('43', '62', '7', 'Machine Learning', 'Looking for project guidance.', '2025-06-26 13:30', '90', 'pending', '2025-02-16 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('44', '51', '18', 'Python Programming', 'Want to improve my portfolio.', '2025-02-12 17:45', '90', 'confirmed', '2025-02-03 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('45', '46', '15', 'Machine Learning', 'Want to improve my portfolio.', '2025-04-05 18:15', '30', 'pending', '2024-11-19 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('46', '57', '3', 'Cloud Computing', 'I have an upcoming exam.', '2025-03-05 09:30', '90', 'cancelled', '2024-10-15 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('47', '26', '9', 'Mobile Development', 'I have an upcoming exam.', '2025-06-15 16:30', '60', 'completed', '2025-01-02 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('48', '38', '48', 'JavaScript', NULL, '2025-03-01 15:00', '60', 'confirmed', '2025-02-21 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('49', '51', '36', 'JavaScript', 'I need help with basics.', '2025-05-12 08:30', '30', 'cancelled', '2024-12-04 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('50', '34', '38', 'Database Design', NULL, '2025-05-06 09:15', '120', 'pending', '2025-02-06 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('51', '72', '21', 'Cloud Computing', 'Can we focus on practical examples?', '2025-02-16 18:45', '90', 'cancelled', '2024-09-30 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('52', '18', '3', 'Python Programming', 'I have an upcoming exam.', '2025-06-06 09:00', '60', 'confirmed', '2024-12-09 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('53', '59', '24', 'Mobile Development', 'Looking for project guidance.', '2025-06-30 10:45', '30', 'cancelled', '2025-02-05 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('54', '53', '18', 'Python Programming', 'Need help debugging my code.', '2025-05-05 11:45', '120', 'confirmed', '2024-12-02 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('55', '13', '44', 'JavaScript', 'Want to improve my portfolio.', '2025-05-02 08:45', '90', 'confirmed', '2024-10-02 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('56', '59', '6', 'Machine Learning', 'Need help debugging my code.', '2025-02-05 08:30', '60', 'confirmed', '2025-01-23 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('57', '27', '5', 'Mobile Development', 'Can we focus on practical examples?', '2025-06-30 11:15', '90', 'confirmed', '2025-01-31 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('58', '1', '18', 'Data Science', 'Can we focus on practical examples?', '2025-06-18 12:15', '30', 'pending', '2024-10-04 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('59', '2', '23', 'Machine Learning', 'Want to improve my portfolio.', '2025-04-23 08:15', '90', 'pending', '2024-10-03 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('60', '54', '34', 'Web Development', 'Need help debugging my code.', '2025-02-16 15:45', '90', 'pending', '2024-12-25 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('61', '65', '15', 'Cloud Computing', 'I need help with basics.', '2025-06-13 12:45', '30', 'pending', '2025-01-01 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('62', '52', '28', 'Web Development', 'Looking for project guidance.', '2025-05-24 09:00', '90', 'confirmed', '2024-09-17 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('63', '17', '18', 'Cloud Computing', 'Need help debugging my code.', '2025-06-29 16:30', '120', 'completed', '2024-12-26 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('64', '65', '39', 'Database Design', 'I need help with basics.', '2025-03-01 18:15', '120', 'cancelled', '2024-10-29 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('65', '53', '22', 'Cybersecurity', 'Looking for project guidance.', '2025-05-17 09:30', '120', 'completed', '2025-02-18 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('66', '33', '24', 'Data Science', 'Need help debugging my code.', '2025-06-01 09:00', '30', 'pending', '2024-12-20 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('67', '13', '48', 'JavaScript', NULL, '2025-03-05 16:00', '90', 'pending', '2024-12-15 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('68', '46', '43', 'Database Design', NULL, '2025-02-13 12:30', '90', 'pending', '2025-01-26 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('69', '65', '14', 'Data Science', 'Need help debugging my code.', '2025-06-03 11:00', '90', 'completed', '2024-09-30 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('70', '36', '37', 'Machine Learning', NULL, '2025-05-20 16:00', '90', 'pending', '2024-10-17 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('71', '35', '45', 'UI/UX Design', 'I have an upcoming exam.', '2025-04-30 08:15', '60', 'cancelled', '2024-09-18 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('72', '19', '48', 'Python Programming', 'I need help with basics.', '2025-06-15 11:45', '120', 'cancelled', '2024-11-27 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('73', '21', '24', 'UI/UX Design', 'Need help debugging my code.', '2025-04-24 17:00', '30', 'confirmed', '2024-10-11 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('74', '7', '44', 'Web Development', 'I have an upcoming exam.', '2025-05-24 18:45', '120', 'cancelled', '2024-12-16 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('75', '35', '14', 'Mobile Development', 'I need help with basics.', '2025-04-29 14:00', '90', 'cancelled', '2025-01-13 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('76', '40', '3', 'Machine Learning', 'Looking for project guidance.', '2025-02-14 08:15', '90', 'confirmed', '2025-03-16 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('77', '18', '49', 'UI/UX Design', 'I have an upcoming exam.', '2025-04-24 09:00', '120', 'cancelled', '2024-10-15 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('78', '17', '25', 'Mobile Development', 'Need help debugging my code.', '2025-03-30 16:30', '30', 'cancelled', '2025-03-09 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('79', '6', '28', 'Python Programming', 'Looking for project guidance.', '2025-02-19 13:45', '120', 'cancelled', '2024-11-14 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('80', '15', '26', 'Python Programming', 'I have an upcoming exam.', '2025-03-15 17:45', '90', 'pending', '2024-12-21 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('81', '14', '16', 'Database Design', 'Want to improve my portfolio.', '2025-05-13 16:00', '120', 'completed', '2025-03-10 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('82', '44', '15', 'JavaScript', NULL, '2025-03-15 09:00', '60', 'completed', '2024-11-29 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('83', '19', '16', 'Web Development', 'Can we focus on practical examples?', '2025-04-06 11:15', '60', 'pending', '2024-10-16 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('84', '64', '30', 'Cloud Computing', NULL, '2025-06-28 15:30', '90', 'confirmed', '2024-12-22 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('85', '9', '31', 'Cybersecurity', 'Need help debugging my code.', '2025-04-18 12:00', '90', 'pending', '2024-11-19 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('86', '60', '29', 'Python Programming', 'I need help with basics.', '2025-05-05 12:00', '30', 'cancelled', '2024-12-28 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('87', '75', '36', 'Python Programming', 'Looking for project guidance.', '2025-06-26 18:15', '90', 'cancelled', '2025-01-07 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('88', '20', '4', 'Cybersecurity', 'I need help with basics.', '2025-04-28 09:15', '30', 'confirmed', '2025-03-01 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('89', '57', '29', 'Mobile Development', 'Want to improve my portfolio.', '2025-03-12 13:30', '90', 'cancelled', '2024-12-14 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('90', '44', '44', 'Cloud Computing', 'I need help with basics.', '2025-04-26 09:30', '30', 'cancelled', '2024-11-12 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('91', '33', '47', 'Cloud Computing', NULL, '2025-03-10 13:00', '60', 'completed', '2024-11-19 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('92', '51', '9', 'Cloud Computing', 'Need help debugging my code.', '2025-02-21 12:45', '90', 'confirmed', '2025-02-19 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('93', '68', '6', 'Database Design', 'Want to improve my portfolio.', '2025-05-03 08:30', '90', 'confirmed', '2024-10-25 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('94', '44', '50', 'Cybersecurity', 'Can we focus on practical examples?', '2025-03-29 10:15', '30', 'completed', '2024-09-26 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('95', '65', '50', 'Mobile Development', NULL, '2025-06-14 08:30', '60', 'cancelled', '2024-10-10 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('96', '21', '12', 'Cloud Computing', NULL, '2025-03-14 15:00', '120', 'completed', '2025-02-21 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('97', '31', '29', 'Cloud Computing', 'I have an upcoming exam.', '2025-05-25 11:15', '90', 'cancelled', '2024-10-20 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('98', '48', '44', 'Cloud Computing', 'Looking for project guidance.', '2025-05-29 12:45', '120', 'confirmed', '2024-10-22 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('99', '18', '17', 'Python Programming', 'Need help debugging my code.', '2025-06-03 13:00', '30', 'completed', '2024-09-22 00:00:00');
INSERT INTO sessions (id, student_id, teacher_id, skill, message, scheduled_at, duration, status, created_at) VALUES ('100', '21', '18', 'Cybersecurity', 'Want to improve my portfolio.', '2025-03-09 14:00', '60', 'cancelled', '2024-11-29 00:00:00');

-- INSERT data into ratings
TRUNCATE TABLE ratings;
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('1', '27', '4', '1', 'Session was okay, nothing special.', '2025-01-07 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('2', '16', '48', '4', 'Explained clearly and patiently.', '2024-12-05 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('3', '2', '29', '3', 'Explained clearly and patiently.', '2025-03-02 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('4', '10', '43', '2', 'Great session, very helpful!', '2024-11-13 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('5', '45', '61', '2', 'Loved the hands-on approach.', '2024-12-24 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('6', '6', '1', '1', 'Good but needs more examples.', '2024-10-26 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('7', '36', '20', '5', NULL, '2024-12-18 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('8', '50', '15', '3', 'Excellent teacher, highly recommend.', '2024-11-17 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('9', '4', '16', '2', 'Session was okay, nothing special.', '2025-02-11 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('10', '5', '59', '1', 'Loved the hands-on approach.', '2025-01-31 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('11', '2', '69', '5', NULL, '2024-11-01 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('12', '19', '19', '4', 'Great session, very helpful!', '2025-02-05 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('13', '16', '46', '5', 'Session was okay, nothing special.', '2024-10-18 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('14', '34', '11', '3', 'Explained clearly and patiently.', '2025-01-13 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('15', '33', '70', '5', NULL, '2024-09-06 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('16', '31', '50', '1', 'Session was okay, nothing special.', '2024-12-05 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('17', '48', '33', '1', 'Very knowledgeable and professional.', '2024-09-18 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('18', '16', '45', '1', NULL, '2025-03-08 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('19', '9', '43', '1', 'Very knowledgeable and professional.', '2025-01-18 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('20', '42', '44', '2', 'Loved the hands-on approach.', '2025-02-26 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('21', '41', '62', '2', 'Could improve on time management.', '2024-09-17 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('22', '3', '59', '3', 'Excellent teacher, highly recommend.', '2024-09-12 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('23', '3', '26', '3', 'Good but needs more examples.', '2025-01-10 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('24', '35', '51', '4', 'Good but needs more examples.', '2024-09-10 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('25', '19', '25', '3', 'Great session, very helpful!', '2025-02-15 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('26', '18', '43', '1', 'Very knowledgeable and professional.', '2024-12-21 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('27', '48', '52', '4', 'Session was okay, nothing special.', '2024-11-26 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('28', '32', '24', '4', 'Very knowledgeable and professional.', '2025-01-11 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('29', '6', '35', '4', 'Explained clearly and patiently.', '2024-12-20 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('30', '35', '24', '3', 'Very knowledgeable and professional.', '2024-09-27 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('31', '21', '11', '3', 'Good but needs more examples.', '2024-12-24 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('32', '11', '55', '4', 'Very knowledgeable and professional.', '2024-12-24 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('33', '47', '6', '3', NULL, '2024-12-21 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('34', '41', '36', '1', 'Explained clearly and patiently.', '2025-02-19 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('35', '24', '52', '5', 'Could improve on time management.', '2024-09-08 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('36', '39', '19', '4', 'Great session, very helpful!', '2024-10-03 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('37', '16', '9', '3', 'Very knowledgeable and professional.', '2024-12-08 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('38', '3', '73', '5', 'Could improve on time management.', '2025-02-21 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('39', '24', '58', '3', 'Loved the hands-on approach.', '2025-03-15 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('40', '37', '10', '2', NULL, '2024-12-03 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('41', '21', '51', '3', 'Excellent teacher, highly recommend.', '2024-09-30 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('42', '48', '4', '2', 'Loved the hands-on approach.', '2025-01-11 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('43', '36', '50', '1', 'Good but needs more examples.', '2025-03-18 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('44', '46', '34', '4', 'Excellent teacher, highly recommend.', '2025-02-04 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('45', '45', '37', '4', 'Excellent teacher, highly recommend.', '2024-10-02 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('46', '5', '18', '4', 'Could improve on time management.', '2025-03-02 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('47', '6', '57', '3', 'Very knowledgeable and professional.', '2025-03-01 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('48', '36', '9', '5', 'Good but needs more examples.', '2024-11-16 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('49', '46', '21', '2', 'Very knowledgeable and professional.', '2025-01-09 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('50', '8', '29', '2', 'Could improve on time management.', '2024-10-31 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('51', '2', '64', '3', NULL, '2025-01-25 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('52', '30', '48', '5', 'Could improve on time management.', '2025-02-04 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('53', '5', '12', '3', 'Session was okay, nothing special.', '2025-03-03 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('54', '34', '62', '4', 'Session was okay, nothing special.', '2025-01-26 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('55', '9', '10', '3', 'Explained clearly and patiently.', '2024-12-25 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('56', '44', '60', '5', 'Very knowledgeable and professional.', '2024-10-03 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('57', '41', '71', '5', 'Could improve on time management.', '2025-03-16 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('58', '28', '17', '5', 'Great session, very helpful!', '2024-10-02 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('59', '10', '67', '3', 'Could improve on time management.', '2024-10-12 00:00:00');
INSERT INTO ratings (id, teacher_id, student_id, stars, comment, created_at) VALUES ('60', '46', '42', '2', 'Very knowledgeable and professional.', '2025-01-11 00:00:00');

-- INSERT data into messages
TRUNCATE TABLE messages;
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('1', 'teacher_6', 'student_37', 'The session was very helpful, thanks.', '2024-11-10 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('2', 'teacher_41', 'student_17', 'The session was very helpful, thanks.', '2024-09-24 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('3', 'teacher_42', 'student_65', 'I am having trouble with this topic.', '2024-10-10 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('4', 'student_22', 'teacher_43', 'I am having trouble with this topic.', '2024-11-26 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('5', 'student_73', 'teacher_3', 'Can we reschedule our session?', '2024-09-21 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('6', 'student_6', 'teacher_42', 'Please send me the notes from today.', '2025-02-14 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('7', 'student_27', 'teacher_50', 'I am having trouble with this topic.', '2025-02-11 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('8', 'student_4', 'teacher_32', 'The session was very helpful, thanks.', '2024-11-14 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('9', 'teacher_31', 'student_39', 'I completed the task you assigned.', '2024-11-16 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('10', 'student_59', 'teacher_5', 'I have a question about the assignment.', '2024-12-22 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('11', 'teacher_31', 'student_54', 'Is Thursday at 3pm available?', '2025-02-03 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('12', 'student_19', 'teacher_21', 'Is Thursday at 3pm available?', '2025-03-07 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('13', 'teacher_26', 'student_45', 'Is Thursday at 3pm available?', '2025-01-10 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('14', 'teacher_7', 'student_72', 'Can you recommend any resources?', '2024-10-02 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('15', 'teacher_29', 'student_35', 'Thank you for the session today!', '2024-09-13 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('16', 'student_38', 'teacher_25', 'I completed the task you assigned.', '2024-11-03 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('17', 'student_21', 'teacher_21', 'Is Thursday at 3pm available?', '2024-10-19 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('18', 'student_21', 'teacher_32', 'Can you recommend any resources?', '2025-01-06 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('19', 'teacher_32', 'student_40', 'I completed the task you assigned.', '2025-01-08 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('20', 'teacher_16', 'student_59', 'Is Thursday at 3pm available?', '2024-09-13 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('21', 'teacher_19', 'student_7', 'Can you recommend any resources?', '2024-11-13 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('22', 'student_69', 'teacher_1', 'I completed the task you assigned.', '2024-10-05 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('23', 'teacher_47', 'student_34', 'I completed the task you assigned.', '2024-12-03 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('24', 'teacher_26', 'student_6', 'The session was very helpful, thanks.', '2024-10-20 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('25', 'teacher_36', 'student_47', 'I completed the task you assigned.', '2025-01-08 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('26', 'student_58', 'teacher_49', 'I am having trouble with this topic.', '2025-02-22 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('27', 'student_16', 'teacher_9', 'I completed the task you assigned.', '2024-12-05 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('28', 'student_44', 'teacher_36', 'I have a question about the assignment.', '2024-10-21 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('29', 'student_66', 'teacher_26', 'Can we reschedule our session?', '2024-09-10 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('30', 'teacher_46', 'student_18', 'Can you recommend any resources?', '2025-01-11 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('31', 'student_59', 'teacher_10', 'The session was very helpful, thanks.', '2024-10-06 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('32', 'teacher_40', 'student_42', 'I completed the task you assigned.', '2025-02-05 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('33', 'teacher_38', 'student_39', 'The session was very helpful, thanks.', '2025-01-15 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('34', 'student_63', 'teacher_46', 'Can you recommend any resources?', '2024-09-05 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('35', 'student_48', 'teacher_22', 'I completed the task you assigned.', '2025-01-28 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('36', 'student_40', 'teacher_47', 'Can we reschedule our session?', '2025-01-31 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('37', 'student_61', 'teacher_17', 'I am having trouble with this topic.', '2025-01-26 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('38', 'teacher_47', 'student_30', 'Can you recommend any resources?', '2024-10-14 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('39', 'student_68', 'teacher_41', 'I completed the task you assigned.', '2024-10-08 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('40', 'student_32', 'teacher_3', 'Thank you for the session today!', '2024-10-19 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('41', 'teacher_29', 'student_3', 'I have a question about the assignment.', '2024-12-15 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('42', 'student_27', 'teacher_27', 'I am having trouble with this topic.', '2024-12-30 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('43', 'teacher_46', 'student_8', 'Looking forward to our next meeting.', '2025-01-22 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('44', 'teacher_43', 'student_42', 'I completed the task you assigned.', '2024-11-20 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('45', 'student_23', 'teacher_30', 'Is Thursday at 3pm available?', '2025-01-18 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('46', 'student_46', 'teacher_44', 'Please send me the notes from today.', '2025-02-04 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('47', 'student_62', 'teacher_13', 'Please send me the notes from today.', '2025-01-21 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('48', 'student_39', 'teacher_15', 'Please send me the notes from today.', '2025-03-17 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('49', 'teacher_46', 'student_37', 'Can you recommend any resources?', '2024-11-21 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('50', 'student_62', 'teacher_23', 'Please send me the notes from today.', '2024-11-13 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('51', 'student_16', 'teacher_37', 'I completed the task you assigned.', '2024-12-11 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('52', 'student_45', 'teacher_50', 'Please send me the notes from today.', '2024-09-11 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('53', 'teacher_46', 'student_37', 'Can you recommend any resources?', '2025-02-15 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('54', 'teacher_48', 'student_33', 'Looking forward to our next meeting.', '2025-01-16 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('55', 'student_35', 'teacher_36', 'I have a question about the assignment.', '2024-09-28 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('56', 'teacher_16', 'student_31', 'The session was very helpful, thanks.', '2024-10-28 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('57', 'teacher_4', 'student_30', 'Is Thursday at 3pm available?', '2025-03-03 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('58', 'student_61', 'teacher_7', 'I have a question about the assignment.', '2024-09-02 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('59', 'teacher_11', 'student_71', 'Can you recommend any resources?', '2025-01-01 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('60', 'student_26', 'teacher_49', 'Is Thursday at 3pm available?', '2024-11-13 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('61', 'teacher_50', 'student_8', 'I am having trouble with this topic.', '2024-10-30 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('62', 'student_69', 'teacher_48', 'Can we reschedule our session?', '2024-10-15 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('63', 'student_54', 'teacher_12', 'Can we reschedule our session?', '2024-12-11 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('64', 'student_64', 'teacher_12', 'Please send me the notes from today.', '2024-09-10 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('65', 'student_2', 'teacher_20', 'Thank you for the session today!', '2024-11-25 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('66', 'student_37', 'teacher_30', 'The session was very helpful, thanks.', '2025-01-13 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('67', 'student_64', 'teacher_9', 'Can you recommend any resources?', '2024-11-09 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('68', 'teacher_8', 'student_25', 'Can you recommend any resources?', '2025-02-13 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('69', 'teacher_46', 'student_33', 'Is Thursday at 3pm available?', '2024-11-15 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('70', 'student_73', 'teacher_44', 'I have a question about the assignment.', '2025-02-04 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('71', 'student_52', 'teacher_28', 'Thank you for the session today!', '2024-12-12 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('72', 'student_13', 'teacher_12', 'Can you recommend any resources?', '2024-11-22 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('73', 'teacher_1', 'student_32', 'Looking forward to our next meeting.', '2024-12-24 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('74', 'teacher_22', 'student_35', 'I am having trouble with this topic.', '2024-09-03 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('75', 'teacher_42', 'student_34', 'Looking forward to our next meeting.', '2024-09-16 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('76', 'teacher_30', 'student_16', 'I completed the task you assigned.', '2025-02-23 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('77', 'student_65', 'teacher_46', 'Thank you for the session today!', '2025-02-11 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('78', 'student_38', 'teacher_24', 'Looking forward to our next meeting.', '2024-10-05 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('79', 'teacher_10', 'student_62', 'I am having trouble with this topic.', '2024-12-05 00:00:00');
INSERT INTO messages (id, sender, receiver, message, created_at) VALUES ('80', 'student_54', 'teacher_45', 'Can you recommend any resources?', '2025-03-13 00:00:00');

SET FOREIGN_KEY_CHECKS = 1;

-- ──────────────────────────────────────────────────────────
-- UPDATE Operations
-- ──────────────────────────────────────────────────────────

-- Update hourly rate for teacher id=1
UPDATE teachers SET hourly_rate = 45.00 WHERE id = 1;

-- Update session status from pending to confirmed for session id=1
UPDATE sessions SET status = 'confirmed' WHERE id = 1 AND status = 'pending';

-- Update student full name for id=1
UPDATE students SET full_name = 'Ahmed Raza Updated' WHERE id = 1;

-- ──────────────────────────────────────────────────────────
-- DELETE Operations
-- ──────────────────────────────────────────────────────────

-- Delete cancelled sessions older than a certain date
DELETE FROM sessions WHERE status = 'cancelled' AND id > 95;

-- Delete a specific message
DELETE FROM messages WHERE id = 80;

-- ============================================================
-- VALIDATION QUERIES
-- Run these after data load to confirm integrity
-- ============================================================

-- 1. COUNT(*) for every table
SELECT 'students'      AS table_name, COUNT(*) AS row_count FROM students
UNION ALL
SELECT 'teachers',      COUNT(*) FROM teachers
UNION ALL
SELECT 'skills',        COUNT(*) FROM skills
UNION ALL
SELECT 'teacher_skills',COUNT(*) FROM teacher_skills
UNION ALL
SELECT 'sessions',      COUNT(*) FROM sessions
UNION ALL
SELECT 'ratings',       COUNT(*) FROM ratings
UNION ALL
SELECT 'messages',      COUNT(*) FROM messages
UNION ALL
SELECT 'admin',         COUNT(*) FROM admin;

-- 2. NULL checks on key columns
SELECT 'NULL emails in students'   AS check_name, COUNT(*) AS null_count FROM students  WHERE email    IS NULL
UNION ALL
SELECT 'NULL emails in teachers',               COUNT(*) FROM teachers WHERE email    IS NULL
UNION ALL
SELECT 'NULL names in students',                COUNT(*) FROM students WHERE full_name IS NULL
UNION ALL
SELECT 'NULL skill in sessions',                COUNT(*) FROM sessions WHERE skill     IS NULL
UNION ALL
SELECT 'NULL stars in ratings',                 COUNT(*) FROM ratings  WHERE stars     IS NULL;

-- 3. FK integrity: sessions referencing valid students
SELECT s.id AS session_id, s.student_id
FROM sessions s
LEFT JOIN students st ON s.student_id = st.id
WHERE st.id IS NULL;

-- 4. FK integrity: sessions referencing valid teachers
SELECT s.id AS session_id, s.teacher_id
FROM sessions s
LEFT JOIN teachers t ON s.teacher_id = t.id
WHERE t.id IS NULL;

-- 5. FK integrity: teacher_skills referencing valid teachers and skills
SELECT ts.id, ts.teacher_id, ts.skill_id
FROM teacher_skills ts
LEFT JOIN teachers t ON ts.teacher_id = t.id
LEFT JOIN skills sk  ON ts.skill_id   = sk.id
WHERE t.id IS NULL OR sk.id IS NULL;

-- 6. FK integrity: ratings referencing valid teachers and students
SELECT r.id, r.teacher_id, r.student_id
FROM ratings r
LEFT JOIN teachers t  ON r.teacher_id = t.id
LEFT JOIN students st ON r.student_id = st.id
WHERE t.id IS NULL OR st.id IS NULL;

-- 7. Average rating per teacher (top 10)
SELECT t.full_name, ROUND(AVG(r.stars), 2) AS avg_rating, COUNT(r.id) AS total_ratings
FROM teachers t
JOIN ratings r ON t.id = r.teacher_id
GROUP BY t.id, t.full_name
ORDER BY avg_rating DESC
LIMIT 10;

-- 8. Sessions per status
SELECT status, COUNT(*) AS count
FROM sessions
GROUP BY status
ORDER BY count DESC;

-- ============================================================
-- END OF DML SCRIPT
-- Commit Message: M5: Data populated, validation queries added
-- ============================================================
