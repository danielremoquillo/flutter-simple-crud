import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_crud_ncf_app/components/login_form.dart';
import 'package:flutter_crud_ncf_app/screens/register.dart';
import 'package:flutter_crud_ncf_app/settings/fontsize.dart';
import 'package:flutter_crud_ncf_app/widgets/line.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 80.0, left: 40.0, right: 40.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Login to your',
                      style: TextStyle(
                          fontSize: FontSizeSetting.h1,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'account',
                      style: TextStyle(
                          fontSize: FontSizeSetting.h1,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Line(
                          length: 90,
                        ),
                        Line(
                          length: 15,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const LoginForm(),
                const SizedBox(
                  height: 80,
                ),
                RichText(
                  text: TextSpan(
                      text: 'Dont have an account? ',
                      style: const TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                            text: 'Register',
                            style: const TextStyle(
                              color: Colors.blue,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const RegisterPage();
                                }), (route) => false);
                              }),
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
