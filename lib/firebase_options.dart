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
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBN6k_7CFAd_6Fu0XtmCGBcIs8VpLYfRxE',
    appId: '1:494700781950:web:02eb6b237983fece8e532f',
    messagingSenderId: '494700781950',
    projectId: 'teacheroranizer',
    authDomain: 'teacheroranizer.firebaseapp.com',
    storageBucket: 'teacheroranizer.appspot.com',
    measurementId: 'G-J9217KQ62K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDyu1gcfhYY7HtpFXcKj5tWS1HxXoxe0uY',
    appId: '1:494700781950:android:ca90ebc6a708ef1b8e532f',
    messagingSenderId: '494700781950',
    projectId: 'teacheroranizer',
    storageBucket: 'teacheroranizer.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC4VghX3AX-RndVEUOtaJsM8Cbs9CPDfCg',
    appId: '1:494700781950:ios:c9fae2536f0216068e532f',
    messagingSenderId: '494700781950',
    projectId: 'teacheroranizer',
    storageBucket: 'teacheroranizer.appspot.com',
    iosClientId: '494700781950-i6tv42vv6n7t6odrf16mqtthnmfktes4.apps.googleusercontent.com',
    iosBundleId: 'com.example.teacherOrganizer',
  );
}
