import 'package:flutter/material.dart';
import 'package:flutter_crud_ncf_app/classes/account.dart';
import 'package:flutter_crud_ncf_app/screens/home.dart';
import 'package:flutter_crud_ncf_app/screens/login.dart';
import 'package:flutter_crud_ncf_app/settings/fontsize.dart';

class LoginStatus extends StatelessWidget {
  const LoginStatus({super.key, required this.loginUser});
  final Future<Account> loginUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder<Account>(
          future: loginUser,
          builder: (context, snapshot) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Center(child: CircularProgressIndicator()),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Logging In',
                        style: TextStyle(fontSize: FontSizeSetting.h3),
                      ),
                    ],
                  ),
                  FutureBuilder<bool>(
                    future: Future.delayed(
                      const Duration(seconds: 2),
                      () {
                        throw (0);
                      },
                    ),
                    builder: (context, snapshot) {
                      return const SizedBox();
                    },
                  ),
                  FutureBuilder<bool>(
                    future: Future.delayed(
                      const Duration(seconds: 2),
                      () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return !snapshot.hasError
                                  ? Home(
                                      loginUser: loginUser,
                                    )
                                  : const LoginPage(
                                      status:
                                          'Login Error: Account is not available',
                                    );
                            },
                          ),
                          (route) => false,
                        );

                        throw ('Error');
                      },
                    ),
                    builder: (context, snapshot) {
                      return const SizedBox();
                    },
                  )
                ],
              ),
            );
          },
        ),
      )),
    );
  }
}
