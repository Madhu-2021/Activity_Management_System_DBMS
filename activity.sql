-- Create Activity Table
CREATE TABLE Activity (
    activity_id INT PRIMARY KEY AUTO_INCREMENT,
    activity_name VARCHAR(100) NOT NULL,
    description TEXT,
    start_date DATE,
    end_date DATE,
    status ENUM('Planned', 'Ongoing', 'Completed') DEFAULT 'Planned'
);

-- Create User Table
CREATE TABLE User (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    password VARCHAR(100) NOT NULL -- For authentication
);

-- Create User_Activity Table (Many-to-Many Relationship)
CREATE TABLE User_Activity (
    user_activity_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    activity_id INT,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (activity_id) REFERENCES Activity(activity_id)
);

-- Create Notification Table
CREATE TABLE Notification (
    notification_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    message TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Insert sample data
INSERT INTO User (username, email, password) VALUES
('user1', 'user1@example.com', 'password1'),
('user2', 'user2@example.com', 'password2');

INSERT INTO Activity (activity_name, description, start_date, end_date, status) VALUES
('Project A', 'Description for Project A', '2024-03-01', '2024-04-15', 'Ongoing'),
('Project B', 'Description for Project B', '2024-02-15', '2024-03-31', 'Completed');

INSERT INTO User_Activity (user_id, activity_id) VALUES
(1, 1),
(2, 1),
(2, 2);
