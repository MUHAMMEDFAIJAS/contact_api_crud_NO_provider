import 'package:contact_learn/controller/service_provider.dart';
import 'package:contact_learn/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return
         MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Apiprovider())
        ],
        child:
      const  MaterialApp(
          debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      ),
    );
  }
}
