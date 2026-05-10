# Bridge Management Flutter App
# This README provides a quick start guide for the mobile application.

## Getting Started

1. **Prerequisites**
   - Flutter SDK 3.x (stable channel)
   - Android Studio / VS Code with Flutter plugin
   - A device or emulator

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── main.dart
├── models/
│   └── bridge.dart
├── screens/
│   ├── bridge_list_screen.dart
│   ├── bridge_detail_screen.dart
│   └── maintenance_schedule_screen.dart
├── widgets/
│   └── bridge_card.dart
├── services/
│   └── api_service.dart
└── providers/
    └── bridge_provider.dart
```

## API
The app communicates with the backend FastAPI service at `http://localhost:8000`.

## License
MIT License
