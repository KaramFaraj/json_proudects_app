import 'package:dio/dio.dart';

abstract class BaseProductsService {
  Dio dio = Dio();
  String baseproducturl = 'https://dummyjson.com/products/';
  late Response response;
}

abstract class ProductsService extends BaseProductsService {
  Future getAllProduct();
}

class ProductsServiceImp extends ProductsService {
  @override
  Future getAllProduct() async {
    response = await dio.get(baseproducturl);
    return response.data;
  }
}
