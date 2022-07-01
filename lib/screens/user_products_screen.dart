import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/navigations/drawer.dart';
import '/providers/product_model.dart';
import '/widgets/user_product_item.dart';
import '../providers/product_provider.dart';
import 'edit_product_screen.dart';

class UserProductsScreen extends StatelessWidget {
  const UserProductsScreen({Key? key}) : super(key: key);
  static const routeName = "/user-products";

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          ),
        ],
      ),
      drawer: const DrawerNav(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: products.items.length,
          itemBuilder: (ctx, i) => Column(
            children: [
              UserProductItem(
                title: products.items[i].title,
                imageURl: products.items[i].imageUrl,
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
