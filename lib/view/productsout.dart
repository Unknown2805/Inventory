import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'constant.dart';

class ProductsOut extends StatefulWidget {
  const ProductsOut({Key? key}) : super(key: key);

  @override
  State<ProductsOut> createState() => _ProductsOutState();
}

class _ProductsOutState extends State<ProductsOut> {
  bool search = true;
  bool heightBox = true;

  List _users = [];
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: background,
        body: Stack(children: [
          Column(
            children: [
              productsoutheader(context),
              productsoutlist(context),
            ],
          )
        ]));
  }

  Widget productsoutheader(BuildContext context) {
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
                        Text("Products Out",
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                          height: 40,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: boxColor,
                              border: Border.all(
                                color: red,
                                width: 1,
                              )),
                          child: TextButton(
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                            onPressed: () {},
                            child: Text('Export PDF',
                                style: TextStyle(color: red, fontSize: 10)),
                          )),

                      SizedBox(width: 8),

                      Container(
                          height: 40,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: boxColor,
                              border: Border.all(
                                color: green,
                                width: 1,
                              )),
                          child: TextButton(
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                            onPressed: () {},
                            child: Text('Export Excel',
                                style: TextStyle(color: green, fontSize: 10)),
                          )),
                    ],
                  ),
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

  Widget productsoutlist(BuildContext context) {
    return _users.length == 0
        ? RefreshProgressIndicator(
            color: primarycolor,
            backgroundColor: background,
          )
        : Expanded(
            child: ListView.builder(
            itemBuilder: (context, i) {
              var _user = _users[i];
              return Container(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: SingleChildScrollView(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: heightBox ? 50 : 145,
                        decoration: BoxDecoration(
                          color: boxColor.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: heightBox
                            ? Slidable(
                                endActionPane: ActionPane(
                                  motion: StretchMotion(),
                                  children: [
                                    SlidableAction(
                                      backgroundColor: Colors.transparent,
                                      icon: FluentIcons.delete_24_filled,
                                      foregroundColor: red,
                                      onPressed: (i) {
                                        // AwesomeDialog(
                                        //   context: context,
                                        //   dialogType: DialogType.INFO_REVERSED,
                                        //   animType: AnimType.BOTTOMSLIDE,
                                        //   title: 'Delete',
                                        //   desc: 'data can not be returned',
                                        //   btnCancelOnPress: () {},
                                        //   btnCancelColor: Colors.blue.shade600,
                                        //   btnOkColor: Colors.red.shade600,
                                        //   btnOkOnPress: ()  {
                                        //     // print(_user["id"]);
                                        //     // bool response =
                                        //     //     await repository.deleteDataCategory(
                                        //     //         _user["id"].toString());
                                        //     // getData();
                                        //   },
                                        // )..show();
                                      },
                                    ),
                                    SlidableAction(
                                      backgroundColor: Colors.transparent,
                                      // label: 'Edit',
                                      icon: FluentIcons.edit_24_filled,
                                      foregroundColor: green,
                                      onPressed: (i) {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) => EditCategory(
                                        //               id: _user["id"],
                                        //             )));
                                      },
                                    ),
                                  ],
                                ),
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: boxColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                                FluentIcons
                                                    .arrow_circle_up_24_regular,
                                                color: primarycolor,
                                                size: 25),
                                            SizedBox(width: 10),
                                            Text("Sprite",
                                                style: TextStyle(
                                                    color: white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold))
                                          ],
                                        ),
                                        Text("belum di proses",
                                            style: TextStyle(
                                                color: white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w100,
                                                fontStyle: FontStyle.italic))
                                      ],
                                    )))
                            : Slidable(
                                endActionPane: ActionPane(
                                  motion: StretchMotion(),
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                          width: 60,
                                          height: 60,
                                          child: TextButton(
                                              onPressed: () {},
                                              child: Icon(
                                                  FluentIcons.delete_24_filled,
                                                  size: 35,
                                                  color: red))),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                          width: 60,
                                          height: 60,
                                          child: TextButton(
                                              onPressed: () {},
                                              child: Icon(
                                                  FluentIcons.edit_24_filled,
                                                  size: 35,
                                                  color: green))),
                                    ),
                                  ],
                                ),
                                child: Container(
                                    width: 330,
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        color: boxColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            padding: EdgeInsets.only(left: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                        FluentIcons
                                                            .arrow_circle_up_24_regular,
                                                        color: primarycolor,
                                                        size: 25),
                                                    SizedBox(width: 10),
                                                    Text(
                                                        "${_user["product_id"]}",
                                                        style: TextStyle(
                                                            color: white,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))
                                                  ],
                                                ),
                                                Text("${_user["status"]}",
                                                    style: TextStyle(
                                                        color: white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w100,
                                                        fontStyle:
                                                            FontStyle.italic)),
                                              ],
                                            )),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                        width: 35,
                                                        child: Icon(
                                                            FluentIcons
                                                                .people_24_filled,
                                                            color:
                                                                primarycolor)),
                                                    SizedBox(width: 5),
                                                    Text(
                                                        "${_user["customer_id"]}",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14)),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                        width: 35,
                                                        child: Icon(
                                                            FluentIcons
                                                                .calendar_month_24_filled,
                                                            color:
                                                                primarycolor)),
                                                    SizedBox(width: 5),
                                                    Text("${_user["tanggal"]}",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14)),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                        width: 35,
                                                        child: Icon(
                                                            FluentIcons
                                                                .cube_24_filled,
                                                            color:
                                                                primarycolor)),
                                                    SizedBox(width: 5),
                                                    Text("${_user["qty"]}",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14)),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                      ),
                      SizedBox(height: 15),
                    ],
                  )));
            },
            itemCount: _users.length,
          ));
  }

  getData() async {
    var _dio = Dio();
    var response =
        await _dio.get("http://174.138.23.211:8282/api/apiProductsOut");
    var user = response.data;
    setState(() {
      _users = user;
    });
  }
}
