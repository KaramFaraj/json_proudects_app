import 'package:dio/dio.dart';
import 'package:json_proudects_app/config/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseProductsService {
  Dio dio = Dio();
  String baseproducturl = 'https://dummyjson.com/products';
  late Response response;
}

abstract class ProductsService extends BaseProductsService {
  Future getAllProduct();
  Future getSearchedProduct();
  Future getCategories();
  Future getCategoryProducts();
  Future getSingleProduct();
}

class ProductsServiceImp extends ProductsService {
  @override
  Future getAllProduct() async {
    response = await dio.get(baseproducturl);
    return response.data;
  }

  String? searchingtext = config.get<SharedPreferences>().getString('searched');

  @override
  Future getSearchedProduct() async {
    response = await dio.get('$baseproducturl/search?q=$searchingtext');
    return response.data;
  }

  @override
  Future getCategories() async {
    response = await dio.get('$baseproducturl/categories');
    return response.data;
  }

  String? tapedcategory = config.get<SharedPreferences>().getString('category');

  @override
  Future getCategoryProducts() async {
    response = await dio.get('$baseproducturl/category/$tapedcategory');
    return response.data;
  }

  String? tapedproduct =
      config.get<SharedPreferences>().getString('IDoftypedproduct');

  @override
  Future getSingleProduct() async {
    response = await dio.get('$baseproducturl/$tapedcategory');
    return response.data;
  }
}
