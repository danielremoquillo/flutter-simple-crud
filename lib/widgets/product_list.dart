import 'package:flutter/material.dart';
import 'package:flutter_crud_ncf_app/classes/product.dart';
import 'package:flutter_crud_ncf_app/widgets/product_tile.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    List<Widget> productList =
        products.map((product) => ProductTile(product: product)).toList();
    return Column(children: <Widget>[
      ...productList, // Note the three dots before the widgetList
    ]);
  }
}
