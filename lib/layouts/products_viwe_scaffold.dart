// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:json_proudects_app/layouts/product_card.dart';
import 'package:json_proudects_app/model/product_model.dart';

class ProductsViewScaffold extends StatefulWidget {
  final List<ProductModel> productsDataList;

  ProductsViewScaffold({
    super.key,
    required this.productsDataList,
  });

  @override
  _ProductsViewScaffoldState createState() => _ProductsViewScaffoldState();
}

class _ProductsViewScaffoldState extends State<ProductsViewScaffold> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: 350,
            child: GridView.builder(
              itemCount: widget.productsDataList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 240,
                crossAxisSpacing: 20,
                childAspectRatio: 4 / 2,
                mainAxisSpacing: 40,
              ),
              itemBuilder: (context, index) {
                return ProductCard(products: widget.productsDataList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
