import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/controller/provider.dart';
import 'package:pokedex_app/model/pokemon_list.dart';
import 'package:pokedex_app/screen/detail_page.dart';
import 'package:pokedex_app/screen/home_page.dart';
import 'package:pokedex_app/screen/spalshscreen/splashscreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PokemonListProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        //fontFamily: 'Poppins',
      ),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return CupertinoPageRoute(
                builder: (_) => const SplashScreen(), settings: settings);
          case '/home':
            return CupertinoPageRoute(
                builder: (_) => const HomeScreen(), settings: settings);
          case '/detail':
            return CupertinoPageRoute(
                builder: (_) => const DetailPokemonScreen(),
                settings: settings);
        }
        return null;
      },
    );
  }
}
