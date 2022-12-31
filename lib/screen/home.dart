import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  final List? data;

  const Home({this.data});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  List favourites = [];
  List displayList = [];
  List cartList = [];
  bool isHome = true;

  @override
  Widget build(BuildContext context) {
    if (isHome) {
      displayList = widget.data!;
    } else {
      displayList = favourites;
    }

    // debugPrint(displayList[0]["image"].toString());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        title: Text("KZilla Store"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/cart", arguments: cartList);
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      backgroundColor: const Color(0xff151319),
      body: ListView.builder(
          itemCount: displayList.length,
          itemBuilder: ((context, index) => Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 8,
                shadowColor: Colors.black,
                child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xff1B191F),
                        borderRadius: BorderRadius.circular(10)),
                    height: 180,
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          width: 180,
                          height: 180,
                          clipBehavior: Clip.hardEdge,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(7),
                            // child: Image.network(displayList[index]["image"]),
                            child: Image.network(
                                "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aGVhZHBob25lc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60"),
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
                                    displayList[index]["name"],
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
                                    "Rs." +
                                        displayList[index]["price"].toString(),
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
                                    onPressed: () {
                                      cartList.add(displayList[index]);
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(7, 0, 0, 0),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          if (favourites.length == 0) {
                                            favourites.add(displayList[index]);
                                          } else {
                                            for (var element in favourites) {
                                              if (element["product_id"] ==
                                                  displayList[index]
                                                      ["product_id"]) {
                                                break;
                                              } else if (element[
                                                      "product_id"] ==
                                                  favourites[favourites.length -
                                                      1]["product_id"]) {
                                                favourites
                                                    .add(displayList[index]);
                                                break;
                                              }
                                            }
                                            ;
                                          }
                                        },
                                        child: Icon(Icons.star_border)),
                                  ),
                                ])
                              ]),
                        )
                      ],
                    )),
              ))),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_border), label: "Favourites")
        ],
        backgroundColor: Color(0xfffd644e),
        selectedItemColor: Colors.white,
        onTap: ((index) => setState(() {
              selectedIndex = index;
              switch (index) {
                case 0:
                  isHome = true;
                  print("Show All");
                  break;
                case 1:
                  isHome = false;
                  print("Show Favourites");
                  // print(displayList);
                  break;
                default:
              }
            })),
        currentIndex: selectedIndex,
      ),
    );
  }
}
