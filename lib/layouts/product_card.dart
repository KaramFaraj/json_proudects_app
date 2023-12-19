import 'package:flutter/material.dart';
import 'package:json_proudects_app/model/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.products,
  });

  final ProductModel products;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(products.thumbnail),
          Text(products.title),
          Text(products.description),
          Text(products.price.toString()),
        ],
      ),
    );
  }
}
