import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:googledocs/screens/login_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
  //A widget that stores the state of providers.
  //All Flutter applications using Riverpod must contain a [ProviderScope] at the root of their widget tree.
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
