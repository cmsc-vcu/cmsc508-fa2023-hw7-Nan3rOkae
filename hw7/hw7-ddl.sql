# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS peopleskills;
# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
  skills_id INT AUTO_INCREMENT PRIMARY KEY,
  skills_name VARCHAR(255) NOT NULL,
  skills_description VARCHAR(255) NOT NULL,
  skills_tag VARCHAR(255) NOT NULL,
  skills_url VARCHAR(255) DEFAULT NULL,
  time_commitment VARCHAR(255) DEFAULT NULL
);


SHOW TABLES;

# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills (skills_id, skills_name, skills_description, skills_tag)
VALUES
  (1,'Cryptocurrency Analysis', 'Understanding and predicting cryptocurrency market trends.', 'Skill 1'),
  (2,'Advanced Baking Techniques', 'Mastering the art of baking with advanced recipes and presentation.', 'Skill 2'),
  (3,'AI Development', 'Designing and building artificial intelligence systems.', 'Skill 3'),
  (4,'Quantum Computing Basics', 'Learning the principles of quantum computation.', 'Skill 4'),
  (5,'Space Gardening', 'Cultivating plants in space or extraterrestrial environments.', 'Skill 5'),
  (6,'Underwater Photography', 'Taking high-quality photographs beneath the surface of the water.', 'Skill 6'),
  (7,'Extreme Weather Forecasting', 'Predicting severe weather patterns and natural disasters.', 'Skill 7'),
  (8,'Virtual Reality Game Design', 'Creating immersive virtual reality experiences for gaming.', 'Skill 8');

SELECT * FROM skills;


# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
  people_id INT AUTO_INCREMENT PRIMARY KEY,
  people_first_name VARCHAR(255) DEFAULT NULL,
  people_last_name VARCHAR(255) NOT NULL,
  people_email VARCHAR(255) DEFAULT NULL,
  people_linkedin_url VARCHAR(255) DEFAULT NULL,
  people_headshot_url VARCHAR(255) DEFAULT NULL,
  people_discord_handle VARCHAR(255) DEFAULT NULL,
  people_brief_bio TEXT DEFAULT NULL,
  people_date_joined DATE NOT NULL
);


# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

INSERT INTO people (people_id, people_first_name, people_last_name, people_email, people_linkedin_url, people_headshot_url, people_discord_handle, people_brief_bio, people_date_joined)
VALUES
  (1,'Kofi', 'Okae', 'kofi1@example.com', 'http://linkedin.com/in/kofi1', 'http://example.com/headshots/kofi1.jpg', 'Kofi#001', 'A software developer specializing in AI technologies.', '2021-06-01'),
  (2,'Afua', 'Afriyie', 'afua2@example.com', 'http://linkedin.com/in/afua2', 'http://example.com/headshots/afua2.jpg', 'Afua#002', 'An expert in renewable energy and sustainable development.', '2022-01-15'),
  (3,'Osei', 'Kwabena', 'osei3@example.com', 'http://linkedin.com/in/osei3', 'http://example.com/headshots/osei3.jpg', 'Osei#003', 'A financial analyst with a keen eye for stock market trends.', '2020-09-23'),
  (4,'Mansah', 'Odu', 'mansah4@example.com', 'http://linkedin.com/in/mansah4', 'http://example.com/headshots/mansah4.jpg', 'Mansah#004', 'A digital marketer with a passion for brand storytelling.', '2021-03-11'),
  (5,'Abena', 'Ansah', 'abena5@example.com', 'http://linkedin.com/in/abena5', 'http://example.com/headshots/abena5.jpg', 'Abena#005', 'An architect who combines sustainability with innovation.', '2022-05-19'),
  (6,'Shyy', 'Davis', 'shyy6@example.com', 'http://linkedin.com/in/shyy6', 'http://example.com/headshots/shyy6.jpg', 'Shyy#006', 'A journalist focusing on international politics.', '2021-11-30'),
  (7, 'Ama', 'Serwaa', 'ama7@example.com', 'http://linkedin.com/in/ama7', 'http://example.com/headshots/ama7.jpg', 'Ama#007', 'A graphic designer who brings concepts to life through visuals.', '2023-02-10'),
  (8, 'Kwame', 'Mensah', 'kwame8@example.com', 'http://linkedin.com/in/kwame8', 'http://example.com/headshots/kwame8.jpg', 'Kwame#008', 'A civil engineer with a focus on urban redevelopment projects.', '2023-04-22'),
  (9, 'Kwesi', 'Antwi', 'kwesi9@example.com', 'http://linkedin.com/in/kwesi9', 'http://example.com/headshots/kwesi9.jpg', 'Kwesi#009', 'A data scientist passionate about machine learning and data-driven decision making.', '2023-07-15'),
  (10, 'Akua', 'Boateng', 'akua10@example.com', 'http://linkedin.com/in/akua10', 'http://example.com/headshots/akua10.jpg', 'Akua#010', 'An entrepreneur with innovative approaches to technology and business.', '2023-08-05');

SELECT * FROM people;

# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills (
  peopleskills_id INT AUTO_INCREMENT PRIMARY KEY,
  skills_id INT NOT NULL,
  people_id INT NOT NULL,
  peopleskills_date_acquired DATE NOT NULL,
  FOREIGN KEY (skills_id) REFERENCES skills(skills_id),
  FOREIGN KEY (people_id) REFERENCES people(people_id)
);


# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.

INSERT INTO peopleskills (skills_id, people_id, peopleskills_date_acquired) VALUES
  (1, 1, '2023-11-07'),
  (3, 1, '2023-11-07'),
  (6, 1, '2023-11-07'),
  
  (3, 2, '2023-11-07'),
  (4, 2, '2023-11-07'),
  (5, 2, '2023-11-07'),
  
  (1, 3, '2023-11-07'),
  (5, 3, '2023-11-07'),
  -- Person 4 has no skills
  (3, 5, '2023-11-07'),
  (6, 5, '2023-11-07'),
  
  (2, 6, '2023-11-07'),
  (3, 6, '2023-11-07'),
  (4, 6, '2023-11-07'),
  
  (3, 7, '2023-11-07'),
  (5, 7, '2023-11-07'),
  (6, 7, '2023-11-07'),
  
  (1, 8, '2023-11-07'),
  (3, 8, '2023-11-07'),
  (5, 8, '2023-11-07'),
  (6, 8, '2023-11-07'),
  
  (2, 9, '2023-11-07'),
  (5, 9, '2023-11-07'),
  (6, 9, '2023-11-07'),
  
  (1, 10, '2023-11-07'),
  (4, 10, '2023-11-07'),
  (5, 10, '2023-11-07');

 SELECT * FROM peopleskills;

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (
  roles_id INT AUTO_INCREMENT PRIMARY KEY,
  roles_name VARCHAR(255) NOT NULL,
  roles_sort_priority INT NOT NULL
);



# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)



# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment



# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

