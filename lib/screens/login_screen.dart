import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram/resources/auth_controller.dart';
import 'package:instagram/screens/signup_screen.dart';
import 'package:instagram/utils/utils.dart';

import '../components/text_field_input.dart';
import '../responsive/mobile_screen_layout.dart';
import '../responsive/responsive_layout.dart';
import '../responsive/web_screen_layout.dart';
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
  bool _isLoading = false;

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
          flex: 2,
          child: Container(),
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
          obsecure: true,
        ),
        const SizedBox(
          height: 24,
        ),

        InkWell(
          onTap: () => loginUser(),
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
            child: _isLoading
                ? const CircularProgressIndicator(
                    color: primaryColor,
                  )
                : const Text('Log in'),
          ),
        ),
        Flexible(
          flex: 2,
          child: Container(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: const Text(
                'Dont have an account?',
              ),
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
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: const Text(
                  ' Signup.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    )));
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthController().loginUser(
        email: _emailController.text, password: _passwordController.text);
    print('res$res');
    if (res == 'success') {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => ResponsiveLayout(
              mobileScreenLayout: MobileScreenLayout(),
              webScreenLayout: WebScreenLayout(),
            ),
          ),
          (route) => false);

      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      showSnackBar(res, context);
    }
  }
// logInUser() async {
//   setState(() {
//     _isLoading = true;
//   });
//   String res = await AuthController().loginUser(
//       email: _emailController.text.toString(),
//       password: _passwordController.text.toString());
//   if (res == 'success') {
//     Navigator.of(context).pushAndRemoveUntil(
//         MaterialPageRoute(
//           builder: (context) =>  ResponsiveLayout(
//             mobileScreenLayout: MobileScreenLayout(),
//             webScreenLayout: WebScreenLayout(),
//           ),
//         ),
//             (route) => false);
//
//     setState(() {
//       _isLoading = false;
//     });
//   } else {
//     showSnackBar(res, context);
//   }
//   setState(() {
//     _isLoading = false;
//   });
// }
}
