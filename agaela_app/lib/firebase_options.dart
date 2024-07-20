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
        return linux;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDb91FsQCmKW2ES0D-1zhoBLXblx_blgd8',
    appId: '1:423990235336:web:8c91ecc06af714fcb815fd',
    messagingSenderId: '423990235336',
    projectId: 'agaela-mock',
    authDomain: 'agaela-mock.firebaseapp.com',
    storageBucket: 'agaela-mock.appspot.com',
    measurementId: 'G-G5D10Z8CZR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCwFyYgAM_YJyePoE4GDo2L4cdSaiEFCdQ',
    appId: '1:423990235336:android:561cb35390d14846b815fd',
    messagingSenderId: '423990235336',
    projectId: 'agaela-mock',
    storageBucket: 'agaela-mock.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyClAxStnN7Da_7DvKq2lYZyd7nehQAoYPw',
    appId: '1:423990235336:ios:a962b5e25a2f86b3b815fd',
    messagingSenderId: '423990235336',
    projectId: 'agaela-mock',
    storageBucket: 'agaela-mock.appspot.com',
    iosBundleId: 'com.example.agaelaApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyClAxStnN7Da_7DvKq2lYZyd7nehQAoYPw',
    appId: '1:423990235336:ios:a962b5e25a2f86b3b815fd',
    messagingSenderId: '423990235336',
    projectId: 'agaela-mock',
    storageBucket: 'agaela-mock.appspot.com',
    iosBundleId: 'com.example.agaelaApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDb91FsQCmKW2ES0D-1zhoBLXblx_blgd8',
    appId: '1:423990235336:web:d7ff68e2e7b5d20db815fd',
    messagingSenderId: '423990235336',
    projectId: 'agaela-mock',
    authDomain: 'agaela-mock.firebaseapp.com',
    storageBucket: 'agaela-mock.appspot.com',
    measurementId: 'G-698GMTQ4N6',
  );

  static const FirebaseOptions linux = FirebaseOptions(
    apiKey: 'AIzaSyDb91FsQCmKW2ES0D-1zhoBLXblx_blgd8',
    appId: '1:423990235336:web:8c91ecc06af714fcb815fd',
    messagingSenderId: '423990235336',
    projectId: 'agaela-mock',
    authDomain: 'agaela-mock.firebaseapp.com',
    storageBucket: 'agaela-mock.appspot.com',
    measurementId: 'G-G5D10Z8CZR',
  );
}