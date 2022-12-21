import 'dart:convert';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  fetchproducts() async {
    var p_url;
    p_url =
        await http.get(Uri.https("https://shopping-api.deta.dev/products/all"));
    return json.decode(p_url.body["results"]);
  }

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Color red_color = Color(0xfffd644e);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: MaterialColor(red_color.value, <int, Color>{
            50: red_color.withOpacity(0.1),
            100: red_color.withOpacity(0.2),
            200: red_color.withOpacity(0.3),
            300: red_color.withOpacity(0.4),
            400: red_color.withOpacity(0.5),
            500: red_color.withOpacity(0.6),
            600: red_color.withOpacity(0.7),
            700: red_color.withOpacity(0.8),
            800: red_color.withOpacity(0.9),
            900: red_color.withOpacity(1.0),
          }),
          backgroundColor: Color.fromARGB(255, 21, 19, 25)),
      home: const MyHomePage(title: 'KZilla'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // var p_list = fetchproducts
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff151319),
        appBar: AppBar(
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          title: Text(widget.title),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(12, 16, 12, 0),
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 8,
              shadowColor: Colors.black,
              child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff1B191F),
                      borderRadius: BorderRadius.circular(10)),
                  height: 180,
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(20)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: Image.network(
                              "https://media.istockphoto.com/id/1354031012/photo/red-t-shirt-mockup-men-as-design-template-tee-shirt-blank-isolated-on-white-front-view.jpg?b=1&s=170667a&w=0&k=20&c=NTyAiI0Xg191ROqg0DnkfJBdi3sliE8Cj5Sxv8LTdzQ="),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 10, 0, 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 2, 0, 10),
                                child: Text(
                                  "Check",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 219, 219, 219),
                                    // fontFamily:
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                                child: Text(
                                  "Rs." + "2499.0",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Color.fromARGB(255, 202, 202, 202),
                                    // fontFamily:
                                  ),
                                ),
                              ),
                              Row(children: [
                                ElevatedButton(
                                  child: Text("Add to cart"),
                                  onPressed: () {},
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(7, 0, 0, 0),
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      child: Icon(Icons.star_border)),
                                ),
                              ])
                            ]),
                      )
                    ],
                  )
                  // child: Image.network(
                  //     "https://media.istockphoto.com/id/1354031012/photo/red-t-shirt-mockup-men-as-design-template-tee-shirt-blank-isolated-on-white-front-view.jpg?b=1&s=170667a&w=0&k=20&c=NTyAiI0Xg191ROqg0DnkfJBdi3sliE8Cj5Sxv8LTdzQ="),
                  ),
            )
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
