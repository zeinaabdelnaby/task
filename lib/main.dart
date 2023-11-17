import 'package:flutter/material.dart';
import 'package:task/pages/first_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality( 
        textDirection: TextDirection.rtl, 
        child: FirstPage(),
      ),
    );
  }
}
