import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:json_proudects_app/config/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
    required this.categorys,
  });

  final List categorys;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: SizedBox(
        width: 470,
        height: 60,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categorys.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: InkWell(
                child: _buildCategoryItem(context, categorys[index]),
                onTap: () {
                  print(config.get<SharedPreferences>().getString('category'));
                  context.go('/HomePage/CategoryProducts');
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, String category) {
    config.get<SharedPreferences>().setString('category', category);

    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F6FA),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          category,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Color(0xFF1D1E20),
            fontSize: 15,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
