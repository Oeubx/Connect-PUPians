import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "YOUR_FIREBASE_API_KEY",
            authDomain: "YOUR_FIREBASE_AUTH_DOMAIN",
            projectId: "YOUR_FIREBASE_PROJECT_ID",
            storageBucket: "YOUR_FIREBASE_STORAGE_BUCKET",
            messagingSenderId: "YOUR_FIREBASE_MESSAGING_SENDER_ID",
            appId: "YOUR_FIREBASE_APP_ID",
            measurementId: "YOUR_FIREBASE_MEASUREMENT_ID"));
  } else {
    await Firebase.initializeApp();
  }
}
