import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAcjUYWhAC_-ZbHpdaYa8Uu7mXH2_fSit4",
            authDomain: "wwms-web-app.firebaseapp.com",
            projectId: "wwms-web-app",
            storageBucket: "wwms-web-app.appspot.com",
            messagingSenderId: "270288836835",
            appId: "1:270288836835:web:ddb1f2341446f02ae4cdd6",
            measurementId: "G-JCS50XHSBV"));
  } else {
    await Firebase.initializeApp();
  }
}
