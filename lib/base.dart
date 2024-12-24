import 'package:flutter/material.dart';
import 'package:twilight_imperium/login/login.dart';
import 'package:twilight_imperium/main/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twilight Imperium',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
        ),
        useMaterial3: true,
      ),
      home: const BasePage(),
    );
  }
}

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  Pages currPage = Pages.login;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: switch (currPage) {
        Pages.login => LoginPage(onSuccessfulLogin: (key) {
          setState(() {
            currPage = Pages.main;
          });
        },),
        Pages.main => const MainPage()
      }
    );
  }
}

enum Pages {
  login,
  main
}