# 🧭 Product Collection App

A Flutter application that demonstrates a clean, modular architecture using mock JSON data, offline storage, and modern navigation with `go_router`.  
The app showcases how to handle online/offline states, data persistence, and dynamic UI updates — focusing mainly on the **“My Collection”** and **“Details”** flows.

---

## 📱 Features

- View a list of **Products** from local JSON data  
- Navigate between screens using **GoRouter**
- **Offline-first** data handling (caches last fetched data)
- Auto “refresh” data when an internet connection is available
- Organized architecture using **BLoC pattern** for state management

---

## 🧩 Tech Stack

| Tool / Package | Purpose | Explanation |
|----------------|----------|-------------|
| `flutter_bloc` | State management | Provides clean separation of UI and logic using events & states. |
| `go_router` | Navigation | Handles routing and navigation declaratively with deep link support. |
| `shared_preferences` | Local caching | Stores and retrieves locally cached product JSON for offline use. |
| `connectivity_plus` | Internet detection | Detects online/offline status to decide when to fetch or use cached data. |
| `flutter_svg` | UI icons | Renders SVG assets used in UI for scalability and performance. |

---

## 🧠 Architecture Overview

The project follows a **clean layered architecture**:

```
lib/
 ┣ bloc/             → Business logic and state management
 ┣ data/             → Local JSON, models, repositories
 ┣ screens/          → UI presentation (MyCollection, Details, etc.)
 ┣ utils/            → Helper functions, connectivity check
 ┣ main.dart         → App entry point
```

- Data is first attempted to be fetched from the mock JSON (assets).  
- If internet is available, it refreshes and updates local cached data using `shared_preferences`.  
- When offline, the app loads the latest cached data.  
- This ensures consistent behavior in both online and offline modes.

---

## 📂 Mock Data

Mock data is stored in:
```
assets/mock_data/products.json
```

Sample structure:
```json
[
  {
    "id": 1,
    "name": "Product One",
    "description": "High-quality example item",
    "image": "assets/images/product1.png",
    "price": 29.99
  }
]
```

---

## ⚡ Task Notes

- **Time Spent:** 10h 12min  
- **Flutter Version:** Stable latest (3.24.x at the time of development)
- **Null Safety:** ✅ Fully enabled  
- **Animations:** Minimal transitions between pages using `go_router` transitions  

---

## 🔍 Template Improvements

I adjusted a few parts from the original Figma template for better flow and scalability:

1. **Navigation:** Used `go_router` instead of manual `Navigator` for clearer route definitions and deep link handling.
2. **Offline Support:** Replaced raw JSON reading each time with cached persistence logic — improves startup performance.
3. **Data Model Layer:** Added model parsing via `fromJson`/`toJson` for cleaner structure and type safety.

These adjustments improve maintainability and demonstrate scalable app structure.

---

## 🚀 Run Locally

1. Clone the repository:
   ```bash
   git clone <your-repo-url>
   cd product_app
   ```

2. Get dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

---

## 📬 Summary

This project focuses on demonstrating clean architecture, offline-first data handling, and scalable navigation setup within Flutter using BLoC.  
The result is a foundation-ready app that can easily scale into a production-grade solution.
