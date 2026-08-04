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
    apiKey: 'AIzaSyDmsiSYVYHjmB1nXtRSVG3k-MWqxCrIHTA',
    appId: '1:321786060169:web:d062b86945f877279f5558',
    messagingSenderId: '321786060169',
    projectId: 'ashif-web-portfolio',
    authDomain: 'ashif-web-portfolio.firebaseapp.com',
    storageBucket: 'ashif-web-portfolio.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAKc0hcyvXVOB10rHEi5TN6yav16dWMjfU',
    appId: '1:321786060169:android:9ee68733777b7c8e9f5558',
    messagingSenderId: '321786060169',
    projectId: 'ashif-web-portfolio',
    storageBucket: 'ashif-web-portfolio.firebasestorage.app',
  );
  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBsCEZJW4cygWLblDqvn1LTZhzIhDfYMEM',
    appId: '1:321786060169:ios:ae35a853bb0c827e9f5558',
    messagingSenderId: '321786060169',
    projectId: 'ashif-web-portfolio',
    storageBucket: 'ashif-web-portfolio.firebasestorage.app',
    iosBundleId: 'com.example.webAshi',
  );
  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBsCEZJW4cygWLblDqvn1LTZhzIhDfYMEM',
    appId: '1:321786060169:ios:ae35a853bb0c827e9f5558',
    messagingSenderId: '321786060169',
    projectId: 'ashif-web-portfolio',
    storageBucket: 'ashif-web-portfolio.firebasestorage.app',
    iosBundleId: 'com.example.webAshi',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDmsiSYVYHjmB1nXtRSVG3k-MWqxCrIHTA',
    appId: '1:321786060169:web:acfae7ba65c2c9409f5558',
    messagingSenderId: '321786060169',
    projectId: 'ashif-web-portfolio',
    authDomain: 'ashif-web-portfolio.firebaseapp.com',
    storageBucket: 'ashif-web-portfolio.firebasestorage.app',
  );
}
