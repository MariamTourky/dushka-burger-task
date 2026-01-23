# Trust Development - Flutter App

A Flutter project implementing a simple e-commerce flow for guest users using **Clean Architecture** and **Cubit** state management.  
The app demonstrates fetching categories, viewing product details with addons, and managing a guest cart.

---

## Features

- Categories Screen
- Product Details Screen
- View Cart Screen
- Guest user flow only
- Add / Remove items from cart
- Total price & tax calculation
- English & Arabic localization
- Proper error handling
- Clean and maintainable code

---

## Tech Stack

- **Flutter** 3.9.2
- **Dart SDK** ^3.9.2
- **State Management:** Cubit / Bloc
- **Dependency Injection:** injectable & get_it
- **API Calls:** Dio, Retrofit, Pretty Dio Logger
- **Localization:** easy_localization
- **Animations:** Lottie, Shimmer
- Clean Architecture
- easy_localization (i18n)
- Equatable
- JSON Serializable

---

## Requirements

- Flutter SDK >= 3.9.2
- Dart SDK >= 3.9.2

---

## Installation

1. Clone the repo:
git clone https://github.com/your-username/trust_development.git

2. Install dependencies:
flutter pub get


3. Generate JSON & Retrofit code:
flutter pub run build_runner build --delete-conflicting-outputs


4. Run the app:
flutter run

## Screenshots
Categories Screen Loading [assets/screenshots/loading category page.jpeg]
Categories Screen [assets/screenshots/category page.jpeg]
Product Details Loading [assets/screenshots/loading product details page.jpeg]
Product Details Screen [assets/screenshots/product details page.jpeg]
Product Details Page With Choosen Item [assets/screenshots/product details page with choosen item.jpeg]
Cart Screen[assets/screenshots/cart page.jpeg]

## Architecture Overview

UI (Flutter Widgets)
↓
Cubit (State Management)
↓
Use Cases (Domain Logic)
↓
Repository (Contract)
↓
Repository Impl (Data)
↓
Remote Data Source (API)
↓
Backend
Reverse Flow (Data Response)

Backend
↓
API Response (DTO)
↓
Mapper
↓
Domain Entity
↓
Cubit State
↓
UI Update

## Folder Structure
lib/
├── app/
│   ├── core/
│   ├── config/
│   
│
├── features/
│   ├── feature_name/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   ├── models/
│   │   │   ├── mappers/
│   │   │   └── repositories/
│   │   │
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   ├── repositories/
│   │   │   └── usecases/
│   │   │
│   │   └── presentation/
│   │       ├── cubit/
│   │       ├── pages/
│   │       └── widgets/
│
└── main.dart

## State Management

The app uses **flutter_bloc (Cubit)** for state management.

Each feature has its own Cubit responsible for:
- Fetching data
- Handling user actions
- Emitting UI states

A generic `BaseState<T>` is used to represent:
- Initial
- Loading
- Success
- Error

This ensures:
- Consistent UI behavior
- Cleaner Cubit logic
- Better error handling
  Data Mapping Strategy
- 
## Data Mapping

- API responses (DTOs) are never used directly in the UI
- Each response model has a mapper that converts it into a Domain Entity

Example:
ProductResponse → ProductEntity  
CartGetResponse → CartEntity

This keeps:
- Domain logic independent of APIs
- UI safe from backend changes
  Localization
- 
## Localization

- Implemented using **easy_localization**
- Supports English and Arabic
- Locale keys are generated automatically
- UI updates dynamically based on selected language
  Dependency Injection

## Why This Architecture?

✔ Clear separation of concerns  
✔ Scalable and maintainable  
✔ Easy to test  
✔ Feature isolation  
✔ Business logic independent of UI  
✔ Backend changes do not break UI


## Usage

1. Launch the application.
2. Browse available product categories.
3. Select a product to view its details and available add-ons.
4. Add products to the cart with the desired quantity and options.
5. Open the cart to review selected items.
6. Update item quantities or remove items as needed.
7. The total price and applicable taxes are calculated automatically in real time.


### GitHub Actions Workflow

The project uses **GitHub Actions** to automate the CI/CD pipeline.

Pipeline steps:
1. Checkout source code
2. Install Flutter SDK
3. Install dependencies
4. Run static analysis (`flutter analyze`)
5. Run tests (`flutter test`)
6. Build application artifacts
