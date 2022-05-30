import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'constant.dart';
import 'detailproduct.dart';

class Products extends StatefulWidget {
  const Products({Key key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  bool heightBox = true;
  bool search = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: background,
        body: Stack(children: [
          Column(
            children: [
              productsheader(context),
              productslist(context),
            ],
          )
        ]));
  }

  Widget productsheader(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.center,
            height: 90,
            child: search
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(FluentIcons.arrow_reply_24_filled,
                                color: Colors.white)),
                        Text("Products",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                this.search = !this.search;
                              });
                            },
                            icon: const Icon(Icons.search_outlined,
                                color: Colors.white)),
                      ])
                : Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          height: 35,
                          width: 260,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: white),
                          child: TextField(
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Looking for something?',
                                hintStyle: TextStyle(color: Colors.grey),
                              )),
                        ),
                        SizedBox(width: 2),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                this.search = !this.search;
                              });
                            },
                            icon: const Icon(FluentIcons.dismiss_24_regular,
                                color: white, size: 25)),
                      ],
                    ),
                  ),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 46,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: boxColor,
                        border: Border.all(
                          color: primarycolor,
                          width: 1,
                        )),
                    child: TextButton(
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {
                        setState(() {
                          this.heightBox = !this.heightBox;
                        });
                      },
                      child: !this.heightBox
                          ? Text("list",
                              style:
                                  TextStyle(color: primarycolor, fontSize: 16))
                          : Text("detail",
                              style:
                                  TextStyle(color: primarycolor, fontSize: 16)),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }

  Widget productslist(BuildContext context) {
    return Expanded(
        child: Container(
            padding: const EdgeInsets.all(25),
            child: SingleChildScrollView(
                child: Column(children: [
              Container(
                  height: 50,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: boxColor, borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Product 1",
                          style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14)),
                      Icon(FluentIcons.arrow_circle_right_24_filled,
                          color: white),
                    ],
                  ))
            ]))));
  }
}
