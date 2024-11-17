
import 'package:flutter/material.dart';
import 'package:saga_kart/core/app_util.dart';
import 'package:saga_kart/product/model/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:AppBar(
        backgroundColor: Colors.green,
        actionsIconTheme: IconThemeData(color: Colors.red),
        title: Text('Product Details Screen'),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(

            children: [
              Text(
               " Brand : ${ product.name }",
                style:
                const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                "Price: Rs. ${product.price?.toString()}",

              ),
              const SizedBox(height: 16),
              Text(
                "Category: ${product.category }",

              ),
              const SizedBox(height: 16),
              Text(
                "SLD: ${product.sId }",

              ),
              const Spacer(),
              Text(
                "Version: ${product.hashCode ?? 'No IV'}",
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
