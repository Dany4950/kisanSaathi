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
      "name": "Front Wheel Bearing",
      "price": 884,
      "imageUrl": "assets/images/front wheel bearing.png",
      "description": "Tractor Hydraulic Male Female Coupling "
          " Size =1/2 ,3/4 Inches",
      "Material": "Mild Steel",
      "Pieces": "3",
      "Status": "156 items left"
    },
    {
      "id": "2",
      "name": "Hydraulic Tractor Trolley Hose",
      "price": 120,
      "imageUrl": "assets/images/Hydraulic Tractor Trolley Hose.png",
      "description": "Type : Hydraulic "
          " Model Name/Number : tractor/trolley "
          "Working Pressure : 2610"
          "Diameter : 1 to 3 inch, 3/8",
      "Pieces": "3",
      "Status": "156 items left",
      "Material": "Mild Steel",
    },
    {
      "id": "3",
      "name": "Oil Filter",
      "price": 150,
      "imageUrl": "assets/images/Oil Filter.png",
      "description":
          "lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem ",
      "Pieces": "3",
      "Status": "156 items left",
      "Material": "Mild Steel",
    },
    {
      "id": "4",
      "name": "Checknut",
      "price": 2,
      "imageUrl": "assets/images/Checknut.png",
      "description": "Material : Mild Steel"
          "Thread Size (inch) : M6"
          "Product Shape :Round",
      "Pieces": "3",
      "Status": "156 items left"
    },
    {
      "id": "5",
      "Material": "Mild Steel",
      "name": "Center Pin",
      "price": 290,
      "imageUrl": "assets/images/Center Pin.png",
      "description": "Thread Size (inch) : -"
          "Product Shape : pin ",
      "Pieces": "3",
      "Status": "156 items left"
    },
    {
      "id": "6",
      "name": "Break Paddle",
      "price": 240,
      "imageUrl": "assets/images/Break Paddle.png",
      "description": "Size : 8 inch "
          "Material : Mild Steel"
          "Features  :  Rust Proof "
          "Usage  : Tractor ",
      "Pieces": "3",
      "Status": "156 items left"
    },
    {
      "id": "7",
      "name": "Engine Oil Filter",
      "price": 7500,
      "imageUrl": "assets/images/ Engine Oil Filter.png",
      "description": "Size : 8 inch "
          "Material : Mild Steel"
          "Features  :  Rust Proof "
          "Usage  : Tractor ",
      "Pieces": "3",
      "Status": "156 items left"
    },
    {
      "id": "8",
      "name": "Hydraulic Pipe ",
      "price": 200,
      "imageUrl": "assets/images/Hydrolic Pipe.png",
      "description": "Size : 8 inch "
          "Material : Mild Steel"
          "Features  :  Rust Proof "
          "Usage  : Tractor ",
      "Material": "Mild Steel",
      "Pieces": "3",
      "Status": "156 items left"
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
