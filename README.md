# Vehicle Rental System - Booking Service 🚗

A microservices-based booking service for vehicle rental system built with Spring Boot, Java, and MySQL.

## 🎯 Features

- **Complete Booking Management**: Create, read, update, and delete vehicle bookings
- **Real-time Availability Checking**: Prevents double-booking of vehicles
- **Customer Management**: Track customer information and booking history
- **Price Calculation**: Automatic calculation of total booking amount based on days and rates
- **Status Tracking**: Monitor booking status (Pending, Confirmed, In Progress, Completed, Cancelled)
- **REST API**: Comprehensive RESTful API for integration with other microservices
- **Web Interface**: User-friendly web forms for creating and viewing bookings

## 🛠️ Technology Stack

- **Backend**: Spring Boot 3.2.3
- **Language**: Java 17
- **Database**: MySQL 8.0
- **ORM**: Spring Data JPA / Hibernate
- **Frontend**: HTML5, CSS3, JavaScript, Thymeleaf
- **Build Tool**: Maven
- **Validation**: Bean Validation (JSR-380)

## 📋 Prerequisites

- Java 17 or higher
- MySQL 8.0 or higher
- Maven 3.6+
- IDE (IntelliJ IDEA, Eclipse, or VS Code)

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone <repository-url>
cd booking-service
```

### 2. Configure MySQL Database

Create a MySQL database and update the credentials in `src/main/resources/application.properties`:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/vehicle_rental_booking?createDatabaseIfNotExist=true&useSSL=false&serverTimezone=UTC
spring.datasource.username=your_username
spring.datasource.password=your_password
```

**Note**: The database will be created automatically if it doesn't exist.

### 3. Build the Project

```bash
mvn clean install
```

### 4. Run the Application

```bash
mvn spring-boot:run
```

The application will start on `http://localhost:8081`

## 📡 API Endpoints

### Booking Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/bookings` | Create a new booking |
| GET | `/api/bookings` | Get all bookings |
| GET | `/api/bookings/{id}` | Get booking by ID |
| GET | `/api/bookings/customer/{email}` | Get bookings by customer email |
| GET | `/api/bookings/vehicle/{vehicleId}` | Get bookings by vehicle ID |
| GET | `/api/bookings/status/{status}` | Get bookings by status |
| PUT | `/api/bookings/{id}/status` | Update booking status |
| DELETE | `/api/bookings/{id}` | Delete a booking |
| GET | `/api/bookings/check-availability` | Check vehicle availability |

### Request Example

**Create Booking:**

```json
POST http://localhost:8081/api/bookings
Content-Type: application/json

{
  "vehicleId": 1,
  "vehicleName": "Toyota Camry 2024",
  "customerName": "John Doe",
  "customerEmail": "john.doe@example.com",
  "customerPhone": "+1-234-567-8900",
  "licenseNumber": "DL123456789",
  "pickupDate": "2026-03-15",
  "returnDate": "2026-03-20",
  "pickupLocation": "123 Main St, New York, NY",
  "returnLocation": "123 Main St, New York, NY",
  "pricePerDay": 50.00,
  "specialRequests": "GPS navigation required",
  "status": "PENDING"
}
```

## 🌐 Web Interface

- **Home Page**: `http://localhost:8081/`
- **Create Booking**: `http://localhost:8081/booking-form`
- **View Bookings**: `http://localhost:8081/bookings`

## 📊 Database Schema

### Bookings Table

```sql
CREATE TABLE bookings (
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
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    INDEX idx_vehicle_id (vehicle_id),
    INDEX idx_customer_email (customer_email),
    INDEX idx_status (status),
    INDEX idx_pickup_date (pickup_date)
);
```

## 🔍 Booking Status Types

- **PENDING**: Booking request submitted, awaiting confirmation
- **CONFIRMED**: Booking confirmed and vehicle reserved
- **IN_PROGRESS**: Customer has picked up the vehicle
- **COMPLETED**: Booking completed, vehicle returned
- **CANCELLED**: Booking cancelled by customer or admin

## 🧪 Testing the API

### Using cURL

```bash
# Create a booking
curl -X POST http://localhost:8081/api/bookings \
  -H "Content-Type: application/json" \
  -d '{
    "vehicleId": 1,
    "vehicleName": "Toyota Camry 2024",
    "customerName": "John Doe",
    "customerEmail": "john.doe@example.com",
    "customerPhone": "+1-234-567-8900",
    "licenseNumber": "DL123456789",
    "pickupDate": "2026-03-15",
    "returnDate": "2026-03-20",
    "pickupLocation": "New York",
    "returnLocation": "New York",
    "pricePerDay": 50.00
  }'

# Get all bookings
curl http://localhost:8081/api/bookings

# Get booking by ID
curl http://localhost:8081/api/bookings/1

# Check availability
curl "http://localhost:8081/api/bookings/check-availability?vehicleId=1&pickupDate=2026-03-15&returnDate=2026-03-20"
```

## 📁 Project Structure

```
booking-service/
├── src/
│   ├── main/
│   │   ├── java/com/vehiclerental/bookingservice/
│   │   │   ├── BookingServiceApplication.java
│   │   │   ├── controller/
│   │   │   │   ├── BookingController.java
│   │   │   │   └── WebController.java
│   │   │   ├── model/
│   │   │   │   └── Booking.java
│   │   │   ├── dto/
│   │   │   │   ├── BookingRequest.java
│   │   │   │   └── BookingResponse.java
│   │   │   ├── repository/
│   │   │   │   └── BookingRepository.java
│   │   │   └── service/
│   │   │       └── BookingService.java
│   │   └── resources/
│   │       ├── application.properties
│   │       └── templates/
│   │           ├── index.html
│   │           ├── booking-form.html
│   │           └── view-bookings.html
│   └── test/
├── pom.xml
└── README.md
```

## 🔒 Validation Rules

- Customer name: 2-100 characters
- Email: Valid email format
- Phone: Numbers, +, -, spaces, and parentheses only
- Pickup date: Must be today or future
- Return date: Must be after pickup date
- Price per day: Must be greater than 0
- License number: Required field

## 🚨 Error Handling

The API returns appropriate HTTP status codes:

- **200 OK**: Successful GET requests
- **201 Created**: Successful POST (creation)
- **400 Bad Request**: Invalid input or validation errors
- **404 Not Found**: Resource not found
- **500 Internal Server Error**: Server errors

## 🔄 Integration with Other Microservices

This booking service is designed to integrate with:

- **Vehicle Service**: For vehicle information and availability
- **Customer Service**: For customer management
- **Payment Service**: For payment processing
- **Notification Service**: For booking confirmations and reminders

## 📝 Future Enhancements

- [ ] Payment integration
- [ ] Email notifications
- [ ] SMS alerts
- [ ] PDF invoice generation
- [ ] Advanced search and filtering
- [ ] Booking modification
- [ ] Loyalty points system
- [ ] Multi-language support

## 👥 Author

**Your Name** - Group Assignment - Vehicle Rental System

## 📄 License

This project is part of a group assignment for educational purposes.

## 🤝 Contributing

This is a group project. Please coordinate with team members before making changes.

---

**Happy Coding! 🎉**
