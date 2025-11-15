# Multi-Client Configuration Guide

This app supports configuration for multiple clients with different themes and identifiers.

## Configuration Options

The app can be configured using Dart environment variables at build time:

### 1. Client Identifier
Sets the unique identifier sent in API headers and determines the theme.

```bash
flutter build --dart-define=CLIENT_IDENTIFIER=your-client-id
```

### 2. API Base URL
Sets the backend API endpoint.

```bash
flutter build --dart-define=API_BASE_URL=https://api.example.com/api
```

### 3. App Name
Sets the application name displayed in the UI.

```bash
flutter build --dart-define=APP_NAME="Your App Name"
```

### 4. Debug Mode
Enables debug logging for API requests.

```bash
flutter build --dart-define=DEBUG_MODE=true
```

## Complete Build Examples

### Example 1: Default Client (Matatu Investor)
```bash
flutter build apk
```

### Example 2: Custom Client
```bash
flutter build apk \
  --dart-define=CLIENT_IDENTIFIER=client-two \
  --dart-define=APP_NAME="Client Two" \
  --dart-define=API_BASE_URL=https://client2.example.com/api
```

### Example 3: Development Build
```bash
flutter run \
  --dart-define=CLIENT_IDENTIFIER=matatu-investor-flutter \
  --dart-define=API_BASE_URL=http://localhost:5000/api \
  --dart-define=DEBUG_MODE=true
```

## Adding New Client Themes

To add a new client configuration:

1. Open `lib/config/theme_config.dart`
2. Add a new entry to the `_clientThemes` map:

```dart
'your-client-id': ClientTheme(
  primaryColor: Colors.purple,
  secondaryColor: Colors.purpleAccent,
  accentColor: Colors.amber,
  appBarColor: Colors.purple,
  backgroundColor: Colors.white,
  cardColor: Colors.white,
  textColor: Colors.black87,
  appName: 'Your Client Name',
),
```

## Environment Variables Reference

| Variable | Description | Default Value |
|----------|-------------|---------------|
| `CLIENT_IDENTIFIER` | Unique client ID sent in X-Client-Identifier header | `matatu-investor-flutter` |
| `API_BASE_URL` | Backend API base URL | `http://localhost:5000/api` |
| `APP_NAME` | Application display name | `Matatu Investor` |
| `DEBUG_MODE` | Enable debug logging | `true` |
| `OTP_RECIPIENT_PHONE` | Default OTP recipient phone | (empty) |

## Build Scripts

You can create shell scripts for different clients:

### build-client1.sh
```bash
#!/bin/bash
flutter build apk \
  --dart-define=CLIENT_IDENTIFIER=client-one \
  --dart-define=APP_NAME="Client One" \
  --dart-define=API_BASE_URL=https://client1.example.com/api \
  --dart-define=DEBUG_MODE=false
```

### build-client2.sh
```bash
#!/bin/bash
flutter build apk \
  --dart-define=CLIENT_IDENTIFIER=client-two \
  --dart-define=APP_NAME="Client Two" \
  --dart-define=API_BASE_URL=https://client2.example.com/api \
  --dart-define=DEBUG_MODE=false
```

## API Headers

The app automatically sends the following headers with all API requests:

- `Content-Type: application/json`
- `X-Client-Identifier: <CLIENT_IDENTIFIER value>`

The backend can use the `X-Client-Identifier` header to:
- Track which client is making requests
- Apply client-specific business logic
- Log and monitor client usage
- Implement client-specific features or restrictions
