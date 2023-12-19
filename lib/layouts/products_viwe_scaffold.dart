// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:json_proudects_app/layouts/product_card.dart';
import 'package:json_proudects_app/model/product_model.dart';

class ProductsViewScaffold extends StatelessWidget {
  final List<ProductModel> productsDataList;
  final List<ProductModel> products;

  ProductsViewScaffold({
    Key? key,
    required this.productsDataList,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 500,
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 253,
                    crossAxisSpacing: 20,
                    childAspectRatio: 4 / 2,
                    mainAxisSpacing: 40,
                  ),
                  itemBuilder: (context, index) {
                    final products = productsDataList[index];
                    return ProductCard(products: products);
                  },
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
