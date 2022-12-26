import 'package:e_commerce_app/screen/cart.dart';
import 'package:e_commerce_app/screen/favourites.dart';
import 'package:e_commerce_app/screen/home.dart';
import 'package:e_commerce_app/screen/splash.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: ((context) => Splash()));
      case "/home":
        if (args is List) {
          return MaterialPageRoute(builder: ((context) => Home(data: args)));
        }
        break;
      case "/cart":
        if (args is List) {
          return MaterialPageRoute(builder: ((context) => Cart(data: args)));
        }
        break;
      case "/favourites":
        if (args is List) {
          return MaterialPageRoute(builder: ((context) => Fav(data: args)));
        }
        break;
      default:
        return MaterialPageRoute(
            builder: ((context) => const Scaffold(
                  body: Center(child: Text("Something went wrong")),
                )));
    }
  }
}
