import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
    'name': 'Airpods',
    'stock': 15,
    'price': 1159.99,
    'image': 'assets/image/Airpods.png',
    },
    {
    'name': 'charger',
    'stock': 25,
    'price': 179.99,
    'image': 'assets/image/charger.png',
  },
  {
    'name': 'headsets',
    'stock': 10,
    'price': 1229.99,
    'image': 'assets/image/headsets.png',
  },
  {
    'name': 'ladies watch',
    'stock': 8,
    'price': 159.99,
    'image': 'assets/image/ladies watch.png',
  },
  {
    'name': 'men watch',
    'stock': 12,
    'price': 169.99,
    'image': 'assets/image/men watch.png',
  },
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Catalog'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
      tooltip: 'Go to Cart',
          )
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          var product = products[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Image.asset(
                product['image'],
                width: 56,
                height: 56,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const Icon(Icons.image_not_supported),
              ),
              title: Text(product['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Stock: ${product['stock']}'),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '₹${product['price']}',
                    style: TextStyle(
                      color: Colors.green[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  if (product['stock'] == 0)
                    const Text(
                      'Out of Stock',
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                ],
              ),
              enabled: product['stock'] > 0,
              onTap: () {
                // Handle product tap if needed
              },
            ),
          );
        },
      ),
    );
  }
}
