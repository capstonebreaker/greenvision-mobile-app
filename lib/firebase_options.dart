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
    apiKey: 'AIzaSyC00kdswkCHbmMb6f_i5KsdCNGQ_E6BkMg',
    appId: '1:295350347304:web:8021e98dcbfd2e1c38f71d',
    messagingSenderId: '295350347304',
    projectId: 'green-vision-3ca97',
    authDomain: 'green-vision-3ca97.firebaseapp.com',
    storageBucket: 'green-vision-3ca97.firebasestorage.app',
    measurementId: 'G-89Y034ZGMF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCr0KeDx9jZXh7MI4vfgtSuhE_7p0NViLs',
    appId: '1:295350347304:android:4f07e0e5250d2cf438f71d',
    messagingSenderId: '295350347304',
    projectId: 'green-vision-3ca97',
    storageBucket: 'green-vision-3ca97.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB8XNT55tnSYYGrSntLaS9NxxheIs8jZIg',
    appId: '1:295350347304:ios:5a356f6a031372ac38f71d',
    messagingSenderId: '295350347304',
    projectId: 'green-vision-3ca97',
    storageBucket: 'green-vision-3ca97.firebasestorage.app',
    iosBundleId: 'com.example.greenVision',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB8XNT55tnSYYGrSntLaS9NxxheIs8jZIg',
    appId: '1:295350347304:ios:5a356f6a031372ac38f71d',
    messagingSenderId: '295350347304',
    projectId: 'green-vision-3ca97',
    storageBucket: 'green-vision-3ca97.firebasestorage.app',
    iosBundleId: 'com.example.greenVision',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC00kdswkCHbmMb6f_i5KsdCNGQ_E6BkMg',
    appId: '1:295350347304:web:ffe98ee8d251dd3538f71d',
    messagingSenderId: '295350347304',
    projectId: 'green-vision-3ca97',
    authDomain: 'green-vision-3ca97.firebaseapp.com',
    storageBucket: 'green-vision-3ca97.firebasestorage.app',
    measurementId: 'G-G51EPBYL7R',
  );
}
