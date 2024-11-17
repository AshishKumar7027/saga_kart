
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saga_kart/category/model/category_model.dart';
import 'package:saga_kart/category/provider/category_provider.dart';
import 'package:saga_kart/category/view/category_detail_screen.dart';
import 'package:saga_kart/core/app_util.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryProvider categoryProvider = Provider.of<CategoryProvider>(context);
    categoryProvider.getCategory();
    return Scaffold(
      appBar: AppBar(title: const Text('Category Screen'),),
      body: Consumer<CategoryProvider>(builder: (context, provider, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            CategoryModel items = provider.categoryList[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CategoryDetailScreen(categoryModel: items),
                    ));
              },
              child: Card(
                child: ListTile(
                  title: Text(items.name ?? 'No name'),
                  subtitle: Text(items.sId ?? 'No sId'),
                  trailing: Text(items.iV.toString()),
                ),
              ),
            );
          },
          itemCount: provider.categoryList.length,
        );
      }),
    );
  }
}
