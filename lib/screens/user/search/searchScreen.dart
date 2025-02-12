import 'package:flutter/material.dart';
import 'package:kisan_saathi/screens/user/product/enlargeProductScreen.dart';
import 'package:kisan_saathi/utils/appbar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _filteredProducts = [];

  final List<Map<String, dynamic>> _products = [
    {
      "id": "1",
      "name": "Laptop",
      "price": 59999,
      "imageUrl": "assets/images/appLogo.png",
      "description": "High-performance laptop for work and gaming."
    },
    {
      "id": "2",
      "name": "Smartphone",
      "price": 39999,
      "imageUrl": "assets/images/appLogo.png",
      "description": "Latest smartphone with high-resolution camera."
    },
    {
      "id": "3",
      "name": "Shoes",
      "price": 2999,
      "imageUrl": "assets/images/appLogo.png",
      "description": "Comfortable and stylish shoes for everyday use."
    },
    {
      "id": "4",
      "name": "Watch",
      "price": 4999,
      "imageUrl": "assets/images/appLogo.png",
      "description": "Elegant watch with advanced features."
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  void _filterProducts(String query) {
    setState(() {
      if (query.isEmpty) {
        Text("Search");
      } else {
        _filteredProducts = _products
            .where((product) =>
                product["name"].toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: 'SEARCH'),

          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: screenWidth * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                onChanged: _filterProducts,
                style: const TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Search for products...',
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.mic, color: Colors.grey),
                    onPressed: () {
                      // Logic for voice search (Future Implementation)
                    },
                  ),
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
              ),
            ),
          ),

//recent searcheda

          SizedBox(
            height: 40,
          ),
          // Text(
          //   "Recent Searches",
          //   style: TextStyle(fontWeight: FontWeight.bold),
          // ),
          // Product List
          Expanded(
            child: _filteredProducts.isEmpty
                ? const Center(
                    child: Text(
                      'No products found!',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  )
                : ListView.builder(
                    itemCount: _filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = _filteredProducts[index];
                      return ListTile(
                        leading: Image.asset(
                          product["imageUrl"],
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          product["name"],
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "₹${product["price"]}",
                          style: const TextStyle(color: Colors.green),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetailScreen(
                                      productId: product['id'])));
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
