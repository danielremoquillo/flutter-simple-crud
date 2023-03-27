import 'package:flutter/material.dart';
import 'package:flutter_crud_ncf_app/screens/login.dart';
import 'package:flutter_crud_ncf_app/settings/fontsize.dart';

class LogoutStatus extends StatelessWidget {
  const LogoutStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
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
                    'Logging out',
                    style: TextStyle(fontSize: FontSizeSetting.h3),
                  ),
                ],
              ),
              FutureBuilder<bool>(
                future: Future.delayed(
                  const Duration(seconds: 2),
                  () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const LoginPage();
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
        ),
      )),
    );
  }
}
