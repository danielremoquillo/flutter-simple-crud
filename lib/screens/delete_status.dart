import 'package:flutter/material.dart';
import 'package:flutter_crud_ncf_app/screens/login.dart';
import 'package:flutter_crud_ncf_app/settings/fontsize.dart';

class DeleteStatus extends StatelessWidget {
  const DeleteStatus({super.key, required this.deleteStatus});
  final Future<bool> deleteStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder<bool>(
          future: deleteStatus,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      snapshot.data!
                          ? Icons.check_circle_outline_outlined
                          : Icons.cancel_outlined,
                      color: snapshot.data! ? Colors.green : Colors.red,
                      size: 120,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      snapshot.data!
                          ? 'Delete Successfully'
                          : 'Delete Unsuccessful',
                      style: const TextStyle(fontSize: FontSizeSetting.h2),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    const CircularProgressIndicator(),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Redirecting to Login page.',
                      style: const TextStyle(fontSize: FontSizeSetting.h3),
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
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('${snapshot.error}'));
            }

            // By default, show a loading spinner.
            return const Center(child: CircularProgressIndicator());
          },
        ),
      )),
    );
  }
}
