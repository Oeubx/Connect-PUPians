# Connect-PUPians (CPUP)

[![Flutter](https://img.shields.io/badge/Flutter-v3.0.0+-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Firebase](https://img.shields.io/badge/Firebase-Firestore%20%26%20Auth-FFCA28?logo=firebase&logoColor=black)](https://firebase.google.com)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

**Connect-PUPians (CPUP)** is a dedicated social networking, collaboration, and virtual classroom platform designed specifically for the community of the **Polytechnic University of the Philippines (PUP)**. Built with **Flutter** and **FlutterFlow**, the application enables students to connect, communicate, collaborate, and manage virtual classroom activities seamlessly.

---

## 🚀 Key Features

### 🏠 Social Feed & Timeline
- **Post Sharing:** Share announcements, questions, or campus news with text and media.
- **Interactions:** Like and comment on peers' posts to build an active student community.

### 💬 Real-Time Messaging Hub
- **Direct Messaging:** Secure 1-on-1 private conversations between students.
- **Group Chats:** Create community or class group chats with customizable names, descriptions, and avatars.
- **Chat Management:** Full settings options to add members, leave groups, or delete conversations.

### 🏫 Virtual Classrooms
- **Classroom Management:** Teachers or class representatives can create virtual classrooms and invite members.
- **Materials Portal:** Upload and organize lecture slides, syllabi, and readings.
- **Activities & Submissions:** Create class tasks/assignments. Students can submit their responses and monitor their progress.

### 👥 Collaborative Groups
- **Study Groups & Clubs:** Join or build dedicated groups for subject-specific topics, student clubs, or organizations.
- **Group Feeds:** Create and view posts specifically localized to individual study groups.

### 📚 Study & Peer Feedback Forum
- **Study Posts:** Share study topics, projects, or research outlines.
- **Structured Feedback:** Give ratings and reviews on shared study materials to foster peer-to-peer learning.

### 🔔 In-App Notifications
- Get notified in real-time about new direct messages, group chat alerts, classroom assignments, comments, and interactions.

---

## 🛠️ Tech Stack

- **Frontend:** [Flutter SDK](https://flutter.dev) (Dart)
- **UI Architecture:** [FlutterFlow](https://flutterflow.io)
- **Backend Services:**
  - **Firebase Authentication:** Handles secure signup, sign-in, and account verification (including Student Information System SIS integration).
  - **Cloud Firestore:** Real-time NoSQL database structured for chats, posts, classrooms, and user profiles.
  - **Firebase Storage:** Media upload storage (photos, classroom documents, and avatars).
  - **Cloud Functions:** Serverless background functions (e.g., automated user cleanups).
- **Navigation:** `GoRouter` for fast, responsive page routing.

---

## 📂 Codebase Structure

Here is a breakdown of the key directories within the `lib/` directory:

```bash
lib/
├── auth/                       # Firebase Auth integration & providers
│   ├── firebase_auth/          # Sign-in/sign-up utilities
│   └── auth_manager.dart       # Base authentication contracts
├── backend/                    # Backend database and configuration
│   ├── firebase/               # Firebase Options config
│   └── schema/                 # Firestore collection models (users, posts, chats, classes, etc.)
├── classes_folder/             # Virtual Classroom components & pages
│   ├── class_components/       # Modals for adding users, uploading files, etc.
│   ├── class_u_i/              # Main classroom details view
│   ├── classes/                # List of classrooms
│   └── mat_act_u_i/            # Materials and activities page
├── hpage/                      # Core social feed pages
│   ├── homepage/               # Global timeline of PUPian posts
│   └── whole_post_u_i/         # Detailed post view with comments
├── menu_contents/              # Settings, profile management, and study modules
│   ├── app_settings/           # App-wide visual & account options
│   ├── group/                  # Collaboration groups & circles
│   ├── study/                  # Study feedback forum
│   └── user/                   # User profile editing and public profiles
├── msgs/                       # Chat interfaces
│   ├── g_c_messages/           # Group chat UI and configuration
│   └── messages/               # Direct 1-on-1 messaging UI
└── notifications/              # Real-time notifications screen
```

---

## ⚙️ Setup and Installation

### 1. Prerequisites
- Install the [Flutter SDK](https://docs.flutter.dev/get-started/install) (version matching `>=3.0.0 <4.0.0` as defined in `pubspec.yaml`).
- Set up a [Firebase Project](https://console.firebase.google.com/) with:
  - **Authentication** (Email/Password enabled)
  - **Cloud Firestore**
  - **Firebase Storage**

### 2. Configure Firebase Credentials
Because this repository is public-ready, production credentials have been placeholderized. You need to supply your own Firebase configuration:

1. **Web Options:** Update the configuration placeholders inside:
   [lib/backend/firebase/firebase_config.dart](file:///c:/BiboyStuffs/Connect-PUPians/lib/backend/firebase/firebase_config.dart)
2. **Android Config:** Download your `google-services.json` from the Firebase console and place it at `android/app/google-services.json` (or customize the placeholders in the existing [android/app/google-services.json](file:///c:/BiboyStuffs/Connect-PUPians/android/app/google-services.json)).
3. **iOS Config:** Download your `GoogleService-Info.plist` from the Firebase console and place it at `ios/Runner/GoogleService-Info.plist` (or customize the placeholders in the existing [ios/Runner/GoogleService-Info.plist](file:///c:/BiboyStuffs/Connect-PUPians/ios/Runner/GoogleService-Info.plist)).

### 3. Run the App
Navigate to the project root and execute the following commands:

```bash
# Fetch the project dependencies
flutter pub get

# Run on a connected device/emulator
flutter run
```

---

## 📄 License
This project is licensed under the MIT License - see the LICENSE file for details.
