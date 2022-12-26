import 'package:e_commerce_app/components/card_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatelessWidget {
  final List? data;

  const Home({this.data}); //, {Object? data}

  @override
  Widget build(BuildContext context) {
    return CardList(data);
  }
}
//   Scaffold CardList() {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
//         title: Text("KZilla Store"),
//         actions: [
//           IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
//         ],
//       ),
//       backgroundColor: const Color(0xff151319),
//       body: ListView.builder(
//           itemCount: data!.length,
//           itemBuilder: ((context, index) => Card(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20)),
//                 elevation: 8,
//                 shadowColor: Colors.black,
//                 child: Container(
//                     decoration: BoxDecoration(
//                         color: const Color(0xff1B191F),
//                         borderRadius: BorderRadius.circular(10)),
//                     height: 180,
//                     padding: const EdgeInsets.all(12),
//                     child: Row(
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(20)),
//                           width: 180,
//                           height: 180,
//                           clipBehavior: Clip.hardEdge,
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(7),
//                             child: Image.network(data![index]["image"]),
//                           ),
//                         ),
//                         Container(
//                           padding: const EdgeInsets.fromLTRB(20, 10, 0, 20),
//                           child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsets.fromLTRB(0, 2, 0, 10),
//                                   child: Text(
//                                     data![index]["name"],
//                                     textAlign: TextAlign.left,
//                                     style: TextStyle(
//                                       fontSize: 20,
//                                       color: Color.fromARGB(255, 219, 219, 219),
//                                       // fontFamily:
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
//                                   child: Text(
//                                     "Rs." + data![index]["price"].toString(),
//                                     textAlign: TextAlign.left,
//                                     style: TextStyle(
//                                       fontSize: 24,
//                                       color: Color.fromARGB(255, 202, 202, 202),
//                                       // fontFamily:
//                                     ),
//                                   ),
//                                 ),
//                                 Row(children: [
//                                   ElevatedButton(
//                                     child: Text("Add to cart"),
//                                     onPressed: () {},
//                                   ),
//                                   Padding(
//                                     padding: EdgeInsets.fromLTRB(7, 0, 0, 0),
//                                     child: ElevatedButton(
//                                         onPressed: () {},
//                                         child: Icon(Icons.star_border)),
//                                   ),
//                                 ])
//                               ]),
//                         )
//                       ],
//                     )
//                     ),
//               ))),
//     );
//   }
// }
