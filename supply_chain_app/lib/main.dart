import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screen/login_screen.dart';
import 'screen/home_page.dart';  
import 'screen/cart_screen.dart';
import 'screen/register_screen.dart';
import 'screen/cart_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartProvider(),

      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) {
          final userEmail = ModalRoute.of(context)!.settings.arguments as String;
          return HomePage(username: userEmail);  // use correct parameter name
        },
        '/register': (context) => RegisterScreen(),
        '/cart': (context) => CartScreen(),
      },
    );
  }
}
