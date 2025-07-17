import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ecommerce_app/providers/product_provider.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('E-commerce Products')),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          return productProvider.products.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: productProvider.products.length,
                  itemBuilder: (context, index) {
                    final product = productProvider.products[index];
                    return ListTile(
                      title: Text(product.name),
                      subtitle: Text('\$${product.price.toString()}'),
                      leading: Image.network(product.imageUrl),
                    );
                  },
                );
        },
      ),
    );
  }
}
