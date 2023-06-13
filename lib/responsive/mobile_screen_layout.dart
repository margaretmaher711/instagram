import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/components/text_field_input.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

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
        TextFieldInput(),
        const SizedBox(
          height: 24,
        ),
        TextFieldInput(),  const SizedBox(
          height: 24,
        ),
        InkWell(
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
                //   Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => const SignupScreen(),
                //   ),
                // );
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
