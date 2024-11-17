import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saga_kart/core/app_util.dart';
import 'package:saga_kart/product/model/product_model.dart';
import 'package:saga_kart/product/provider/product_provider.dart';

import 'product_detail_screen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    productProvider.fetchProducts();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Product Screen',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.productList.length,
            itemBuilder: (context, index) {
              Product product = provider.productList[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailScreen(product: product),
                    ),
                  );
                },
                child: Card(
                  elevation: 1,
                  child: ListTile(
                    title: Text(product.name ?? 'No product name'),
                    subtitle: Text(" Rs.${product.price.toString()}"),
                    trailing: Text(product.description ?? 'No category'),
                   leading:  Text(product.runtimeType.toString()),

                  ),

                ),
              );
            },
          );
        },
      ),
    );
  }
}
