<?php
$servername = "localhost";
$username = "root";
$password = "pratik";

// Create a connection
$conn = new mysqli($servername, $username, $password);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Select the database based on the action
if ($_GET['db'] == 'attack_detection') {
    $conn->select_db('Attack_Detection');
} elseif ($_GET['db'] == 'network_traffic') {
    $conn->select_db('Network_Traffic');
} elseif ($_GET['db'] == 'system_logging') {
    $conn->select_db('System_Logging');
} elseif ($_GET['db'] == 'botnet_information') {
    $conn->select_db('Botnet_Information');
} elseif ($_GET['db'] == 'mitigation_strategies') {
    $conn->select_db('Mitigation_Strategies');
}

// Handle different actions

// Fetch all detection rules and associated attack types
if ($_GET['action'] == 'getDetectionRules') {
    $sql = "SELECT dr.*, at.type_name 
            FROM detection_rules dr 
            JOIN attack_types at ON dr.rule_description LIKE CONCAT('%', at.type_name, '%')";
    $result = $conn->query($sql);
    $rules = [];

    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            $rules[] = $row;
        }
    }
    echo json_encode($rules);
}

// Fetch all attacks with corresponding attack types and sources
if ($_GET['action'] == 'getAttacks') {
    $sql = "SELECT a.*, at.type_name, s.source_country 
            FROM attacks a 
            JOIN attack_types at ON a.attack_type = at.id 
            JOIN sources s ON a.source_ip = s.source_ip";
    $result = $conn->query($sql);
    $attacks = [];

    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            $attacks[] = $row;
        }
    }
    echo json_encode($attacks);
}

// Fetch all network traffic data
if ($_GET['action'] == 'getTraffic') {
    $sql = "SELECT t.id, t.timestamp, t.source_ip, t.destination_ip, p.protocol_name
            FROM traffic t
            JOIN protocols p ON t.protocol = p.id";
    $result = $conn->query($sql);
    $traffic = [];

    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            $traffic[] = $row;
        }
    }
    echo json_encode($traffic);
}

// Fetch all system logs
if ($_GET['action'] == 'getSystemLogs') {
    $sql = "SELECT se.id, et.event_name, se.event_date, se.details
            FROM system_events se
            JOIN event_types et ON se.event_type = et.id";
    $result = $conn->query($sql);
    $logs = [];

    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            $logs[] = $row;
        }
    }
    echo json_encode($logs);
}

// Fetch all botnet information
if ($_GET['action'] == 'getBotnets') {
    $sql = "SELECT b.id, b.botnet_name, b.command_control_ip, cs.status 
            FROM botnets b
            JOIN control_servers cs ON b.command_control_ip = cs.server_ip";
    $result = $conn->query($sql);
    $botnets = [];

    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            $botnets[] = $row;
        }
    }
    echo json_encode($botnets);
}

// Fetch all mitigation strategies
if ($_GET['action'] == 'getMitigationStrategies') {
    $sql = "SELECT s.id, s.strategy_name, s.description, se.effectiveness_score
            FROM strategies s
            JOIN strategy_effectiveness se ON s.id = se.strategy_id";
    $result = $conn->query($sql);
    $strategies = [];

    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            $strategies[] = $row;
        }
    }
    echo json_encode($strategies);
}

$conn->close();
?>
