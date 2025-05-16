import 'package:flutter/material.dart';

// Define the Product class and product list
class Product {
  final String name;
  final double price;
  final String image;

  Product({required this.name, required this.price, required this.image});
}

final List<Product> products = [
  Product(name: "Airpods", price: 1159.99, image: "assets/image/Airpods.png"),
  Product(name: "Charger", price: 179.99, image: "assets/image/charger.png"),
  Product(name: "Headsets", price: 1229.99, image: "assets/image/headsets.png"),
  Product(name: "Ladies Watch", price: 159.99, image: "assets/image/ladies watch.png"),
  Product(name: "Men Watch", price: 169.99, image: "assets/image/men watch.png"),
];

class HomePage extends StatelessWidget {
  final String username;

  const HomePage({required this.username, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        leadingWidth: 130,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            children: const [
              FlutterLogo(size: 32),
              SizedBox(width: 8),
              Text(
                "Waydukaan",
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),
        title: Container(
          height: 38,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              hintText: 'Search for products',
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              contentPadding: EdgeInsets.symmetric(vertical: 8),
            ),
            onSubmitted: (value) {
              // Implement search logic here
            },
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline, color: Colors.deepPurple),
            tooltip: 'Login',
            onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.deepPurple),
            tooltip: 'Cart',
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            "Hi, $username!",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 24),
          Container(
            height: 120,
            color: Colors.grey[200],
            child: const Center(child: Text("Category/Promotional Banner")),
          ),
          const SizedBox(height: 24),
          const Text(
            "Popular Products",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 220,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final product = products[index];
                return Container(
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            product.image,
                            fit: BoxFit.contain,
                            errorBuilder: (_, __, ___) => const Icon(Icons.image_not_supported),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "₹${product.price}",
                              style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add_circle, color: Colors.deepPurple),
                              onPressed: () {
                                // Add to cart logic here
                              },
                              tooltip: 'Add to cart',
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          product.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
