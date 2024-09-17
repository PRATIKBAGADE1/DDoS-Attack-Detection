-- Active: 1726524723331@@127.0.0.1@3306

-- Create Attack_Detection Database
CREATE DATABASE Attack_Detection;

-- Use Attack_Detection Database
USE Attack_Detection;

-- Create Tables
CREATE TABLE attack_types (
    id INT PRIMARY KEY AUTO_INCREMENT,
    type_name VARCHAR(50),
    description TEXT
);

CREATE TABLE attacks (
    id INT PRIMARY KEY AUTO_INCREMENT,
    attack_type INT,
    attack_date DATETIME,
    source_ip VARCHAR(15),
    FOREIGN KEY (attack_type) REFERENCES attack_types(id)
);

CREATE TABLE sources (
    id INT PRIMARY KEY AUTO_INCREMENT,
    source_ip VARCHAR(15),
    source_country VARCHAR(50)
);

CREATE TABLE detection_rules (
    id INT PRIMARY KEY AUTO_INCREMENT,
    rule_name VARCHAR(50),
    rule_description TEXT
);

CREATE TABLE alerts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    attack_id INT,
    alert_date DATETIME,
    alert_level VARCHAR(10),
    FOREIGN KEY (attack_id) REFERENCES attacks(id)
);

-- Insert Sample Data

-- Insert Sample Data into attack_types
INSERT INTO attack_types (type_name, description) VALUES
('DDoS', 'Distributed Denial of Service'),
('SQL Injection', 'Structured Query Language Injection'),
('Cross-Site Scripting', 'XSS'),
('Brute Force', 'Password Guessing'),
('Phishing', 'Social Engineering');

-- Insert Sample Data into attacks
INSERT INTO attacks (attack_type, attack_date, source_ip) VALUES
(1, '2022-01-01 12:00:00', '192.168.1.100'),
(2, '2022-01-02 13:00:00', '192.168.1.101'),
(3, '2022-01-03 14:00:00', '192.168.1.102'),
(4, '2022-01-04 15:00:00', '192.168.1.103'),
(5, '2022-01-05 16:00:00', '192.168.1.104');

-- Insert Sample Data into sources
INSERT INTO sources (source_ip, source_country) VALUES
('192.168.1.100', 'USA'),
('192.168.1.101', 'China'),
('192.168.1.102', 'Russia'),
('192.168.1.103', 'India'),
('192.168.1.104', 'Brazil');

-- Insert Sample Data into detection_rules
INSERT INTO detection_rules (rule_name, rule_description) VALUES
('Rule 1', 'Detect DDoS attacks'),
('Rule 2', 'Detect SQL Injection'),
('Rule 3', 'Detect XSS'),
('Rule 4', 'Detect Brute Force'),
('Rule 5', 'Detect Phishing');

-- Insert Sample Data into alerts
INSERT INTO alerts (attack_id, alert_date, alert_level) VALUES
(1, '2022-01-01 12:00:00', 'High'),
(2, '2022-01-02 13:00:00', 'Medium'),
(3, '2022-01-03 14:00:00', 'Low'),
(4, '2022-01-04 15:00:00', 'High'),
(5, '2022-01-05 16:00:00', 'Medium');



-- Create Network_Traffic Database
CREATE DATABASE Network_Traffic;

-- Use Network_Traffic Database
USE Network_Traffic;

-- Create Tables
CREATE TABLE protocols (
    id INT PRIMARY KEY AUTO_INCREMENT,
    protocol_name VARCHAR(50),
    description TEXT
);

CREATE TABLE traffic (
    id INT PRIMARY KEY AUTO_INCREMENT,
    timestamp DATETIME,
    source_ip VARCHAR(15),
    destination_ip VARCHAR(15),
    protocol INT,
    FOREIGN KEY (protocol) REFERENCES protocols(id)
);

CREATE TABLE ip_addresses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ip_address VARCHAR(15),
    ip_type VARCHAR(10),
    country VARCHAR(50),
    description TEXT
);

