import 'package:flutter/widgets.dart';
import 'package:saga_kart/product/model/product_model.dart';
import 'package:saga_kart/product/service/product_service.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> productList = [];
  ProductService productService;
  String? error;

  ProductProvider(this.productService);

  Future fetchProducts() async {
    try {
      productList = await productService.fetchProducts();
      notifyListeners();
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }
}
