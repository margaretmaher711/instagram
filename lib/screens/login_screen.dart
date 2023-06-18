import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram/screens/signup_screen.dart';

import '../components/text_field_input.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      padding: MediaQuery.of(context).size.width > webScreenSize
          ? EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 3)
          : const EdgeInsets.symmetric(horizontal: 32),
      child: Column(children: [
        Flexible(
          child: Container(),
          flex: 2,
        ),
        //logo
        SvgPicture.asset(
          'assets/images/ic_instagram.svg',
          height: 64,
          color: primaryColor,
        ),
        const SizedBox(
          height: 64,
        ),

        TextFieldInput(
          controller: _emailController,
          hintTxt: 'Enter your email',
          obsecure: false,
        ),
        const SizedBox(
          height: 24,
        ),
        TextFieldInput(
          controller: _passwordController,
          hintTxt: 'Enter your password',
          obsecure: true,        ),
        const SizedBox(
          height: 24,
        ),
        InkWell(onTap: ()=>     Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        ),
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              color: blueColor,
            ),
            child: Text('Log in'),
          ),
        ),
        Flexible(
          child: Container(),
          flex: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: const Text(
                'Dont have an account?',
              ),
              padding: const EdgeInsets.symmetric(vertical: 8),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SignupScreen(),
                  ),
                );
              },
              child: Container(
                child: const Text(
                  ' Signup.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 8),
              ),
            ),
          ],
        ),
      ]),
    )));
  }
}
