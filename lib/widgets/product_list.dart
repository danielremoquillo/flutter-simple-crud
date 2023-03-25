import 'package:flutter/material.dart';
import 'package:flutter_crud_ncf_app/classes/product.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Text(products[index].title);
        });
  }
}
