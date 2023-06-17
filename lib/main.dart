import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram/responsive/mobile_screen_layout.dart';
import 'package:instagram/responsive/responsive_layout.dart';
import 'package:instagram/responsive/web_screen_layout.dart';
import 'package:instagram/screens/login_screen.dart';
import 'package:instagram/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
 await WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAzXUsWPwKYoT4q4OTjk1nAxtp-Ns8bEv8",
            authDomain: "instagram-a3517.firebaseapp.com",
            projectId: "instagram-a3517",
            storageBucket: "instagram-a3517.appspot.com",
            messagingSenderId: "984923996827",
            appId: "1:984923996827:web:a3c74650387ece3ac13c3e"));
  } else {
    await Firebase.initializeApp();

  }
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
      // home: ResponsiveLayout(
      //   webScreenLayout: const WebScreenLayout(),
      //   mobileScreenLayout: const MobileScreenLayout(),
      // ),
    home: LoginScreen(),
    );
  }
}
