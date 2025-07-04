// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///// Example:
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
    apiKey: 'AIzaSyD6RE5yC37H_oACV8Vf7r0E9epD_v_k6Tg',
    appId: '1:882317732270:web:7efd5aba7b4fb7a2b4403f',
    messagingSenderId: '882317732270',
    projectId: 'evently-6e7d6',
    authDomain: 'evently-6e7d6.firebaseapp.com',
    storageBucket: 'evently-6e7d6.firebasestorage.app',
    measurementId: 'G-9BFS5CQWST',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDQAVN2BuFbQC7KdNS7k_4DgcuRvBQdfi4',
    appId: '1:882317732270:android:004d1f00796a8f60b4403f',
    messagingSenderId: '882317732270',
    projectId: 'evently-6e7d6',
    storageBucket: 'evently-6e7d6.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDzo0QNfrV5d4w1o_ztE9Sl5exgjBfSVeg',
    appId: '1:882317732270:ios:0a039606e59c9002b4403f',
    messagingSenderId: '882317732270',
    projectId: 'evently-6e7d6',
    storageBucket: 'evently-6e7d6.firebasestorage.app',
    iosClientId: '882317732270-s6e03jdd18t5arbb610d924m7v4869q6.apps.googleusercontent.com',
    iosBundleId: 'com.example.evently',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDzo0QNfrV5d4w1o_ztE9Sl5exgjBfSVeg',
    appId: '1:882317732270:ios:0a039606e59c9002b4403f',
    messagingSenderId: '882317732270',
    projectId: 'evently-6e7d6',
    storageBucket: 'evently-6e7d6.firebasestorage.app',
    iosClientId: '882317732270-s6e03jdd18t5arbb610d924m7v4869q6.apps.googleusercontent.com',
    iosBundleId: 'com.example.evently',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD6RE5yC37H_oACV8Vf7r0E9epD_v_k6Tg',
    appId: '1:882317732270:web:372a40e9fe2201b9b4403f',
    messagingSenderId: '882317732270',
    projectId: 'evently-6e7d6',
    authDomain: 'evently-6e7d6.firebaseapp.com',
    storageBucket: 'evently-6e7d6.firebasestorage.app',
    measurementId: 'G-EDQGVCJ2GT',
  );

}