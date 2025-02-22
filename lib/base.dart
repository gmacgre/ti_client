import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twilight_imperium/login/login.dart';
import 'package:twilight_imperium/main/main.dart';
import 'package:twilight_imperium/state/state_game.dart';
import 'package:twilight_imperium/state/state_page.dart' as ps;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ps.PageState()),
        ChangeNotifierProvider(create: (context) => GameState()),
      ],
      child: MaterialApp(
        title: 'Twilight Imperium',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.amber,
          ),
          useMaterial3: true,
        ),
        home: const BasePage(),
      ),
    );
  }
}

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {

  @override
  Widget build(BuildContext context) {
    ps.Page currPage = context.watch<ps.PageState>().currPage;
    return Scaffold(
      body: switch (currPage) {
        ps.Page.login => const LoginPage(),
        ps.Page.main => const MainPage()
      }
    );
  }
}

