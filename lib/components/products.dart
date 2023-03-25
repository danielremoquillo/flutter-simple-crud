import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_crud_ncf_app/classes/product.dart';

import 'package:flutter_crud_ncf_app/widgets/product_list.dart';
import 'package:http/http.dart' as http;

class Products extends StatelessWidget {
  const Products({super.key});

  Future<List<Product>> fetchProducts(http.Client client) async {
    final response =
        await client.get(Uri.parse('http://zz.ncf.edu.ph/public/api/products'));
    // Use the compute function to run parsePhotos in a separate isolate.

    if (response.statusCode == 200) {
      List<dynamic> decodedJson = json.decode(response.body);

      return decodedJson.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch photos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
        future: fetchProducts(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error!}'),
            );
          } else if (snapshot.hasData) {
            return ProductList(products: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
