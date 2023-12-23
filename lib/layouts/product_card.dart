import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:json_proudects_app/config/di.dart';
import 'package:json_proudects_app/model/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.products,
  });

  final ProductModel products;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        color: Color(0xFFFEFEFE),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: ShapeDecoration(
                image: DecorationImage(
                    image: NetworkImage(products.thumbnail), fit: BoxFit.fill),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            Text(products.title),
            Text(
              products.price.toString(),
              style: TextStyle(
                color: Color(0xFF1D1E20),
                fontSize: 13,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 0.08,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        print(products.id);
        config
            .get<SharedPreferences>()
            .setString('IDoftypedproduct', products.id as String);
        context.go('/HomePage/ProductsDeitals');
      },
    );
  }
}
