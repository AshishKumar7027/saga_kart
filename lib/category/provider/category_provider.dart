
import 'package:flutter/material.dart';
import 'package:saga_kart/category/model/category_model.dart';
import 'package:saga_kart/category/service/category_service.dart';
import 'package:saga_kart/core/app_util.dart';


class CategoryProvider extends ChangeNotifier {
  List<CategoryModel> categoryList=[];
  CategoryService categoryService;

  CategoryProvider(this.categoryService);

  Future getCategory() async {
    try {
      categoryList = await categoryService.getAllCategory();
      notifyListeners();
    } catch (e) {
      AppUtil.showTost(e.toString());
    }
  }
}
