import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud_ncf_app/classes/account.dart';
import 'package:flutter_crud_ncf_app/components/accounts.dart';
import 'package:flutter_crud_ncf_app/components/products.dart';
import 'package:flutter_crud_ncf_app/screens/profile.dart';
import 'package:flutter_crud_ncf_app/settings/fontsize.dart';
import 'package:flutter_crud_ncf_app/widgets/design_line.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.loginUser});
  final Future<Account> loginUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 30.0, right: 30.0),
            child: FutureBuilder<Account>(
              future: loginUser,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2.8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Logging in.',
                            style: TextStyle(fontSize: FontSizeSetting.h3),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Center(child: CircularProgressIndicator()),
                        ],
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData && snapshot.data == null) {
                  return const Text('No data available');
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Hello, ${snapshot.data!.name.split(' ')[0]}!',
                            style: const TextStyle(
                                fontSize: FontSizeSetting.h1,
                                fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(20.0),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ProfilePage(
                                  currentUser: snapshot.data!,
                                );
                              }));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.blue, width: 1.5)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.network(
                                  'https://pbs.twimg.com/media/FhJPxxMXoAA9LNS?format=jpg&name=900x900',
                                  width: 35,
                                  height: 35,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://media.tenor.com/qkPV6_DL-NAAAAAd/bocchi-the-rock-bocchi.gif',
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Products',
                            style: TextStyle(
                                fontSize: FontSizeSetting.h2,
                                fontWeight: FontWeight.w500),
                          ),
                          RichText(
                            text: TextSpan(
                                text: 'View all',
                                style: const TextStyle(
                                  color: Colors.blue,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {}),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const DesignLine(
                        line1Length: 75,
                        line2Length: 15,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Products(),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Users',
                            style: TextStyle(
                                fontSize: FontSizeSetting.h2,
                                fontWeight: FontWeight.w500),
                          ),
                          RichText(
                            text: TextSpan(
                                text: 'View all',
                                style: const TextStyle(
                                  color: Colors.blue,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {}),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const DesignLine(
                        line1Length: 45,
                        line2Length: 15,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Accounts(),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
