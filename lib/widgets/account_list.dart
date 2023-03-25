import 'package:flutter/material.dart';
import 'package:flutter_crud_ncf_app/classes/account.dart';
import 'package:flutter_crud_ncf_app/widgets/account_tile.dart';

class AccountList extends StatelessWidget {
  const AccountList({super.key, required this.accounts});

  final List<Account> accounts;

  @override
  Widget build(BuildContext context) {
    List<Widget> accountList =
        accounts.map((account) => AccountTile(account: account)).toList();
    return Column(children: <Widget>[
      ...accountList, // Note the three dots before the widgetList
    ]);
  }
}
