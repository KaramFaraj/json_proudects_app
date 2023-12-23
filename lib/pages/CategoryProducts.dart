import 'package:flutter/material.dart';
import 'package:json_proudects_app/config/di.dart';
import 'package:json_proudects_app/layouts/products_viwe_scaffold.dart';
import 'package:json_proudects_app/model/product_model.dart';
import 'package:json_proudects_app/service/product_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryProducts extends StatelessWidget {
  const CategoryProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              config.get<SharedPreferences>().getString('category').toString()),
          FutureBuilder(
            future: ProductsServiceImp().getCategoryProducts(),
            builder: (context, status) {
              if (status.hasData) {
                dynamic temp = status.data;
                List<ProductModel> products = List.generate(
                    temp['products'].length,
                    (index) => ProductModel.fromMap(temp['products'][index]));
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductsViewScaffold(
                      productsDataList: products,
                    )
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
