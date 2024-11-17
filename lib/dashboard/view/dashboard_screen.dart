import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saga_kart/cart/view/cart_screen.dart';
import 'package:saga_kart/category/view/category_screen.dart';
import 'package:saga_kart/product/view/product_screen.dart';
import 'package:saga_kart/profile/view/profile_screen.dart';

class DashboardScreen extends StatefulWidget {

  final String username;
  final String password;

  const DashboardScreen({Key? key, required this.username, required this.password})
      : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Widget> list = [
    ProductScreen(),
    CategoryScreen(),
    CartScreen(),
    ProfileScreen()
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        onTap: (context){
          index = context;
          setState(() {

          });
        },
        items: [
          BottomNavigationBarItem(

              icon: Icon(Icons.production_quantity_limits), label: 'Product'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined), label: 'Category'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'My Profile'),
        ],
      ),
          body: list[index],
    ));
  }
}
