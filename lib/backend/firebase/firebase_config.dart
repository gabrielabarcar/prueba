import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCc1vmHpXNIgrX0vZdPCovs4WwI0tAXW4w",
            authDomain: "semana9lunes.firebaseapp.com",
            projectId: "semana9lunes",
            storageBucket: "semana9lunes.firebasestorage.app",
            messagingSenderId: "1077269579410",
            appId: "1:1077269579410:web:37b1b9438b5a965973084b",
            measurementId: "G-RNXDBRLQTF"));
  } else {
    await Firebase.initializeApp();
  }
}
