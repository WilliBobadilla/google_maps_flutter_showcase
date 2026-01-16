import 'package:firebase_core/firebase_core.dart';
import 'package:google_maps_showcase/firebase_options.dart'
    as default_firebase_options;

class FirebaseServices {
  static Future<void> initializeFCM() async {
    final firebaseOptions =
        default_firebase_options.DefaultFirebaseOptions.currentPlatform;
    await Firebase.initializeApp(options: firebaseOptions);
  }
}
