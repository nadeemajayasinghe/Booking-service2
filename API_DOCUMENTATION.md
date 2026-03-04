# Booking Service - API Testing Guide

## Base URL
```
http://localhost:8081
```

## 1. Create a New Booking

### Request
```http
POST /api/bookings
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

### Response (201 Created)
```json
{
  "id": 1,
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
  "numberOfDays": 5,
  "pricePerDay": 50.00,
  "totalAmount": 250.00,
  "status": "PENDING",
  "specialRequests": "GPS navigation required",
  "createdAt": "2026-03-04T10:30:00",
  "updatedAt": "2026-03-04T10:30:00"
}
```

## 2. Get All Bookings

### Request
```http
GET /api/bookings
```

### Response (200 OK)
```json
[
  {
    "id": 1,
    "vehicleId": 1,
    "vehicleName": "Toyota Camry 2024",
    "customerName": "John Doe",
    "numberOfDays": 5,
    "totalAmount": 250.00,
    "status": "PENDING",
    ...
  }
]
```

## 3. Get Booking by ID

### Request
```http
GET /api/bookings/1
```

### Response (200 OK)
```json
{
  "id": 1,
  "vehicleId": 1,
  "vehicleName": "Toyota Camry 2024",
  ...
}
```

## 4. Get Bookings by Customer Email

### Request
```http
GET /api/bookings/customer/john.doe@example.com
```

## 5. Get Bookings by Vehicle ID

### Request
```http
GET /api/bookings/vehicle/1
```

## 6. Get Bookings by Status

### Request
```http
GET /api/bookings/status/CONFIRMED
```

## 7. Update Booking Status

### Request
```http
PUT /api/bookings/1/status?status=CONFIRMED
```

### Response (200 OK)
```json
{
  "id": 1,
  "status": "CONFIRMED",
  ...
}
```

## 8. Check Vehicle Availability

### Request
```http
GET /api/bookings/check-availability?vehicleId=1&pickupDate=2026-03-15&returnDate=2026-03-20
```

### Response (200 OK)
```json
{
  "available": true
}
```

## 9. Delete Booking

### Request
```http
DELETE /api/bookings/1
```

### Response (200 OK)
```json
{
  "message": "Booking deleted successfully"
}
```

## Status Values

- `PENDING` - Booking request submitted
- `CONFIRMED` - Booking confirmed
- `IN_PROGRESS` - Vehicle picked up
- `COMPLETED` - Booking completed
- `CANCELLED` - Booking cancelled

## Error Responses

### 400 Bad Request
```json
{
  "error": "Return date must be after pickup date"
}
```

### 404 Not Found
```json
{
  "error": "Booking not found with id: 1"
}
```

### 500 Internal Server Error
```json
{
  "error": "An error occurred while creating the booking"
}
```
