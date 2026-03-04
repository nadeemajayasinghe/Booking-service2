-- Database Setup Script for Booking Service
-- Vehicle Rental System

-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS vehicle_rental_booking
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE vehicle_rental_booking;

-- Create bookings table
CREATE TABLE IF NOT EXISTS bookings (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    vehicle_id BIGINT NOT NULL,
    vehicle_name VARCHAR(255) NOT NULL,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(255) NOT NULL,
    customer_phone VARCHAR(50) NOT NULL,
    license_number VARCHAR(50) NOT NULL,
    pickup_date DATE NOT NULL,
    return_date DATE NOT NULL,
    pickup_location VARCHAR(255) NOT NULL,
    return_location VARCHAR(255) NOT NULL,
    number_of_days INT NOT NULL,
    price_per_day DECIMAL(10,2) NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    status VARCHAR(50) NOT NULL,
    special_requests TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    -- Indexes for better query performance
    INDEX idx_vehicle_id (vehicle_id),
    INDEX idx_customer_email (customer_email),
    INDEX idx_status (status),
    INDEX idx_pickup_date (pickup_date),
    INDEX idx_dates (pickup_date, return_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Sample data for testing (optional)
INSERT INTO bookings (
    vehicle_id, vehicle_name, customer_name, customer_email, 
    customer_phone, license_number, pickup_date, return_date,
    pickup_location, return_location, number_of_days, 
    price_per_day, total_amount, status, special_requests
) VALUES 
(
    1, 
    'Toyota Camry 2024', 
    'John Doe', 
    'john.doe@example.com',
    '+1-234-567-8900',
    'DL123456789',
    '2026-03-15',
    '2026-03-20',
    '123 Main St, New York, NY',
    '123 Main St, New York, NY',
    5,
    50.00,
    250.00,
    'CONFIRMED',
    'GPS navigation required'
),
(
    2, 
    'Honda Accord 2024', 
    'Jane Smith', 
    'jane.smith@example.com',
    '+1-234-567-8901',
    'DL987654321',
    '2026-03-18',
    '2026-03-25',
    '456 Park Ave, Boston, MA',
    '456 Park Ave, Boston, MA',
    7,
    45.00,
    315.00,
    'PENDING',
    'Child seat required'
),
(
    3, 
    'Tesla Model 3 2024', 
    'Bob Johnson', 
    'bob.johnson@example.com',
    '+1-234-567-8902',
    'DL456789123',
    '2026-03-12',
    '2026-03-15',
    '789 Tech Blvd, San Francisco, CA',
    '789 Tech Blvd, San Francisco, CA',
    3,
    80.00,
    240.00,
    'IN_PROGRESS',
    NULL
);

-- Query to view all bookings
SELECT * FROM bookings ORDER BY created_at DESC;

-- Query to view bookings by status
SELECT * FROM bookings WHERE status = 'CONFIRMED';

-- Query to check vehicle availability
SELECT * FROM bookings 
WHERE vehicle_id = 1 
  AND status != 'CANCELLED'
  AND (
    (pickup_date <= '2026-03-20' AND return_date >= '2026-03-15')
  );

-- Query to view customer booking history
SELECT * FROM bookings 
WHERE customer_email = 'john.doe@example.com'
ORDER BY created_at DESC;

-- Query to get booking statistics
SELECT 
    status,
    COUNT(*) as count,
    SUM(total_amount) as total_revenue
FROM bookings
GROUP BY status;

-- Query to get upcoming bookings
SELECT * FROM bookings 
WHERE pickup_date >= CURDATE()
  AND status IN ('PENDING', 'CONFIRMED')
ORDER BY pickup_date;

-- Query to get completed bookings
SELECT * FROM bookings 
WHERE status = 'COMPLETED'
  AND return_date < CURDATE()
ORDER BY return_date DESC;
