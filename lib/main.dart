import 'package:fakestore/screens/details/details_screen.dart';
import 'package:fakestore/screens/home/home_screen.dart';
import 'package:fakestore/screens/splash/splash_screen.dart';
import 'package:fakestore/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

setupLocator() {
  GetIt.I.registerLazySingleton(() => ProductService());
}

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application..
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
        routes: {
          HomeScreen.routeName: (ctx) => const HomeScreen(),
          DetailsScreen.routeName: (ctx) => const DetailsScreen()
        });
  }
}
