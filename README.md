# 🛍️ E-Commerce Flutter App

## 📖 Project Overview
This project is the Frontend mobile application for a comprehensive E-commerce platform. It is built using **Flutter** and integrates with a custom Backend RESTful API.

The primary focus of this repository is to demonstrate a scalable, maintainable, and modern mobile frontend architecture tailored for a seamless shopping experience.

## 🛠️ Tech Stack & Core Technologies
This project strictly follows a specific set of tools and libraries to maintain consistency:
* **Framework:** Flutter / Dart
* **Architecture:** Feature-first Layering (Data & Presentation layers)
* **State Management & Dependency Injection:** [Riverpod](https://riverpod.dev/) (using Code Generation)
* **Network / API Client:** [Dio](https://pub.dev/packages/dio) + [Retrofit](https://pub.dev/packages/retrofit)
* **Local Storage / Caching:** [Hive](https://pub.dev/packages/hive) (NoSQL)
* **Routing:** [go_router](https://pub.dev/packages/go_router)
* **JSON Serialization:** [Freezed](https://pub.dev/packages/freezed) + json_serializable

## 🏗️ Architecture & Folder Structure
The app uses a **Feature-Driven Architecture** combined with a simplified Clean Architecture approach (excluding the Domain layer to optimize for UI/UX focus and rapid development).

Each feature is entirely self-contained and divided into `data` and `presentation` layers.

```text
lib/
├── core/                       # App-wide shared resources
│   ├── network/                # Dio client setup, Interceptors
│   ├── routing/                # go_router configurations
│   ├── storage/                # Hive initialization & local DB keys
│   ├── theme/                  # Colors, Typography, UI constants
│   └── utils/                  # Helper functions, extensions
├── features/                   # Self-contained feature modules
│   ├── auth/                   
│   │   ├── data/               
│   │   │   ├── models/         # DTOs (Freezed/json_serializable)
│   │   │   ├── data_sources/   # Retrofit API interfaces, Hive local sources
│   │   │   └── repositories/   # Data fetching & error handling logic
│   │   └── presentation/       
│   │       ├── providers/      # Riverpod Notifiers/State management
│   │       ├── screens/        # Full-page UI (e.g., LoginScreen)
│   │       └── widgets/        # Feature-specific UI components
│   ├── cart/                   # (Similar structure to auth)
│   ├── product/                # (Similar structure to auth)
│   └── user_profile/           # (Similar structure to auth)
└── main.dart                   # Entry point, ProviderScope, initialization
```

## 🧠 Core Development Rules for Agents & Contributors
When generating code or adding features to this repository, strictly adhere to these rules:

* **State Management:** Always use **Riverpod** with `@riverpod` annotations (code generation). Do not use `StatefulWidget` for complex logic. Access providers via `ConsumerWidget` or `ConsumerStatefulWidget`.
* **API Communication:** Do not write manual HTTP requests. Define endpoints in an abstract class using **Retrofit** annotations (`@GET`, `@POST`) and let `build_runner` generate the implementation. Use **Dio** interceptors for auth tokens.
* **Data Models:** Use the **Freezed** package for immutable data classes and `json_serializable` for parsing Backend responses.
* **Caching Strategy:** 
    * Use **Hive** exclusively.
    * **Do cache:** Auth tokens, user preferences (theme/language), search history, and a lightweight list of the last 10 viewed products.
    * **Do NOT cache:** The entire product catalog.
* **Routing:** Always use `context.go()` or `context.push()` via **go_router**. Define all routes in `core/routing/app_router.dart`.
* **Testing:** Focus purely on **Unit Testing** for critical business logic (e.g., Cart price calculations, API Model parsing). Do not generate UI/Widget tests unless explicitly requested.

## 🚀 Getting Started

### Prerequisites
* **Flutter SDK** (Latest stable version)
* **Dart SDK**

### Installation & Code Generation
Because this project relies heavily on code generation (Riverpod, Retrofit, Freezed), you must run `build_runner` after cloning or making changes to models/providers.

1. **Clone the repository:**
   ```bash
   git clone <repository_url>
   ```
2. **Install dependencies:**
   ```bash
   flutter pub get
   ```
3. **Run code generation (Crucial step):**
   ```bash
   # Run once:
   dart run build_runner build --delete-conflicting-outputs

   # Or run in watch mode during active development:
   dart run build_runner watch --delete-conflicting-outputs
   ```
4. **Run the app:**
   ```bash
   flutter run
   ```
