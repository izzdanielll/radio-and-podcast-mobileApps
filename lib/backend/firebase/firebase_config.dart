import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDHu4tcpCjttw2-pgWpwmBm9K4a0GBAMrc",
            authDomain: "onlineradioapps-93b71.firebaseapp.com",
            projectId: "onlineradioapps-93b71",
            storageBucket: "onlineradioapps-93b71.appspot.com",
            messagingSenderId: "861037769892",
            appId: "1:861037769892:web:db09d59f85ace3a9e06231",
            measurementId: "G-ZD15G2WZQ8"));
  } else {
    await Firebase.initializeApp();
  }
}
