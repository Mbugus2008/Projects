# Matatu Investor App

A Flutter mobile application for matatu (public transport vehicle) owners in Kenya to manage their investments, track vehicle performance, monitor loans, and view financial statistics.

## Features

- **Member Authentication**: Secure login with OTP verification
- **Vehicle Management**: Track multiple vehicles and their performance
- **Financial Tracking**: Monitor daily contributions, balances, and transactions  
- **Loan Management**: Track loan applications, repayments, and outstanding balances
- **Statistics Dashboard**: View financial statistics and reports
- **Multi-platform Support**: Android, iOS, and Web

## Recent Security Improvements ✅

This app has been updated with high-priority security and architecture improvements:

### 🔒 Security Enhancements
- **Secure OTP Generation**: Replaced `Random()` with `Random.secure()` for cryptographically secure OTP generation
- **Password Validation**: Added password strength validation requiring uppercase, lowercase, numbers, and special characters
- **Input Sanitization**: All user inputs are sanitized to prevent injection attacks
- **Phone Number Validation**: Added Kenyan phone number format validation
- **Removed Hardcoded Values**: Moved sensitive data to environment configuration

### 🏗️ Architecture Improvements
- **Updated Dependencies**: Upgraded to Flutter SDK 3.0+ and latest package versions
- **Standardized State Management**: Removed conflicting Riverpod code, now uses GetX consistently
- **Environment Configuration**: Added proper config management for API endpoints and sensitive data
- **Enhanced Error Handling**: Improved API error handling with timeout and connection management

### 📦 Dependencies Updated
- Flutter SDK: `>=3.0.0 <4.0.0` 
- All packages updated to latest compatible versions
- Added `crypto` package for secure password hashing
- Removed unused `flutter_riverpod` dependency

## Setup Instructions

### Prerequisites
- Flutter SDK 3.0 or higher
- Dart 3.0 or higher
- Android Studio / VS Code
- Android emulator or physical device

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd matatu_investor
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure environment variables**
   ```bash
   cp .env.example .env
   # Edit .env file with your actual API endpoints and configuration
   ```

4. **Run the application**
   ```bash
   flutter run
   ```

## Environment Configuration

Create a `.env` file in the root directory with the following variables:

```env
API_BASE_URL=http://your-api-server.com/api
OTP_RECIPIENT_PHONE=+254700000000
DEBUG_MODE=false
```

## Project Structure

```
lib/
├── config/           # App configuration and environment setup
├── common/           # Shared utilities, APIs, and controllers
├── helpers/          # Helper functions and security utilities
├── member/           # Member management and data models
├── vehicles/         # Vehicle management and tracking
├── loans/            # Loan management functionality
├── widgets/          # Custom UI components
└── main.dart         # App entry point
```

## Security Notes

⚠️ **Important**: This app now includes security improvements, but for production deployment:

1. Implement server-side password hashing (bcrypt/scrypt)
2. Set up proper SMS service for OTP delivery
3. Enable HTTPS for all API communications
4. Implement rate limiting for authentication attempts
5. Add proper session management and JWT tokens
6. Set up proper error logging and monitoring

## API Integration

The app connects to a REST API for:
- Member authentication and management
- Vehicle data synchronization
- Loan information retrieval
- Financial statistics calculation
- OTP delivery services

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes following the established patterns
4. Test thoroughly
5. Submit a pull request

## License

This project is private and proprietary.
