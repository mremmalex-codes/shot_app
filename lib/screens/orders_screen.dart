import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/navigations/drawer.dart';

import '../providers/order_provider.dart' show Orders;
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Orders"),
      ),
      drawer: const DrawerNav(),
      body: SafeArea(
        child: ListView.builder(
          itemCount: ordersData.orders.length,
          itemBuilder: (ctx, i) => OrderItem(
            ordersData.orders[i],
          ),
        ),
      ),
    );
  }
}
