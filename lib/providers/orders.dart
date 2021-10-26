import 'package:flutter/widgets.dart';
import 'package:shop_app/providers/cart.dart';


class POrderItem {
  final String id;
  final double amount;
  final List<PCartItem> products;
  final DateTime datetime;

  POrderItem({
    required this.id,
    required this.amount,
    required this.products,
    required this.datetime,
  });
}

class Orders with ChangeNotifier {
  final List<POrderItem> _orders = [];

  List<POrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<PCartItem> cartProducts, double total) {
    _orders.insert(
      0,
      POrderItem(
        id: DateTime.now().toString(),
        amount: total,
        datetime: DateTime.now(),
        products: cartProducts,
      ),
    );
    notifyListeners();
  }
}
