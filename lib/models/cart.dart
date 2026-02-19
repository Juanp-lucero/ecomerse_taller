import 'product.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});

  double get subtotal => product.price * quantity;
}

class Cart {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  void add(Product product) {
    final index = _items.indexWhere((e) => e.product.id == product.id);
    if (index >= 0) {
      _items[index].quantity += 1;
    } else {
      _items.add(CartItem(product: product, quantity: 1));
    }
  }

  void remove(Product product) {
    _items.removeWhere((e) => e.product.id == product.id);
  }

  void clear() {
    _items.clear();
  }

  double get total {
    return _items.fold(0.0, (sum, e) => sum + e.subtotal);
  }

  bool get isEmpty => _items.isEmpty;
}