CREATE TABLE network_devices (
    id INT PRIMARY KEY AUTO_INCREMENT,
    device_name VARCHAR(50),
    device_type VARCHAR(50)
);

CREATE TABLE traffic_stats (
    id INT PRIMARY KEY AUTO_INCREMENT,
    timestamp DATETIME,
    traffic_volume INT
);

-- Insert Sample Data
INSERT INTO protocols (protocol_name, description) VALUES
('TCP', 'Transmission Control Protocol'),
('UDP', 'User Datagram Protocol'),
('HTTP', 'Hypertext Transfer Protocol'),
('FTP', 'File Transfer Protocol'),
('SSH', 'Secure Shell');

-- Insert Sample Data into traffic
INSERT INTO traffic (timestamp, source_ip, destination_ip, protocol) VALUES
('2022-01-01 12:00:00', '192.168.1.100', '192.168.1.1', 1),
('2022-01-02 13:00:00', '192.168.1.101', '192.168.1.2', 2),
('2022-01-03 14:00:00', '192.168.1.102', '192.168.1.3', 3),
('2022-01-04 15:00:00', '192.168.1.103', '192.168.1.4', 4),
('2022-01-05 16:00:00', '192.168.1.104', '192.168.1.5', 5);

-- Insert Sample Data into ip_addresses
INSERT INTO ip_addresses (ip_address, ip_type, country, description) VALUES
('192.168.1.100', 'Public', 'USA', 'Attacker'),
('192.168.1.101', 'Private', 'China', 'Victim'),
('10.0.0.1', 'Private', 'India', 'Server'),
('172.16.254.1', 'Private', 'Brazil', 'Router'),
('8.8.8.8', 'Public', 'USA', 'DNS Server');

-- Insert Sample Data into network_devices
INSERT INTO network_devices (device_name, device_type) VALUES
('Router1', 'Router'),
('Switch1', 'Switch'),
('Firewall1', 'Firewall'),
('Server1', 'Server'),
('Workstation1', 'Workstation');

-- Insert Sample Data into traffic_stats
INSERT INTO traffic_stats (timestamp, traffic_volume) VALUES
('2022-01-01 12:00:00', 5000),
('2022-01-02 13:00:00', 6000),
('2022-01-03 14:00:00', 7000),
('2022-01-04 15:00:00', 8000),
('2022-01-05 16:00:00', 9000);



-- Create System_Logging Database
CREATE DATABASE System_Logging;

-- Use System_Logging Database
USE System_Logging;

-- Create Tables
CREATE TABLE event_types (
    id INT PRIMARY KEY AUTO_INCREMENT,
    event_name VARCHAR(50),
    description TEXT
);

CREATE TABLE system_events (
    id INT PRIMARY KEY AUTO_INCREMENT,
    event_type INT,
    event_date DATETIME,
    details TEXT,
    FOREIGN KEY (event_type) REFERENCES event_types(id)
);

CREATE TABLE system_resources (
    id INT PRIMARY KEY AUTO_INCREMENT,
    resource_name VARCHAR(50),
     `usage` INT
);

CREATE TABLE user_activity (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(50),
    activity_date DATETIME,
    activity_details TEXT
);

CREATE TABLE log_files (
    id INT PRIMARY KEY AUTO_INCREMENT,
    file_path VARCHAR(255),
    file_size INT
);
INSERT INTO event_types (event_name, description) VALUES
('Login', 'User login event'),
('Error', 'System error event'),
('Update', 'System update event'),
('Shutdown', 'System shutdown event'),
('Restart', 'System restart event');

-- Insert Sample Data into system_events
INSERT INTO system_events (event_type, event_date, details) VALUES
(1, '2022-01-01 12:00:00', 'User admin logged in'),
(2, '2022-01-02 13:00:00', 'Disk space low'),
(3, '2022-01-03 14:00:00', 'System update installed'),
(4, '2022-01-04 15:00:00', 'System shutdown'),
(5, '2022-01-05 16:00:00', 'System restarted');

