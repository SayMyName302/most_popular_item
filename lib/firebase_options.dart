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
    apiKey: 'AIzaSyBu63VuO0tyZsYppL6dWQg1HKx0jGndYzs',
    appId: '1:555708727615:web:dc3bcfa660ced79684538a',
    messagingSenderId: '555708727615',
    projectId: 'tesapp-2aceb',
    authDomain: 'tesapp-2aceb.firebaseapp.com',
    storageBucket: 'tesapp-2aceb.appspot.com',
    measurementId: 'G-HKFM1MCSM0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDtCUFvV5LSpfHDvKtEZ-xPn4GRiZZH-vo',
    appId: '1:555708727615:android:53d4154df8747a3584538a',
    messagingSenderId: '555708727615',
    projectId: 'tesapp-2aceb',
    storageBucket: 'tesapp-2aceb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAMz0bUwIq-7Cqxe_RKzjTwbgomUYjXHyI',
    appId: '1:555708727615:ios:0f5e46d495cb12b384538a',
    messagingSenderId: '555708727615',
    projectId: 'tesapp-2aceb',
    storageBucket: 'tesapp-2aceb.appspot.com',
    iosClientId: '555708727615-nirdmk2v60vkjks5jrtp99bjeagndtd1.apps.googleusercontent.com',
    iosBundleId: 'com.example.popular',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAMz0bUwIq-7Cqxe_RKzjTwbgomUYjXHyI',
    appId: '1:555708727615:ios:f315b22e45cfb6da84538a',
    messagingSenderId: '555708727615',
    projectId: 'tesapp-2aceb',
    storageBucket: 'tesapp-2aceb.appspot.com',
    iosClientId: '555708727615-jh2f9duoqu13ru65grka7r73a0sv0mli.apps.googleusercontent.com',
    iosBundleId: 'com.example.popular.RunnerTests',
  );
}
