import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_crud_ncf_app/components/register_form.dart';
import 'package:flutter_crud_ncf_app/screens/login.dart';
import 'package:flutter_crud_ncf_app/settings/fontsize.dart';
import 'package:flutter_crud_ncf_app/widgets/line.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key, this.status});
  final String? status;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 60.0, left: 40.0, right: 40.0),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Register new',
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
                const RegisterForm(),
                const SizedBox(
                  height: 40,
                ),
                RichText(
                  text: TextSpan(
                      text: 'Already have an account? ',
                      style: const TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Login',
                          style: const TextStyle(
                            color: Colors.blue,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pop();
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return const LoginPage();
                              }));
                            },
                        ),
                      ]),
                ),
                Text(
                  '${status ?? ''}.',
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
