import 'package:app_rede_social/pages/homepage.dart';
import 'package:app_rede_social/pages/login.dart';
import 'package:app_rede_social/pages/teste_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

//55
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primaryColor: Colors.blueGrey,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueGrey,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: "PublicSans",
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        fontFamily: "PublicSans",
      ),
      home: const HomePage(),
    );
  }
}
