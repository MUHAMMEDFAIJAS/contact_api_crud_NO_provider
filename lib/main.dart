import 'package:contact_learn/controller/service_provider.dart';
import 'package:contact_learn/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ServiceProvider())
      ],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
