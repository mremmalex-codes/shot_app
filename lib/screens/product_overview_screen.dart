import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/navigations/drawer.dart';
import '/screens/cart_screen.dart';
import '../widgets/badge.dart';
import '../providers/cart_provider.dart';
import '../widgets/product_grid.dart';

// app imports

enum FilterProduct { favorites, all }

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool showFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shop App"),
        actions: [
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              value: cart.itemCount.toString(),
              child: ch!,
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              icon: const Icon(Icons.shopping_cart),
            ),
          ),
          PopupMenuButton(
            onSelected: (FilterProduct selectedVal) {
              if (selectedVal == FilterProduct.favorites) {
                setState(() {
                  showFavorite = true;
                });
              } else {
                setState(() {
                  showFavorite = false;
                });
              }
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterProduct.favorites,
                child: Text("Only Favorites"),
              ),
              const PopupMenuItem(
                value: FilterProduct.all,
                child: Text("All Products"),
              ),
            ],
          ),
        ],
      ),
      drawer: const DrawerNav(),
      body: ProductsGrid(showFavorite),
    );
  }
}
