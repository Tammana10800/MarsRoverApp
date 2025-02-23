# MarsRoverApp

A SwiftUI-based iOS app that fetches and displays photos taken by NASA's Mars Rovers. The app supports offline caching using **Realm** and image caching for a seamless user experience.

---

## 📸 Features

- 🔥 Fetch Mars Rover photos via NASA API.
- 📡 Offline caching of data using **Realm**.
- 🖼️ Caching of data offline.
- 🌗 Dark mode support with user preferences stored.
- 💾 Persistent storage using **UserDefaults**.
- 🔍 Detailed view for individual rover photos.

---

## 🛠 Setup Instructions

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/Tammana10800/MarsRoverApp.git
   cd MarsRoverApp

2. **Ensure you have CocoaPods installed.**
   pod install

3. **open MarsRoverApp.xcworkspace**
4. **Run the app on Xcode Simulator or a real device.**

**Architectural Choices**
SwiftUI + MVVM:
Clear separation of concerns with ViewModels handling business logic and Views focusing on UI.

Realm for Offline Caching:
Allows data persistence and offline usage for rover photos and data.

URLSession for Networking:
Lightweight, native networking for fetching data.

Custom CachedAsyncImageView:
Uses for images and a custom caching layer to save images offline.

**External Libraries & Resources**
RealmSwift – Local database for offline caching.
SwiftUI – UI Framework.
NASA Mars Rover Photos API – Data source for rover images.

**Trade-Offs Made**
Image Caching Approach:
Opted for a simple file-based image cache instead of complex solutions like Kingfisher to reduce dependencies.

Error Handling:
Basic error messages are shown for failed API calls but could be enhanced with retry mechanisms.

