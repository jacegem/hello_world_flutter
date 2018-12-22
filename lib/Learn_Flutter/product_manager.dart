import 'package:flutter/material.dart';
import 'package:hello_world_flutter/Learn_Flutter/products.dart';
import 'package:hello_world_flutter/Learn_Flutter/product_control.dart';

class ProductManager extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function addProduct;
  final Function deleteProduct;

  ProductManager(this.products, this.addProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    print('[ProductsManager Widget] build');
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          child: ProductControl(addProduct),
        ),
        Expanded(
          child: Products(products, deleteProduct: deleteProduct),
        ),
      ],
    );
  }
}
