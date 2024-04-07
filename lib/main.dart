import 'package:flutter/material.dart';
import 'package:flutter_api_breaking_bad/Screen/HomeBreakingBad.dart';
void main() {
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: BreakingBadHome(),
    );
  }
}