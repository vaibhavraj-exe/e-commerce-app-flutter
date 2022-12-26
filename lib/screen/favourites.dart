import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Fav extends StatefulWidget {
  final List? data;

  const Fav({this.data});
  @override
  State<Fav> createState() => _FavState();
}

class _FavState extends State<Fav> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        title: Text("KZilla Store"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed("/cart", arguments: widget.data);
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      backgroundColor: const Color(0xff151319),
      body: ListView.builder(
          itemCount: widget.data!.length,
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
                            child: Image.network(widget.data![index]["image"]),
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
                                    widget.data![index]["name"],
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
                                        widget.data![index]["price"].toString(),
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Color.fromARGB(255, 202, 202, 202),
                                      // fontFamily:
                                    ),
                                  ),
                                ),
                                Row(children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(7, 0, 0, 0),
                                    child: ElevatedButton(
                                        onPressed: () {},
                                        child: Icon(Icons.star)),
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
                  Navigator.of(context)
                      .pushNamed("/home", arguments: widget.data);
                  break;
                case 1:
                  Navigator.of(context)
                      .pushNamed("/favourites", arguments: widget.data);
                  break;
                default:
              }
            })),
        currentIndex: selectedIndex,
      ),
    );
  }
}