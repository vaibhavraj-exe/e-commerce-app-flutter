import 'dart:convert';
import 'package:e_commerce_app/route_generator.dart';
import 'package:e_commerce_app/screen/splash.dart';

import 'product.dart';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
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
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

// class _MyHomePageState extends State<MyHomePage> {
//   // fetchproducts() async {
//   //   var p_url = Uri.parse("https://shopping-api.deta.dev/products/all");
//   //   var responce = await http.get(p_url);
//   //   var j_responce = json.decode(responce.body)["data"];
//   //   // print(j_responce);

//   //   return j_responce;
//   // }

//   // fetchProducts() async {
//   //   var response =
//   //       await http.get(Uri.parse('https://shopping-api.deta.dev/products/all'));

//   //   List<dynamic> products = (json.decode(response.body) as List)
//   //       .map((i) => Product.fromJson(i))
//   //       .toList();
//   //   return products;
//   // }

  // fetchProducts() async {
  //   var response =
  //       await http.get(Uri.parse('https://shopping-api.deta.dev/products/all'));
  //   var body = response.body;
  //   // Product product = Product.fromJson(jsonDecode(body)["data"][0]);
  //   List products = jsonDecode(body)["data"];
  //   print("PRINT :");
  //   print(jsonDecode(body)["data"].toString());

  //   return products;
  // }

  

// class ProductCard extends StatelessWidget {
//   const ProductCard({
//     Key? key,
//   }) : super(key: key);

  // fetchProducts() async {
  //   var response =
  //       await http.get(Uri.parse('https://shopping-api.deta.dev/products/all'));
  //   var body = response.body;
  //   Product product = Product.fromJson(jsonDecode(body)["data"][0]);
  //   return product;
  // }

//   @override
//   Widget build(BuildContext context) {
//     var products = fetchProducts();
//     // print(products.id.toString());
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       elevation: 8,
//       shadowColor: Colors.black,
//       child: Container(
//           decoration: BoxDecoration(
//               color: Color(0xff1B191F),
//               borderRadius: BorderRadius.circular(10)),
//           height: 180,
//           padding: const EdgeInsets.all(12),
//           child: Row(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                     color: Colors.lightBlue,
//                     borderRadius: BorderRadius.circular(20)),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(7),
//                   child: Image.network(
//                       "https://media.istockphoto.com/id/1354031012/photo/red-t-shirt-mockup-men-as-design-template-tee-shirt-blank-isolated-on-white-front-view.jpg?b=1&s=170667a&w=0&k=20&c=NTyAiI0Xg191ROqg0DnkfJBdi3sliE8Cj5Sxv8LTdzQ="),
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.fromLTRB(20, 10, 0, 20),
//                 child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.fromLTRB(0, 2, 0, 10),
//                         child: Text(
//                           products[0]["name"],
//                           textAlign: TextAlign.left,
//                           style: TextStyle(
//                             fontSize: 20,
//                             color: Color.fromARGB(255, 219, 219, 219),
//                             // fontFamily:
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
//                         child: Text(
//                           "Rs." + "2499.0",
//                           textAlign: TextAlign.left,
//                           style: TextStyle(
//                             fontSize: 24,
//                             color: Color.fromARGB(255, 202, 202, 202),
//                             // fontFamily:
//                           ),
//                         ),
//                       ),
//                       Row(children: [
//                         ElevatedButton(
//                           child: Text("Add to cart"),
//                           onPressed: () {},
//                         ),
//                         Padding(
//                           padding: EdgeInsets.fromLTRB(7, 0, 0, 0),
//                           child: ElevatedButton(
//                               onPressed: () {}, child: Icon(Icons.star_border)),
//                         ),
//                       ])
//                     ]),
//               )
//             ],
//           )
//           // child: Image.network(
//           //     "https://media.istockphoto.com/id/1354031012/photo/red-t-shirt-mockup-men-as-design-template-tee-shirt-blank-isolated-on-white-front-view.jpg?b=1&s=170667a&w=0&k=20&c=NTyAiI0Xg191ROqg0DnkfJBdi3sliE8Cj5Sxv8LTdzQ="),
//           ),
//     );
//   }
// }
