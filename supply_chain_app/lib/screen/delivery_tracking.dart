// lib/screens/delivery_tracking.dart
import 'package:flutter/material.dart';

class DeliveryTracking extends StatelessWidget {
  final List<Map<String, String>> deliveries = [
    {'orderId': 'ORD123', 'status': 'In Transit'},
    {'orderId': 'ORD124', 'status': 'Delivered'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Delivery Tracking')),
      body: ListView.builder(
        itemCount: deliveries.length,
        itemBuilder: (context, index) {
          var delivery = deliveries[index];
          return ListTile(
            title: Text('Order ID: ${delivery['orderId']}'),
            subtitle: Text('Status: ${delivery['status']}'),
          );
        },
      ),
    );
  }
}
