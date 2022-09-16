import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mt_ecom_app/env.dart';
import 'package:mt_ecom_app/core/model/product.dart';

Future<List<Product>> getDataCall() async {
  Dio dio = Dio();
  List<Product> pList = [];
  late Response response;
  try {
    var pageCount = 1;
    response = await dio.get(
      url,
      options: Options(headers: {
        "Content-Type": "application/json",
        "Authorization": token
      }),
      queryParameters: {
        "page": '$pageCount',
        "perPage": '5',
      },
    );
    if (response.data != null) {
      var data = jsonDecode(response.data);
      for (var item in data['data']) {
        pList.add(Product.fromJson(item));
      }
    }
    return pList;
  } catch (e) {
    return pList;
  }
}
