# Quick Start Guide - Booking Service

## Prerequisites Check
✅ Java 17 or higher installed
✅ MySQL 8.0 or higher installed and running
✅ Maven installed
✅ IDE installed (optional but recommended)

## Step-by-Step Setup

### Step 1: Configure MySQL Database

1. Start your MySQL server
2. Open MySQL command line or MySQL Workbench
3. Create the database (or let Spring Boot create it automatically):
   ```sql
   CREATE DATABASE vehicle_rental_booking;
   ```
4. Update credentials in `src/main/resources/application.properties`:
   ```properties
   spring.datasource.username=YOUR_MYSQL_USERNAME
   spring.datasource.password=YOUR_MYSQL_PASSWORD
   ```

### Step 2: Build the Project

Open terminal in the project directory and run:
```bash
mvn clean install
```

This will:
- Download all dependencies
- Compile the Java code
- Run tests
- Create the JAR file

### Step 3: Run the Application

```bash
mvn spring-boot:run
```

Or if you prefer using the JAR file:
```bash
java -jar target/booking-service-1.0.0.jar
```

You should see output like:
```
Started BookingServiceApplication in X.XXX seconds
```

### Step 4: Access the Application

Open your web browser and navigate to:
- **Home Page**: http://localhost:8081/
- **Create Booking**: http://localhost:8081/booking-form
- **View Bookings**: http://localhost:8081/bookings

### Step 5: Test the Booking Form

1. Go to http://localhost:8081/booking-form
2. Fill in all required fields:
   - **Vehicle ID**: 1
   - **Vehicle Name**: Toyota Camry 2024
   - **Customer Name**: Your name
   - **Email**: your.email@example.com
   - **Phone**: +1-234-567-8900
   - **License Number**: DL123456789
   - **Pickup Date**: Select tomorrow's date
   - **Return Date**: Select a date after pickup
   - **Pickup Location**: New York
   - **Return Location**: New York
   - **Price Per Day**: 50.00
3. Click "Confirm Booking"
4. You should see a success message with the booking ID

### Step 6: View Your Bookings

1. Go to http://localhost:8081/bookings
2. You'll see all bookings in a table format
3. Click "View" on any booking to see full details

## Testing the API

### Using cURL (Terminal/CMD)

```bash
# Test GET all bookings
curl http://localhost:8081/api/bookings

# Test POST create booking
curl -X POST http://localhost:8081/api/bookings \
  -H "Content-Type: application/json" \
  -d "{\"vehicleId\":1,\"vehicleName\":\"Toyota Camry\",\"customerName\":\"Test User\",\"customerEmail\":\"test@example.com\",\"customerPhone\":\"+1234567890\",\"licenseNumber\":\"DL123\",\"pickupDate\":\"2026-03-15\",\"returnDate\":\"2026-03-20\",\"pickupLocation\":\"New York\",\"returnLocation\":\"New York\",\"pricePerDay\":50.00}"
```

### Using Postman

1. Import the collection using the endpoints in `API_DOCUMENTATION.md`
2. Set base URL to `http://localhost:8081`
3. Test each endpoint

## Common Issues and Solutions

### Issue 1: "Connection refused" error
**Solution**: Make sure MySQL is running
```bash
# Windows
net start MySQL80

# Mac/Linux
sudo systemctl start mysql
```

### Issue 2: "Access denied for user" error
**Solution**: Update username/password in `application.properties`

### Issue 3: "Port 8081 already in use"
**Solution**: Change port in `application.properties`:
```properties
server.port=8082
```

### Issue 4: Maven build fails
**Solution**: Make sure you have Java 17:
```bash
java -version
```

## Project Structure Overview

```
booking-service/
├── src/main/java/              # Java source code
│   └── com/vehiclerental/bookingservice/
│       ├── config/             # Configuration classes
│       ├── controller/         # REST & Web controllers
│       ├── dto/                # Data Transfer Objects
│       ├── model/              # JPA Entities
│       ├── repository/         # Database repositories
│       ├── service/            # Business logic
│       └── exception/          # Exception handlers
├── src/main/resources/
│   ├── application.properties  # Configuration
│   └── templates/              # HTML templates
├── pom.xml                     # Maven dependencies
└── README.md                   # Documentation
```

## Next Steps

1. ✅ Customize the booking form for your specific needs
2. ✅ Add more vehicle types
3. ✅ Integrate with other microservices
4. ✅ Add authentication and authorization
5. ✅ Deploy to production

## Support

For issues or questions:
1. Check the `README.md` for detailed documentation
2. Review `API_DOCUMENTATION.md` for API details
3. Check the console logs for error messages
4. Consult with your team members

---

**Happy Booking! 🚗💨**
