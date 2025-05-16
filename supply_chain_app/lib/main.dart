import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/cart_provider.dart';
import 'screen/login_screen.dart';
import 'screen/home_page.dart';
import 'screen/cart_screen.dart';
import 'screen/register_screen.dart';

void main()  {
  runApp(const MyApp());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Added const constructor

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Supply Chain App',
    home: Scaffold(
      appBar: AppBar(title: const Text('Firebase Initialized')),
      body: Center(child: Text('Welcome!')),
    ),
    theme: ThemeData(primarySwatch: Colors.blue),
    initialRoute: '/login', // Changed from '/' to '/login' assuming login is your start
    routes: {
      '/login': (context) => LoginScreen(),
      '/cart': (context) => CartScreen(),
      '/register': (context) => RegisterScreen(),
      // Removed '/home' from here to handle in onGenerateRoute
    },
      onGenerateRoute: (settings) {
        if (settings.name == '/home') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) {
              return HomePage(username: args['username']);
            },
          );
        }
        // Return null for unknown routes to let Flutter handle errors or fallback routes
        return null;
      },
    );
  }

}
