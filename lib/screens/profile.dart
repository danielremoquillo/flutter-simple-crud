import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_crud_ncf_app/classes/account.dart';
import 'package:flutter_crud_ncf_app/screens/delete_status.dart';
import 'package:flutter_crud_ncf_app/screens/edit_account.dart';
import 'package:flutter_crud_ncf_app/screens/logout_status.dart';
import 'package:flutter_crud_ncf_app/settings/fontsize.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.currentUser});
  final Account currentUser;

  Future<bool> deleteCurrentUser() async {
    final response = await http.delete(
      Uri.parse('http://zz.ncf.edu.ph/public/api/delete'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'id': currentUser.id.toString(),
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return true;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 30.0, right: 30.0),
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
                  'Profile',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: FontSizeSetting.h2),
                ),
                IconButton(
                  onPressed: () => {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Logout'),
                          content:
                              Text('Are you sure you want to logout this?'),
                          actions: [
                            TextButton(
                              child: Text('CANCEL'),
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                            ),
                            TextButton(
                              child: Text('CONFIRM'),
                              onPressed: () {
                                Navigator.of(context).pop(true);
                              },
                            ),
                          ],
                        );
                      },
                    ).then((value) {
                      if (value == true) {
                        // Delete the item
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context) {
                          return LogoutStatus();
                        }), (route) => false);
                      }
                    })
                  },
                  icon: const Icon(
                    Icons.power_settings_new_rounded,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blue, width: 1.9)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(120.0),
                child: Image.network(
                  'https://pbs.twimg.com/media/FhJPxxMXoAA9LNS?format=jpg&name=900x900',
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              currentUser.name,
              style: const TextStyle(
                  fontSize: FontSizeSetting.h3, fontWeight: FontWeight.w500),
            ),
            Text(
              currentUser.email,
              style: const TextStyle(
                  fontSize: FontSizeSetting.h4, fontWeight: FontWeight.w100),
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return EditAccountPage(currentUser: currentUser);
                }));
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: Row(
                  children: const [
                    Icon(Icons.edit_rounded),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Edit Account',
                      style: TextStyle(fontSize: FontSizeSetting.h4),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Delete'),
                      content: Text('Are you sure you want to delete this?'),
                      actions: [
                        TextButton(
                          child: Text('CANCEL'),
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                        ),
                        TextButton(
                          child: Text('DELETE'),
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                        ),
                      ],
                    );
                  },
                ).then((value) {
                  if (value == true) {
                    // Delete the item
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) {
                      return DeleteStatus(deleteStatus: deleteCurrentUser());
                    }), (route) => false);
                  }
                });
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: Row(
                  children: const [
                    Icon(
                      Icons.delete_outline_rounded,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Delete Account',
                      style: TextStyle(
                        fontSize: FontSizeSetting.h4,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
