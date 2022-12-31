import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Cart extends StatefulWidget {
  final List? data;

  const Cart({this.data});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  String returnTotal(List prods) {
    num total = 0;
    prods.forEach((element) {
      total += element["price"];
    });

    return total.toString();
  }

  removeFromCart(i, list) {
    if (list != []) {
      setState(() {
        list!.remove(list![i]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        title: Text("Your Cart"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.home))
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
                            // child: Image.network(data![index]["image"]),
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
                                  ElevatedButton(
                                    child: Text("Remove"),
                                    onPressed: (() =>
                                        removeFromCart(index, widget.data)),
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
                    )),
              ))),
      bottomNavigationBar: Container(
        height: 70,
        color: Color(0xfffd644e),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Total",
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Text(
                    "Rs. " + returnTotal(widget.data!),
                    style: TextStyle(fontSize: 25, color: Colors.black87),
                  ))
            ]),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Place Order",
                style: TextStyle(color: Colors.grey[800]),
              ),
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.green[300]),
            ),
          )
        ]),
      ),
    );
  }
}
