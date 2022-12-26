import 'dart:convert';

import 'package:e_commerce_app/product.dart';
import 'package:e_commerce_app/screen/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import './home.dart';
import 'dart:io';

class Splash extends StatelessWidget {
  const Splash({super.key});

  Future<List> fetchProducts() async {
    final response =
        await http.get(Uri.parse("https://shopping-api.deta.dev/products/all"));
    List data = jsonDecode(response.body)["data"];

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchProducts(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          // return Home(snapshot.data);
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            Navigator.of(context).pushNamed("/home", arguments: snapshot.data);
          });
        } else if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        return Scaffold(
          backgroundColor: const Color(0xfffd644e),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_cart,
                size: 200,
                color: Colors.white,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                child: Text(
                  "KZilla Store",
                  style: TextStyle(color: Colors.white, fontSize: 45),
                ),
              ),
              CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white))
            ],
          )),
        );
      }),
    );
  }
}
