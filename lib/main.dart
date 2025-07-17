import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ecommerce_app/providers/product_provider.dart';
import 'package:flutter_ecommerce_app/screens/product_list_screen.dart';
import 'package:flutter_ecommerce_app/services/api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductProvider(ApiService()),
      child: MaterialApp(
        title: 'E-commerce App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: ProductListScreen(),
      ),
    );
  }
}
