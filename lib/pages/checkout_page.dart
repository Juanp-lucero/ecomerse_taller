import 'package:flutter/material.dart';
import '../models/cart.dart';

class CheckoutPage extends StatefulWidget {
  final Cart cart;
  const CheckoutPage({super.key, required this.cart});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: widget.cart.items.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final item = widget.cart.items[index];
                return ListTile(
                  leading: Image.network(item.product.imageUrl, width: 56, height: 56, fit: BoxFit.cover),
                  title: Text(item.product.name),
                  subtitle: Text('x${item.quantity}  •  \$${item.product.price.toStringAsFixed(2)}'),
                  trailing: Text('\$${item.subtotal.toStringAsFixed(2)}'),
                  onLongPress: () {
                    setState(() {
                      widget.cart.remove(item.product);
                    });
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('\$${widget.cart.total.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 12),
                FilledButton(
                  onPressed: widget.cart.isEmpty ? null : () {},
                  child: const Text('Pagar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

