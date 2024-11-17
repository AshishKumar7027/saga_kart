import 'dart:convert';

import 'package:saga_kart/core/api_endpoint.dart';
import 'package:http/http.dart' as http;
import 'package:saga_kart/product/model/product_model.dart';

class ProductService {
  Future<List<Product>>  fetchProducts() async {
    String url = ApiEndpoint.getProduct;
    final response = await http.get(
      Uri.parse(url),
      headers: {'x-api-key': 'aihfj--qwnkqwr--jlkqwnjqw--jnkqwjnqwy'},
    );
    if(response.statusCode == 200){
    List<Product> productList =[];
      final mapList  = jsonDecode(response.body);
      for(int a=0; a<mapList.length;a++){
        final map = mapList[a];
     Product product = Product.fromJson(map);
     productList.add(product);
      }return productList;

    }else{
      throw 'Unable to fetch product';
    }
  }
}
