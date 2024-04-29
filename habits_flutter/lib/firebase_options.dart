// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBy2qWqxnhzfkJtCwJE-YnzIesRLUstXRQ',
    appId: '1:987703214480:android:42ac06651fc0f60ec97315',
    messagingSenderId: '987703214480',
    projectId: 'habits-2017-08-05',
    storageBucket: 'habits-2017-08-05.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAxCcplXLe3r55x24PHwixKAcrqhdrutao',
    appId: '1:987703214480:ios:0f64d0c16c4b6a68c97315',
    messagingSenderId: '987703214480',
    projectId: 'habits-2017-08-05',
    storageBucket: 'habits-2017-08-05.appspot.com',
    iosBundleId: 'com.habits.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAxCcplXLe3r55x24PHwixKAcrqhdrutao',
    appId: '1:987703214480:ios:a865b6345dcb79abc97315',
    messagingSenderId: '987703214480',
    projectId: 'habits-2017-08-05',
    storageBucket: 'habits-2017-08-05.appspot.com',
    iosBundleId: 'com.example.myApp.RunnerTests',
  );
}