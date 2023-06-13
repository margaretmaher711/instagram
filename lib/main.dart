import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram/responsive/mobile_screen_layout.dart';
import 'package:instagram/responsive/responsive_layout.dart';
import 'package:instagram/responsive/web_screen_layout.dart';
import 'package:instagram/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
 await WidgetsFlutterBinding.ensureInitialized();

  // if (kIsWeb) {
  //   await Firebase.initializeApp(
  //       options: const FirebaseOptions(
  //           apiKey: "AIzaSyC6bUhWNXFheDnYxYenukp8QSFEA4BM-_k",
  //           authDomain: "instagram-fc5b2.firebaseapp.com",
  //           projectId: "instagram-fc5b2",
  //           storageBucket: "instagram-fc5b2.appspot.com",
  //           messagingSenderId: "659612613407",
  //           appId: "1:659612613407:web:4de769a1d8a540acaf4e2a"));
  // } else {
  //   await Firebase.initializeApp();
  //
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      home: ResponsiveLayout(
        webScreenLayout: const WebScreenLayout(),
        mobileScreenLayout: const MobileScreenLayout(),
      ),
    );
  }
}
