import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart' show Cart;
import 'package:shop_app/providers/orders.dart';
import 'package:shop_app/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pCart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text(
                      '\$${pCart.totalAmount.toStringAsFixed(2)}',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: Colors.purple,
                  ),
                  TextButton(
                    child: const Text(
                      'ORDER NOW',
                      style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrder(
                        pCart.items.values.toList(),
                        pCart.totalAmount,
                      );
                      pCart.clear();
                    },
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: pCart.items.length,
              itemBuilder: (ctx, i) => WCartItem(
                pCart.items.values.toList()[i].id,
                pCart.items.keys.toList()[i],
                pCart.items.values.toList()[i].price,
                pCart.items.values.toList()[i].quantity,
                pCart.items.values.toList()[i].title,
              ),
            ),
          )
        ],
      ),
    );
  }
}
