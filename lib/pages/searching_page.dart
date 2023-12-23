import 'package:flutter/material.dart';
import 'package:json_proudects_app/config/di.dart';
import 'package:json_proudects_app/layouts/products_viwe_scaffold.dart';
import 'package:json_proudects_app/model/product_model.dart';
import 'package:json_proudects_app/service/product_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchingPage extends StatefulWidget {
  const SearchingPage({super.key});

  @override
  _SearchingPageState createState() => _SearchingPageState();
}

class _SearchingPageState extends State<SearchingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              config.get<SharedPreferences>().setString('searched', value);
              print(value);
              setState(() {
                
              });
            },
          ),
          FutureBuilder(
            future: ProductsServiceImp().getSearchedProduct(),
            builder: (context, status) {
              if (status.hasData) {
                dynamic temp = status.data;
                List<ProductModel> searchedproduts = List.generate(
                  temp['products'].length,
                  (index) => ProductModel.fromMap(temp['products'][index]),
                );
                return ProductsViewScaffold(
                  productsDataList: searchedproduts,
                );
              } else {
                return Center(
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
