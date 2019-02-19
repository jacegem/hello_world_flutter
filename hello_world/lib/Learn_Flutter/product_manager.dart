import 'package:flutter/material.dart';
import 'package:hello_world_flutter/Learn_Flutter/products.dart';
import 'package:hello_world_flutter/Learn_Flutter/product_control.dart';

class ProductManager extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  ProductManager(this.products);

  @override
  Widget build(BuildContext context) {
    print('[ProductsManager Widget] build');
    return Column(
      children: [
        Expanded(
          child: Products(products),
        ),
      ],
    );
  }
}
