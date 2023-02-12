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
    apiKey: 'AIzaSyAlUnF95tRUSZsdBe_1IWVvWNTl3NU98eQ',
    appId: '1:861877000701:web:b48015eea5e1a7c251e194',
    messagingSenderId: '861877000701',
    projectId: 'sfmaflutterapp',
    authDomain: 'sfmaflutterapp.firebaseapp.com',
    storageBucket: 'sfmaflutterapp.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD8pHMjXeHQgrFoFAS8HetnAaZoZWyok-8',
    appId: '1:861877000701:android:78487feaea5fd26251e194',
    messagingSenderId: '861877000701',
    projectId: 'sfmaflutterapp',
    storageBucket: 'sfmaflutterapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC2qqX5GbXz73Oqle7OY1Te_o3cqPvNiro',
    appId: '1:861877000701:ios:9b712c3224cb333751e194',
    messagingSenderId: '861877000701',
    projectId: 'sfmaflutterapp',
    storageBucket: 'sfmaflutterapp.appspot.com',
    iosClientId: '861877000701-2t1q9nsuje4t98dieabh9uk60ubh7q70.apps.googleusercontent.com',
    iosBundleId: 'com.example.sfma',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC2qqX5GbXz73Oqle7OY1Te_o3cqPvNiro',
    appId: '1:861877000701:ios:9b712c3224cb333751e194',
    messagingSenderId: '861877000701',
    projectId: 'sfmaflutterapp',
    storageBucket: 'sfmaflutterapp.appspot.com',
    iosClientId: '861877000701-2t1q9nsuje4t98dieabh9uk60ubh7q70.apps.googleusercontent.com',
    iosBundleId: 'com.example.sfma',
  );
}
