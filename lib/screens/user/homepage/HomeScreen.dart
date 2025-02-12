import 'package:flutter/material.dart';
import 'package:kisan_saathi/providerModels/prodcut/productTileProvider.dart';
import 'package:kisan_saathi/screens/user/product/enlargeProductScreen.dart';

import 'package:kisan_saathi/utils/widgets/productTile.dart';

import 'package:provider/provider.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final products = productProvider.products;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            pinned: true,
            floating: false,
            snap: false,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Kisan Sathi - Nurturing Every Farm'),
              background: Image.asset(
                'assets/images/HomeScreen_image.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailScreen(productId: product['id']),
                        ),
                      );
                    },
                    child: ProductTile(
                      imageUrl: product['imageUrl'],
                      name: product['name'],
                      price: product['price'].toDouble(),
                    ),
                  );
                },
                childCount: products.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, // Updated to 1 columns for better layout
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
