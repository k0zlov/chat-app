
### Chat App

Welcome to the Chat App repository! This project is a Flutter-based chat application that enables communication between users. Below are the key details about the project:

#### Table of Contents
1. [Overview](#overview)
2. [Features](#features)
3. [Backend](#backend)
4. [Caching Mechanisms](#caching-mechanisms)
5. [Getting Started](#getting-started)
6. [Dependencies](#dependencies)
7. [Pictures](#pictures)

### Overview
The Chat App is designed to provide a robust platform for users to chat with each other. It supports various features such as creating chats, sending messages, and managing contacts.

### Features

- **Real-time Messaging:** Ssend and receive messages with friends.

- **User Authentication:** Secure login and registration system utilizing best practices for user data protection. Users can register, log in, and manage their profiles with ease.

- **Chat Management:** Create, edit, and delete chat groups. Users can form chat groups, add or remove participants, and manage group settings effortlessly.

- **Theming:** Support for light and dark themes, allowing users to switch between modes based on their preference or system settings. The app offers a visually appealing interface in both themes.

- **Search Functionality:** Easily search through chats and messages. Users can quickly find specific conversations or messages using the search feature.

### Backend
This repository serves as the frontend for the Chat App. For the backend, please refer to the [Chat Server repository](https://github.com/k0zlov/chat-server). The backend handles all the server-side operations, including user authentication, message handling, and data storage.

### Caching Mechanisms
To enhance the performance and user experience, the Chat App employs several caching mechanisms:
- **Chats**: Local caching of chats to reduce server requests and improve loading times.
- **Messages**: Caching messages locally to enable offline access and faster message retrieval.
- **Contacts**: Contacts are cached to allow quick access and management of user contacts without frequent server calls.

### Getting Started
To get started with the Chat App, follow these steps:
1. Clone the repository:
   ```bash
   git clone https://github.com/k0zlov/chat-app.git
   ```
2. Navigate to the project directory:
   ```bash
   cd chat-app
   ```
3. Install the dependencies:
   ```bash
   flutter pub get
   ```
4. Run the application:
   ```bash
   flutter run
   ```

### Dependencies
The Chat App relies on several dependencies to function correctly. Key dependencies include:
- `cupertino_icons`
- `dartz`
- `dio`
- `flutter_bloc`
- `freezed`
- `freezed_annotation`
- `get_it`
- `go_router`
- `sqflite`
- and more...

Refer to the [pubspec.yaml](https://github.com/k0zlov/chat-app/blob/main/pubspec.yaml) file for a complete list of dependencies.

### Pictures
The screenshots of the application.

## Chats
<img alt="img.png" src="https://github.com/k0zlov/chat-app/blob/main/assets/chats.png" width="400"/>

## Contacts
<img alt="img.png" src="https://github.com/k0zlov/chat-app/blob/main/assets/contacts.jpg" width="400"/>

## Settings
<img alt="img.png" src="https://github.com/k0zlov/chat-app/blob/main/assets/settings.jpg" width="400"/>

## Chat
<img alt="img.png" src="https://github.com/k0zlov/chat-app/blob/main/assets/chat_messages.jpg" width="400"/>

## Chat Details
<img alt="img.png" src="https://github.com/k0zlov/chat-app/blob/main/assets/chat_details.jpg" width="400"/>

## Chat Details Expanded
<img alt="img.png" src="https://github.com/k0zlov/chat-app/blob/main/assets/chat_details_expanded.jpg" width="400"/>
