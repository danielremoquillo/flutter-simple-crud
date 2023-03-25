import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_crud_ncf_app/classes/account.dart';
import 'package:flutter_crud_ncf_app/widgets/account_list.dart';

import 'package:http/http.dart' as http;

class Accounts extends StatelessWidget {
  const Accounts({super.key});

  Future<List<Account>> fetchAccounts(http.Client client) async {
    final response = await client
        .get(Uri.parse('http://zz.ncf.edu.ph/public/api/show_users'));
    // Use the compute function to run parsePhotos in a separate isolate.

    if (response.statusCode == 200) {
      List<dynamic> decodedJson = json.decode(response.body);

      return decodedJson.map((json) => Account.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch photos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Account>>(
        future: fetchAccounts(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error!}'),
            );
          } else if (snapshot.hasData) {
            return AccountList(accounts: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
