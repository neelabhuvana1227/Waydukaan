import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Import your screen widgets
import 'package:supply_chain_app/screen/login_screen.dart';
import 'package:supply_chain_app/screen/product_list.dart';
import 'package:supply_chain_app/screen/order_management.dart';
import 'package:supply_chain_app/screen/delivery_tracking.dart';
import 'package:supply_chain_app/screen/communication.dart';

void main() {
  group('LoginScreen Tests', () {
    testWidgets('Login Screen UI test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: LoginScreen()));

      expect(find.byType(TextField), findsNWidgets(2));
      expect(find.text('Username'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });
  });

  group('ProductList Tests', () {
    testWidgets('Product List Screen UI test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: ProductList()));

      expect(find.text('Product Catalog'), findsOneWidget);
      expect(find.byType(ListTile), findsWidgets); // At least one product
    });
  });

  group('OrderManagement Tests', () {
    testWidgets('Order Management Screen UI test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: OrderManagement()));

      expect(find.byType(TextField), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });
  });

  group('DeliveryTracking Tests', () {
    testWidgets('Delivery Tracking Screen UI test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: DeliveryTracking()));

      expect(find.text('Delivery Tracking'), findsOneWidget);
      expect(find.byType(ListTile), findsWidgets); // At least one delivery status
    });
  });

  group('Communication Tests', () {
    testWidgets('Communication Screen UI test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Communication()));

      expect(find.byType(TextField), findsOneWidget);
      expect(find.byIcon(Icons.send), findsOneWidget);
    });
  });
}
