import 'package:flutter/material.dart';
import 'package:flutter_crud_ncf_app/classes/account.dart';
import 'package:flutter_crud_ncf_app/classes/user.dart';
import 'package:flutter_crud_ncf_app/settings/fontsize.dart';

class EditAccountPage extends StatelessWidget {
  const EditAccountPage({
    super.key,
    required this.currentUser,
  });
  final Account currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 30.0, right: 30.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    ),
                    const Text(
                      'Edit Account',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: FontSizeSetting.h2),
                    ),
                    IconButton(
                      onPressed: () => {},
                      icon: const Icon(
                        Icons.warning_rounded,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
