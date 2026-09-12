# KN Store Mobile App

A mobile e-commerce application built with Flutter.

---

## 🚀 How to Run the App

### Prerequisites
- **Flutter SDK**: ^3.13.1 (or latest version)
- **Dart SDK**
- **Android Studio / VS Code** (with Flutter & Dart extensions)
- **Emulator** (Android/iOS) or **Physical Device**

### Steps to Run
1. **Clone repository & navigate to project directory:**
   ```bash
   git clone https://github.com/my-khoirunnisa/kn_store_mobile_app.git
   cd kn_store_app
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. *(Optional)* **Generate App Icon:**
   ```bash
   dart run icons_launcher:create
   ```

4. **Run the application:**
   ```bash
   flutter run
   ```

---

## 🛠️ Tech Stack Used

- **Framework**: [Flutter](https://flutter.dev/) (Dart SDK ^3.13.1)
- **State Management**: [`provider`](https://pub.dev/packages/provider)
- **HTTP & Networking**: [`dio`](https://pub.dev/packages/dio)
- **Icons**: [`phosphoricons_flutter`](https://pub.dev/packages/phosphoricons_flutter), `cupertino_icons`
- **UI & Effects**: [`shimmer`](https://pub.dev/packages/shimmer)
- **Typography**: Custom Font (Plus Jakarta Sans)
- **App Icon Generator**: [`icons_launcher`](https://pub.dev/packages/icons_launcher)
- **Code Quality & Linter**: `flutter_lints`

---

## 🤖 AI Usage in Project

The following AI tools and generated assets/code were utilized in this project:

- **Gemini**: Used for generating the app icon image.
- **Stitch**: Used for generating the UI Figma design file.
- **AI Code Generation**:
  - [`lib/core/utils/price_utils.dart`]: `calculateOriginalPrice` helper logic.

---

## 🏛️ Architecture Decisions

This application adopts a **Feature-First Architecture** combined with **Clean Architecture** principles:

- **`lib/core/`**: Houses global modules including theme configurations (`theme/`), navigation routing (`routes/`), networking client (`network/`), utilities (`utils/`), constants (`constants/`), and reusable UI components (`widgets/`).
- **`lib/features/`**: Each feature is modularized into dedicated folders (e.g., `splash_screen`, `home_screen`, `detail_screen`), divided into architectural layers:
  - **`data/`**: Data providers, API calls, and repository implementation.
  - **`domain/`**: Data models and business entities.
  - **`presentation/`**: Screen UIs and feature-specific widgets.
  - **`providers/`**: State managers based on `ChangeNotifier` to separate business logic from the UI.
- **Routing**: Centralized within `AppRouter` (`lib/core/routes/app_router.dart`) for structured and declarative navigation across screens.

---

## 📋 Incomplete Tasks / TODO Checklist
**FINAL DURATION = 09.21 AM GMT+8 until 12.08 PM GMT+8**

- [x] 1. repo initialization (start 12/09/2026 09:21 GMT+8, done 12/09/2026 09:25 GMT+8)
- [x] 2. define project structure (start 12/09/2026 09:25 GMT+8, done 12/09/2026 09:32 GMT+8)
- [x] 3. core (start 12/09/2026 09:33 GMT+8)
    - [x] generate icon (done 12/09/2026 09:39 GMT+8)
    - [x] app theme colors (done 12/09/2026 09:44 GMT+8)
    - [x] spacing (done 12/09/2026 09:44 GMT+8)
    - [x] text style (done 12/09/2026 09:44 GMT+8)
    - [x] android manifest internet permissions (done 12/09/2026 09:47 GMT+8)
- [x] 4. dio setup (start 12/09/2026 09:48 GMT+8, done 12/09/2026 09:55 GMT+8)
- [x] 5. splash screen (start 12/09/2026 09:56 GMT+8, done 12/09/2026 10:15 GMT+8)
- [x] 6. home screen (start 12/09/2026 10:16 GMT+8)
    - [x] setup global widget empty state, error state, network image (done 12/09/2026 10:36 GMT+8)
    - [x] setup services (done 12/09/2026 10:41 GMT+8)
    - [x] UI & API Integration - Header [search, brand information] (done 12/09/2026 10:57 GMT+8)
    - [x] UI & API Integration - Product list (done 12/09/2026 11:35 GMT+8)
- [x] 7. detail screen phase 1 (start 12/09/2026 11:35 GMT+8)
    - [x] API & Services integration (done 12/09/2026 11:41 GMT+8)
    - [x] UI Integration (done 12/09/2026 12:07 GMT+8)
- [ ] 8. detail screen phase 2 
    - [ ] review section
    - [ ] dimention section
    - [ ] action add to cart based on minimum purchase
- [ ] 9. cart screen
- [ ] 10. unit test
