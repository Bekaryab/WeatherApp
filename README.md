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


##  App Demo

<p align="center">
  https://github.com/user-attachments/assets/27250df4-35e2-42f8-aaa8-3f261a04a635
</p>
##  Preview

<p align="center">
  <img src="https://github.com/user-attachments/assets/3534bfa5-b758-4546-a069-49ab5d74d78c" width="250">
  <img src="https://github.com/user-attachments/assets/a730067b-e248-44b0-b98d-8ebeab6a1ac0" width="250">
  <img src="https://github.com/user-attachments/assets/a8abde14-e746-4e78-b461-f2054ef1260b" width="250">
  <img src="https://github.com/user-attachments/assets/c9fadf13-10b1-475a-84b4-3fec0a292659" width="250">
</p>
