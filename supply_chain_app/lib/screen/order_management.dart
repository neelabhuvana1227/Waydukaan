// lib/screens/order_management.dart
import 'package:flutter/material.dart';

class OrderManagement extends StatefulWidget {
  @override
  _OrderManagementState createState() => _OrderManagementState();
}

class _OrderManagementState extends State<OrderManagement> {
  final List<String> orders = [];

  final TextEditingController orderController = TextEditingController();

  void _placeOrder() {
    if (orderController.text.isNotEmpty) {
      setState(() {
        orders.add(orderController.text);
        orderController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order Management')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: orderController,
              decoration: const InputDecoration(labelText: 'Enter Order Details'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _placeOrder,
              child: const Text('Place Order'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(orders[index]),
                    subtitle: const Text('Order placed'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
