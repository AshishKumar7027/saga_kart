import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saga_kart/authentication/provider/auth_provider.dart';
import 'package:saga_kart/authentication/service/auth_service.dart';
import 'package:saga_kart/authentication/view/login_screen.dart';
import 'package:saga_kart/authentication/view/sign_up_screen.dart';
import 'package:saga_kart/product/provider/product_provider.dart';
import 'package:saga_kart/product/service/product_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return AuthProvider(AuthService());
        }),
        ChangeNotifierProvider(create: (context) {
          return ProductProvider(ProductService());
        }),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  LogInScreen(),
      ),
    );
  }
}
