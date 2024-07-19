// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAGKchFdrBlB1kXPS1eHz90ogLklU8aYEI',
    appId: '1:1059083323815:web:02d213a26501e20aa74e82',
    messagingSenderId: '1059083323815',
    projectId: 'tekmob-kelompok',
    authDomain: 'tekmob-kelompok.firebaseapp.com',
    storageBucket: 'tekmob-kelompok.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAb8mCxEJlZRo7-Fo_VKOAZ6sWSE1_I8Vk',
    appId: '1:1059083323815:android:272aacd073cbe3eea74e82',
    messagingSenderId: '1059083323815',
    projectId: 'tekmob-kelompok',
    storageBucket: 'tekmob-kelompok.appspot.com',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAGKchFdrBlB1kXPS1eHz90ogLklU8aYEI',
    appId: '1:1059083323815:web:1a9a6b363b60d25fa74e82',
    messagingSenderId: '1059083323815',
    projectId: 'tekmob-kelompok',
    authDomain: 'tekmob-kelompok.firebaseapp.com',
    storageBucket: 'tekmob-kelompok.appspot.com',
  );
}