-- Insert Sample Data into system_resources
INSERT INTO system_resources (resource_name, usage) VALUES
('CPU', 75),
('Memory', 60),
('Disk', 80),
('Network', 50),
('GPU', 40);

-- Insert Sample Data into user_activity
INSERT INTO user_activity (user_name, activity_date, activity_details) VALUES
('admin', '2022-01-01 12:00:00', 'Logged in'),
('guest', '2022-01-02 13:00:00', 'Viewed logs'),
('user1', '2022-01-03 14:00:00', 'Updated profile'),
('user2', '2022-01-04 15:00:00', 'Changed password'),
('user3', '2022-01-05 16:00:00', 'Logged out');

-- Insert Sample Data into log_files
INSERT INTO log_files (file_path, file_size) VALUES
('/var/log/syslog', 1024),
('/var/log/auth.log', 2048),
('/var/log/kern.log', 3072),
('/var/log/daemon.log', 4096),
('/var/log/user.log', 5120);


-- Create Botnet_Information Database
CREATE DATABASE Botnet_Information;

-- Use Botnet_Information Database
USE Botnet_Information;

-- Create Tables
CREATE TABLE botnets (
    id INT PRIMARY KEY AUTO_INCREMENT,
    botnet_name VARCHAR(50),
    command_control_ip VARCHAR(15)
);

CREATE TABLE bot_ips (
    id INT PRIMARY KEY AUTO_INCREMENT,
    botnet_id INT,
    ip_address VARCHAR(15),
    FOREIGN KEY (botnet_id) REFERENCES botnets(id)
);

CREATE TABLE bot_activity (
    id INT PRIMARY KEY AUTO_INCREMENT,
    botnet_id INT,
    activity_date DATETIME,
    activity_details TEXT,
    FOREIGN KEY (botnet_id) REFERENCES botnets(id)
);

CREATE TABLE control_servers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    server_ip VARCHAR(15),
    status VARCHAR(50)
);

CREATE TABLE mitigation_logs (
    id INT PRIMARY KEY AUTO_INCREMENT,
    botnet_id INT,
    mitigation_date DATETIME,
    details TEXT,
    FOREIGN KEY (botnet_id) REFERENCES botnets(id)
);

-- Insert Sample Data
INSERT INTO botnets (botnet_name, command_control_ip) VALUES
('Botnet1', '192.168.1.200'),
('Botnet2', '192.168.1.201'),
('Botnet3', '192.168.1.202'),
('Botnet4', '192.168.1.203'),
('Botnet5', '192.168.1.204');

-- Insert Sample Data into bot_ips
INSERT INTO bot_ips (botnet_id, ip_address) VALUES
(1, '192.168.1.150'),
(1, '192.168.1.151'),
(2, '192.168.1.152'),
(3, '192.168.1.153'),
(4, '192.168.1.154');

-- Insert Sample Data into bot_activity

INSERT INTO bot_activity (botnet_id, activity_date, activity_details) VALUES
(1, '2022-01-01 12:00:00', 'DDoS attack initiated'),
(2, '2022-01-02 13:00:00', 'Data exfiltration detected'),
(3, '2022-01-03 14:00:00', 'Spamming operation detected'),
(4, '2022-01-04 15:00:00', 'Click fraud operation detected'),
(5, '2022-01-05 16:00:00', 'Mining cryptocurrency');

-- Insert Sample Data into control_servers
INSERT INTO control_servers (server_ip, status) VALUES
('192.168.1.200', 'Active'),
('192.168.1.201', 'Inactive'),
('192.168.1.202', 'Active'),
('192.168.1.203', 'Inactive'),
('192.168.1.204', 'Active');

-- Insert Sample Data into mitigation_logs

