// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:json_proudects_app/layouts/product_card.dart';
import 'package:json_proudects_app/model/product_model.dart';

class ProductsViewScaffold extends StatelessWidget {
  final List<ProductModel> productsDataList;

  ProductsViewScaffold({
    super.key,
    required this.productsDataList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 450,
          child: GridView.builder(
            itemCount: productsDataList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 240,
              crossAxisSpacing: 20,
              childAspectRatio: 4 / 2,
              mainAxisSpacing: 40,
            ),
            itemBuilder: (context, index) {
              return ProductCard(products: productsDataList[index]);
            },
          ),
        )
      ],
    );
  }
}
