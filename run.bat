@echo off
echo ================================
echo  Starting Booking Service...
echo ================================
echo.
echo Make sure XAMPP MySQL is running!
echo.
echo The application will start on: http://localhost:8081
echo.
echo Press Ctrl+C to stop the server
echo.
echo ================================

mvnw.cmd spring-boot:run
