import 'package:flutter/material.dart';
import 'package:trash_squad/screens/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Profile(),
    );
  }
}

// -> Login

// already login -> Home screen
//         Check they have token or not
//             Have token -> Home Screen
//             No token -> Login Screen