import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/cart.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;
  final Cart cart;

  const ProductDetailPage({super.key, required this.product, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 1.2,
              child: Image.network(product.imageUrl, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name, style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 8),
                  Text('\$${product.price.toStringAsFixed(2)}', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 12),
                  Text(product.description),
                  const SizedBox(height: 20),
                  FilledButton.icon(
                    onPressed: () {
                      cart.add(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${product.name} agregado al carrito')),
                      );
                    },
                    icon: const Icon(Icons.add_shopping_cart),
                    label: const Text('Agregar al carrito'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

