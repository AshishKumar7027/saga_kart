import 'package:flutter/material.dart';
import 'package:saga_kart/category/model/category_model.dart';
import 'package:saga_kart/core/app_util.dart';

class CategoryDetailScreen extends StatelessWidget {
  CategoryModel categoryModel;

  CategoryDetailScreen({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Category Details Screen'),),
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.teal[400],
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(categoryModel.name ?? 'No name'),
                Text(categoryModel.sId ?? 'NO sId'),
                Text(categoryModel.iV.toString()),
              ],
            ),
          ),
        ));
  }
}