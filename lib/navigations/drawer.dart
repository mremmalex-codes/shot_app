import 'package:flutter/material.dart';

import '../screens/user_products_screen.dart';
import '/screens/orders_screen.dart';

class DrawerNav extends StatelessWidget {
  const DrawerNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(height: 100),
          menuItem(
            Icons.home,
            "Home",
            () => Navigator.of(context).pushReplacementNamed("/"),
          ),
          const Divider(),
          menuItem(
            Icons.outbox_rounded,
            "Orders",
            (() => Navigator.of(context)
                .pushReplacementNamed(OrdersScreen.routeName)),
          ),
          const Divider(),
          menuItem(
            Icons.edit,
            "Manage Products",
            () => Navigator.of(context)
                .pushReplacementNamed(UserProductsScreen.routeName),
          ),
        ],
      ),
    );
  }

  Widget menuItem(IconData icon, String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.black,
        ),
        title: Text(
          text,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
