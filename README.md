# Weather App (iOS / SwiftUI)

A beautifully designed iOS weather application built using modern **SwiftUI** and **MVVM architecture**.  
This is my second iOS project, created to strengthen my skills in networking, state management, and Swift concurrency.

---
##  Features

- 🌤 **Current Weather**  
  Get real-time temperature, weather conditions, and dynamic weather icons for any city.
- 📅 **5-Day Forecast**  
  View upcoming weather in a clean and scrollable grid layout.
- 🔍 **City Search**  
  Search for any city and instantly get updated weather data.
- 💾 **Data Persistence**  
  The app saves the last searched city using `UserDefaults` and loads it on launch.
- 🔄 **Custom Navigation**  
  Implemented a custom `AppRouter` using `@EnvironmentObject` for programmatic navigation.
---

##  Tech Stack

- **UI Framework:** SwiftUI  
- **Architecture:** MVVM (Model-View-ViewModel)  
- **Concurrency:** async/await  
- **Networking:** URLSession + JSONDecoder  
- **State Management:**  
  `@StateObject`, `@ObservedObject`, `@Published`, `@EnvironmentObject`  
- **Data Storage:** UserDefaults  
- **API:** OpenWeatherMap API  

---
## 🎬 App Demo

https://github.com/user-attachments/assets/27250df4-35e2-42f8-aaa8-3f261a04a635
## Screenshots & Demo

<p align="center">
  <img src="https://github.com/user-attachments/assets/89c312cd-35d2-49c2-859d-65a23b9d9168" width="250">
  <img src="https://github.com/user-attachments/assets/4178e768-a5d1-485a-a274-db6c2e2e7a6b" width="250">
  <img src="https://github.com/user-attachments/assets/8adc1b7f-cd56-42f6-a527-2e7a721c1852" width="250">
</p>

#  Getting Started

# 1. Clone the repository
```bash
git clone https://github.com/your-username/WeatherApp.git

### 2. Open in Xcode

Open the `.xcodeproj` file in Xcode.
---
### 3. Add your API key

Go to `WeatherApi.swift` and replace:

```swift
private let apiKey = "YOUR_API_KEY_HERE"

---




