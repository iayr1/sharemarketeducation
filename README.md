---

# Edtech App Documentation

## Table of Contents

1. [Introduction](#introduction)
2. [Folder Structure](#folder-structure)
3. [Models](#models)
    - [Bookmark](#bookmark)
    - [Course](#course)
    - [Module](#module)
    - [User](#user)
4. [Providers](#providers)
    - [AuthProvider](#authprovider)
    - [BookmarkProvider](#bookmarkprovider)
    - [CourseProvider](#courseprovider)
5. [Screens](#screens)
    - [Auth Screens](#auth-screens)
    - [Dashboard Screens](#dashboard-screens)
    - [Widgets](#widgets)
6. [Services](#services)
    - [Authentication Service](#authentication-service)
    - [Bookmark Service](#bookmark-service)
    - [Course Service](#course-service)
7. [Utils](#utils)
    - [Constants](#constants)
    - [Navigation](#navigation)
8. [Dependencies](#dependencies)

## 1. Introduction

The Edtech App is a mobile application designed to provide educational content to users. It utilizes Flutter for the frontend development and integrates with Firebase services for authentication and data storage.

## 2. Folder Structure

The project follows a modular and organized folder structure to enhance maintainability and scalability.

- **models**: Contains data models representing entities in the application.
- **providers**: Manages the state of the application using the Provider package.
- **screens**: Defines UI screens of the application.
- **services**: Implements business logic and integrates with external services.
- **utils**: Holds utility functions and constants.

## 3. Models

### Bookmark

Represents a bookmark entity within the application.

```dart
class Bookmark {
  // Properties and methods
}
```

### Course

Represents a course entity within the application.

```dart
class Course {
  // Properties and methods
}
```

### Module

Represents a module entity within a course.

```dart
class Module {
  // Properties and methods
}
```

### User

Represents a user entity within the application.

```dart
class User {
  // Properties and methods
}
```

## 4. Providers

### AuthProvider

Manages user authentication state.

```dart
class AuthProvider {
  // Properties and methods
}
```

### BookmarkProvider

Manages bookmark-related state.

```dart
class BookmarkProvider {
  // Properties and methods
}
```

### CourseProvider

Manages course-related state.

```dart
class CourseProvider {
  // Properties and methods
}
```

## 5. Screens

### Auth Screens

- **Login Screen**: Handles user login.
- **Signup Screen**: Manages user registration.

### Dashboard Screens

- **Course Player Screen**: Displays course content, modules, and bookmarks.
- **Dashboard Courses Screen**: Shows enrolled courses on the dashboard.

### Widgets

- **Bookmark List Widget**: Displays a list of bookmarks.
- **Dashboard Screen Course Card**: Represents a course card on the dashboard.
- **Module List Widget**: Renders a list of modules.
- **Video Player Widget**: Manages video playback.

## 6. Services

### Authentication Service

Handles user authentication using Firebase Auth.

```dart
class AuthenticationService {
  // Methods for authentication
}
```

### Bookmark Service

Manages bookmark-related functionality.

```dart
class BookmarkService {
  // Methods for bookmark operations
}
```

### Course Service

Handles course-related logic and integrates with Firebase services.

```dart
class CourseService {
  // Methods for course operations
}
```

## 7. Utils

### Constants

Holds constant values used throughout the application.

```dart
class Constants {
  // Constant values
}
```

### Navigation

Defines routes and navigation logic.

```dart
class Navigation {
  // Route generation and navigation methods
}
```

## 8. Dependencies

- **cloud_firestore**: ^4.8.2
- **firebase_auth**: ^4.6.3
- **chewie**: ^1.7.1
- **provider**: ^6.1.1

---

This documentation provides an overview of the Edtech App's structure and key components. For more detailed information, refer to the individual files and their documentation within the project.





[//]: # (# edtech_app)

[//]: # ()
[//]: # (A new Flutter project.)

[//]: # ()
[//]: # (## Getting Started)

[//]: # ()
[//]: # (This project is a starting point for a Flutter application.)

[//]: # ()
[//]: # (A few resources to get you started if this is your first Flutter project:)

[//]: # ()
[//]: # (- [Lab: Write your first Flutter app]&#40;https://docs.flutter.dev/get-started/codelab&#41;)

[//]: # (- [Cookbook: Useful Flutter samples]&#40;https://docs.flutter.dev/cookbook&#41;)

[//]: # ()
[//]: # (For help getting started with Flutter development, view the)

[//]: # ([online documentation]&#40;https://docs.flutter.dev/&#41;, which offers tutorials,)

[//]: # (samples, guidance on mobile development, and a full API reference.)
