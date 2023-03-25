import 'package:flutter/material.dart';
import 'package:flutter_crud_ncf_app/screens/login.dart';

import 'package:flutter_crud_ncf_app/screens/register.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'NCF Login App',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
