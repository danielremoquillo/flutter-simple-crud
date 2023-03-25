import 'package:flutter/material.dart';

import 'package:flutter_crud_ncf_app/classes/account.dart';
import 'package:flutter_crud_ncf_app/components/products.dart';
import 'package:flutter_crud_ncf_app/settings/fontsize.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.loginUser});
  final Future<Account> loginUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 40.0, right: 40.0),
          child: FutureBuilder<Account>(
            future: loginUser,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData && snapshot.data == null) {
                return const Text('No data available');
              } else {
                return SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hello, ${snapshot.data!.name}!',
                          style: const TextStyle(
                              fontSize: FontSizeSetting.h2,
                              fontWeight: FontWeight.bold),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.network(
                            'https://pbs.twimg.com/media/FhJPxxMXoAA9LNS?format=jpg&name=900x900',
                            width: 30,
                            height: 30,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: const Products()),
                  ],
                ));
              }
            },
          ),
        ),
      ),
    );
  }
}
