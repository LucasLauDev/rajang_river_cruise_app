# 🛥️ Rajang River Cruise & Heritage App

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![Architecture](https://img.shields.io/badge/Architecture-MVVM-FF6F00?logo=flutter&logoColor=white)](https://flutter.dev)
[![UI Framework](https://img.shields.io/badge/Material_Design-M3-7B1FA2?logo=materialdesign&logoColor=white)](https://m3.material.io)

An eco-tourism and heritage mobile application developed for the **Sibu Municipal Council** to promote tourism along Malaysia's longest river, the **Rajang River** in Sibu, Sarawak.

Built with **Flutter** using clean **MVVM Architecture** (`Model-View-ViewModel`), modular component decomposition, and dynamic orientation adaptability.

---

## ✨ Features

- 🛳️ **Interactive Booking & Trip Preferences**:
  - **Date Selection**: Interactive `showDatePicker` to reserve cruise dates.
  - **Cruise Package Dropdown**: Choose between *Private River Cruise*, *Sunset Cruise*, *Sunrise Cruise*, *Rural Cruise*, and *SMI Park Cruise*.
  - **Theme Switch**: Instant dynamic toggle between **Light Mode** and **Dark Mode**.

- 📞 **Action Bar Direct Integration**:
  - 📞 **CALL**: Launches phone dialer directly for inquiries (`084318005`).
  - 📍 **ROUTE**: Opens Google Maps with direct directions to [Sibu Waterfront Landmark](https://maps.app.goo.gl/CAMqotQbHxpvadzbA).
  - 📲 **SHARE**: Native sharing via `share_plus` to invite friends and family.

- ⭐ **Dynamic Star Rating Counter**:
  - Interactive rating counter that updates rating state in real-time using `ChangeNotifier`.

- 📱 **Responsive & Orientation Adaptive**:
  - **Portrait Mode**: Elegant single-column scrollable layout (`ListView`).
  - **Landscape Mode**: Responsive side-by-side split-pane layout (`Row` + `Expanded`).

---

## 🏗️ Architecture Overview (MVVM Pattern)

This project strictly adheres to clean code principles and the **Model-View-ViewModel (MVVM)** design pattern for clear separation of concerns:

```
lib/
├── models/
│   └── cruise_destination.dart         # Pure Data Class (Model)
├── viewmodels/
│   └── cruise_booking_viewmodel.dart    # Business Logic & State (ChangeNotifier)
├── views/
│   ├── cruise_booking_screen.dart       # Responsive Main View (Orientation Adaptable)
│   └── widgets/
│       ├── action_bar_widget.dart       # CALL (084318005), ROUTE (Google Maps), SHARE
│       ├── booking_controls_widget.dart  # Date Picker, Dropdown & Theme Switch
│       ├── description_widget.dart       # Padded Descriptive Paragraph
│       ├── header_image_widget.dart      # Hero Banner Image
│       └── title_section_widget.dart     # Title, Location & Interactive Rating
└── main.dart                            # Application Entry Point & ThemeData Engine
```

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (v3.10.8 or newer)
- [Android Studio](https://developer.android.com/studio) or VS Code with Flutter extension
- An Android Emulator or physical Android / iOS device

### Installation & Running

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/rajang_river_cruise_app.git
   cd rajang_river_cruise_app
   ```

2. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run Widget Tests**:
   ```bash
   flutter test
   ```

4. **Run the Application**:
   ```bash
   flutter run
   ```

---

## 🛠️ Built With

- **[Flutter](https://flutter.dev)** - Cross-platform UI toolkit
- **[Dart](https://dart.dev)** - Client-optimized language
- **[url_launcher](https://pub.dev/packages/url_launcher)** - Phone dialer & Google Maps navigation launching
- **[share_plus](https://pub.dev/packages/share_plus)** - Native sharing capabilities
- **[Material 3](https://m3.material.io)** - Modern design system with Light and Dark mode theme support

---

## 📄 License

This project is created for educational and practical lab assignment purposes (CSS3344 Mobile Application Development).
