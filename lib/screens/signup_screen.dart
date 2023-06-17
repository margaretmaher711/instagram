import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram/resources/auth_controller.dart';
import 'package:instagram/utils/utils.dart';

import '../components/text_field_input.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _bioController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _userNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Center(
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
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 64,
                    backgroundImage: AssetImage(
                      'assets/images/stock-vector-man.jpg',
                    ),
                  ),
                  Positioned(
                      bottom: -10,
                      right: -6,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add_a_photo_outlined,
                          color: Colors.blue,
                        ),
                      ))
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
                controller: _userNameController,
                hintTxt: 'Enter your username',
                obsecure: false,
              ),
              const SizedBox(
                height: 24,
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
              TextFieldInput(
                controller: _bioController,
                hintTxt: 'Enter your bio',
                obsecure: false,
              ),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () => signUpUser(),
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
            ]),
          )),
        ));
  }

  signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthController().signUpUser(
        userName: _userNameController.text.toString(),
        email: _emailController.text.toString(),
        password: _passwordController.text.toString(),
        bio: _bioController.text.toString());
    setState(() {
      _isLoading = false;
    });
    if (res != 'success') {
      showSnackBar(res, context);
    }
  }
}
