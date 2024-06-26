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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyABrJdaVviNveP1VHxPhplPf_3F-pBcvqk',
    appId: '1:174242090546:web:8fb7c1c5d1d88d4757362b',
    messagingSenderId: '174242090546',
    projectId: 'kraftnight-91c02',
    authDomain: 'kraftnight-91c02.firebaseapp.com',
    storageBucket: 'kraftnight-91c02.appspot.com',
    measurementId: 'G-M9SB8KYZ47',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBZdWe6Gvjd9sB3IGzMogQWny0bUAWr6qM',
    appId: '1:174242090546:android:f2f57605faf21fdd57362b',
    messagingSenderId: '174242090546',
    projectId: 'kraftnight-91c02',
    storageBucket: 'kraftnight-91c02.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAp22MCZ2E4UiddhRDFa3wjUnVEM9cCxmk',
    appId: '1:174242090546:ios:41f9b0cf7bb52fde57362b',
    messagingSenderId: '174242090546',
    projectId: 'kraftnight-91c02',
    storageBucket: 'kraftnight-91c02.appspot.com',
    iosBundleId: 'com.example.kraftnightt',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAp22MCZ2E4UiddhRDFa3wjUnVEM9cCxmk',
    appId: '1:174242090546:ios:9d28c8fdd3e83eb057362b',
    messagingSenderId: '174242090546',
    projectId: 'kraftnight-91c02',
    storageBucket: 'kraftnight-91c02.appspot.com',
    iosBundleId: 'com.example.kraftnightt.RunnerTests',
  );
}
