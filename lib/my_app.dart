import 'package:ecard/screens/all_api_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          bodyMedium: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: AllApiScreen(),
    );
  }
}
