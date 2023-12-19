import 'package:flutter/material.dart';
import 'package:json_proudects_app/layouts/products_viwe_scaffold.dart';
import 'package:json_proudects_app/model/product_model.dart';
import '../service/product_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => ResultPage(),
                //     ));
              },
              icon: Icon(Icons.next_plan))
        ],
      ),
      body: FutureBuilder(
          future: ProductsServiceImp().getAllProduct(),
          builder: (context, status) {
            if (status.hasData) {
              dynamic temp = status.data;
              List<ProductModel> products = List.generate(temp['products'].length,
                  (index) => ProductModel.fromMap(temp['products'][index]));
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:EdgeInsets.only(top: 8.0),
                    child: const Text(
                      'Hello',
                      style: TextStyle(
                        color: Color(0xFF1D1E20),
                        fontSize: 28,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0.04,
                      ),
                    ),
                  ),
                  const Text(
                    'Welcome to Laza.',
                    style: TextStyle(
                      color: Color(0xFF8F959E),
                      fontSize: 15,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: SizedBox(
                      width: double.maxFinite,
                      child: TextField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFF5F6FA),
                            border: OutlineInputBorder()),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                      'New Arraival',
                      style: TextStyle(
                        color: Color(0xFF1D1E20),
                        fontSize: 17,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  ProductsViewScaffold(
                    productsDataList: products,
                  )
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
