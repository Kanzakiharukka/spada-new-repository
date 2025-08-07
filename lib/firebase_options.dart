import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart';


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
    apiKey: 'AIzaSyCXBFFxVkO1IkMpGTkXw7K0iH_7fSaBoXQ',
    appId: '1:472811334281:web:ed354032ee8a809829f458',
    messagingSenderId: '472811334281',
    projectId: 'spada-app-new',
    authDomain: 'spada-app-new.firebaseapp.com',
    storageBucket: 'spada-app-new.firebasestorage.app',
    measurementId: 'G-YQDMJV2YZQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCoXaygbvzF6gc_FtHyt6XzasdGqnlJi4I',
    appId: '1:472811334281:android:842797b82d09e14a29f458',
    messagingSenderId: '472811334281',
    projectId: 'spada-app-new',
    storageBucket: 'spada-app-new.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBSNS-5v7tKsnGYiTxC0WDhcgNmCJAbZMw',
    appId: '1:472811334281:ios:ec2695fd39f0839229f458',
    messagingSenderId: '472811334281',
    projectId: 'spada-app-new',
    storageBucket: 'spada-app-new.firebasestorage.app',
    iosBundleId: 'com.example.spadaAppNew',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBSNS-5v7tKsnGYiTxC0WDhcgNmCJAbZMw',
    appId: '1:472811334281:ios:ec2695fd39f0839229f458',
    messagingSenderId: '472811334281',
    projectId: 'spada-app-new',
    storageBucket: 'spada-app-new.firebasestorage.app',
    iosBundleId: 'com.example.spadaAppNew',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCXBFFxVkO1IkMpGTkXw7K0iH_7fSaBoXQ',
    appId: '1:472811334281:web:afdbb198feee624329f458',
    messagingSenderId: '472811334281',
    projectId: 'spada-app-new',
    authDomain: 'spada-app-new.firebaseapp.com',
    storageBucket: 'spada-app-new.firebasestorage.app',
    measurementId: 'G-STMTE1G683',
  );

}