import 'package:flutter/material.dart';
import 'package:json_proudects_app/model/product_model.dart';
import 'package:json_proudects_app/service/product_service.dart';

class ProductsDeitals extends StatefulWidget {
  const ProductsDeitals({
    super.key,
  });

  @override
  _ProductsDeitalsState createState() => _ProductsDeitalsState();
}

class _ProductsDeitalsState extends State<ProductsDeitals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ProductsServiceImp().getSingleProduct(),
        builder: (context, status) {
          if (status.hasData) {
            dynamic temp = status.data;
            List<ProductModel> product = List.generate(
                temp.length, (index) => ProductModel.fromMap(temp[index]));
            return ProductsDetailsViwe(product: product,);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class ProductsDetailsViwe extends StatefulWidget {
  const ProductsDetailsViwe({
    super.key,
    required this.product,
  });

final List<ProductModel> product;

  @override
  _ProductsDetailsViweState createState() => _ProductsDetailsViweState();
}

class _ProductsDetailsViweState extends State<ProductsDetailsViwe> {
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                stretch: true,
                pinned: true,
                collapsedHeight: 100,
                flexibleSpace: FlexibleSpaceBar(
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

