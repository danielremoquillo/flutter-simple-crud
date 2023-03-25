import 'package:flutter/material.dart';
import 'package:flutter_crud_ncf_app/classes/account.dart';
import 'package:flutter_crud_ncf_app/screens/edit_account.dart';
import 'package:flutter_crud_ncf_app/settings/fontsize.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.currentUser});
  final Account currentUser;
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
                  onPressed: () => {},
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
              onTap: () {},
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
