import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCzxbk_5SMU_HzgI6hGSuGtr4p9B_gdjEw",
            authDomain: "chatbot-2300b.firebaseapp.com",
            projectId: "chatbot-2300b",
            storageBucket: "chatbot-2300b.appspot.com",
            messagingSenderId: "414418197159",
            appId: "1:414418197159:web:5899ef8a165345e3065982",
            measurementId: "G-TWVREZ1GHR"));
  } else {
    await Firebase.initializeApp();
  }
}
