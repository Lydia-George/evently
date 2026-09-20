# Evently

Evently is a Flutter mobile application for discovering events, viewing event details, and managing personal event bookings.

The project is currently under development.

## Features

- User registration and login
- Authentication state management
- Browse available events
- Search and filter events
- View event details
- Create event bookings
- View personal bookings
- User profile and logout

## Tech Stack

- Flutter
- Dart
- Cubit / flutter_bloc
- Dio
- GetIt
- Firebase Authentication
- Ticketmaster Discovery API

## Architecture

The project follows a feature-based structure with separated responsibilities for presentation, state management, data access, networking, routing, and dependency injection.

```text
lib/
├── core/
│   ├── di/
│   ├── networking/
│   └── routes/
└── features/
    └── auth/
        └── register/
            ├── data/
            └── presentation/
```
## Project Management

Tasks and development progress are tracked on Trello:

[Evently — Product Development Board](https://trello.com/b/F7CvnF0U/evently-product-development)

