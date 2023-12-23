import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:json_proudects_app/layouts/category_list.dart';
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
              icon: const Icon(Icons.next_plan))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding:
                EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello',
                  style: TextStyle(
                    color: Color(0xFF1D1E20),
                    fontSize: 28,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0.04,
                    letterSpacing: 0.21,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Welcome to Json.',
                  style: TextStyle(
                    color: Color(0xFF8F959E),
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0.07,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: InkWell(
              child: Container(
                width: 470,
                height: 50,
                padding: const EdgeInsets.all(10),
                decoration: ShapeDecoration(
                  color: Color(0xFFF5F6FA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 10),
                    Icon(Icons.search),
                    Text(
                      'Search...',
                      style: TextStyle(
                        color: Color(0xFF8F959E),
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0.07,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                context.go('/HomePage/SearchingPage');
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Text(
              'Choose Catgory',
              style: TextStyle(
                color: Color(0xFF1D1E20),
                fontSize: 17,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0.06,
              ),
            ),
          ),
          FutureBuilder(
            future: ProductsServiceImp().getCategories(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                dynamic temp = snapshot.data;
                List categorys = temp;
                return CategoryList(
                  categorys: categorys,
                );
              } else {
                return const Center(
                  child: LinearProgressIndicator(),
                );
              }
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'New Arraival',
              style: TextStyle(
                color: Color(0xFF1D1E20),
                fontSize: 17,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          FutureBuilder(
            future: ProductsServiceImp().getAllProduct(),
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
