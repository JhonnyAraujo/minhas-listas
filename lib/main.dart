import 'package:flutter/material.dart';
import 'package:minhas_listas/pages/home.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minhas listas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: .fromSeed(seedColor: Colors.blue),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.lightGreen),
      ),
      home: const HomePage(),
    );
  }
}