INSERT INTO mitigation_logs (botnet_id, mitigation_date, details) VALUES
(1, '2022-01-01 13:00:00', 'Blocked IP addresses'),
(2, '2022-01-02 14:00:00', 'Isolated infected machines'),
(3, '2022-01-03 15:00:00', 'Traffic filtering applied'),
(4, '2022-01-04 16:00:00', 'Null routing applied'),
(5, '2022-01-05 17:00:00', 'Domain sinkholing');



-- Create Mitigation_Strategies Database
CREATE DATABASE Mitigation_Strategies;

-- Use Mitigation_Strategies Database
USE Mitigation_Strategies;

-- Create Tables
CREATE TABLE strategies (
    id INT PRIMARY KEY AUTO_INCREMENT,
    strategy_name VARCHAR(50),
    description TEXT
);

CREATE TABLE strategy_effectiveness (
    id INT PRIMARY KEY AUTO_INCREMENT,
    strategy_id INT,
    date_evaluated DATETIME,
    effectiveness_score INT,
    FOREIGN KEY (strategy_id) REFERENCES strategies(id)
);

CREATE TABLE implemented_strategies (
    id INT PRIMARY KEY AUTO_INCREMENT,
    strategy_id INT,
    implementation_date DATETIME,
    FOREIGN KEY (strategy_id) REFERENCES strategies(id)
);

CREATE TABLE strategy_updates (
    id INT PRIMARY KEY AUTO_INCREMENT,
    strategy_id INT,
    update_date DATETIME,
    update_details TEXT,
    FOREIGN KEY (strategy_id) REFERENCES strategies(id)
);

CREATE TABLE incident_responses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    response_date DATETIME,
    strategy_id INT,
    response_details TEXT,
    FOREIGN KEY (strategy_id) REFERENCES strategies(id)
);

-- Insert Sample Data
INSERT INTO strategies (strategy_name, description) VALUES
('IP Blocking', 'Block malicious IP addresses'),
('Traffic Filtering', 'Filter suspicious network traffic'),
('Rate Limiting', 'Limit the rate of incoming requests'),
('Null Routing', 'Direct malicious traffic to a null route'),
('Domain Sinkholing', 'Redirect malicious domains to sinkhole');

-- Insert Sample Data into strategy_effectiveness

INSERT INTO strategy_effectiveness (strategy_id, date_evaluated, effectiveness_score) VALUES
(1, '2022-01-01 12:00:00', 85),
(2, '2022-01-02 13:00:00', 90),
(3, '2022-01-03 14:00:00', 75),
(4, '2022-01-04 15:00:00', 80),
(5, '2022-01-05 16:00:00', 88);

-- Insert Sample Data into implemented_strategies
INSERT INTO implemented_strategies (strategy_id, implementation_date) VALUES
(1, '2022-01-01 13:00:00'),
(2, '2022-01-02 14:00:00'),
(3, '2022-01-03 15:00:00'),
(4, '2022-01-04 16:00:00'),
(5, '2022-01-05 17:00:00');

-- Insert Sample Data into strategy_updates

INSERT INTO strategy_updates (strategy_id, update_date, update_details) VALUES
(1, '2022-01-02 12:00:00', 'Improved detection rules'),
(2, '2022-01-03 13:00:00', 'Updated filtering criteria'),
(3, '2022-01-04 14:00:00', 'Optimized rate limiting'),
(4, '2022-01-05 15:00:00', 'Enhanced null routing paths'),
(5, '2022-01-06 16:00:00', 'Added new sinkhole domains');

-- Insert Sample Data into incident_responses

INSERT INTO incident_responses (response_date, strategy_id, response_details) VALUES
('2022-01-01 14:00:00', 1, 'Successfully blocked malicious IPs'),
('2022-01-02 15:00:00', 2, 'Filtered out DDoS traffic'),
('2022-01-03 16:00:00', 3, 'Rate limiting reduced attack impact'),
('2022-01-04 17:00:00', 4, 'Null routing diverted attack traffic'),
('2022-01-05 18:00:00', 5, 'Sinkhole redirected malicious domains');