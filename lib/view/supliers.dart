import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:inventory_app/model/repo-category.dart';
import 'constant.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Suppliers extends StatefulWidget {
  const Suppliers({Key key}) : super(key: key);

  @override
  State<Suppliers> createState() => _SuppliersState();
}

class _SuppliersState extends State<Suppliers> {
  Repository repository = Repository();
  final _namaController = TextEditingController();
  final _alamatController = TextEditingController();
  final _emailController = TextEditingController();
  final _teleponController = TextEditingController();
  final _npwpController = TextEditingController();
  final _no_ktpController = TextEditingController();

  @override
  bool search = true;
  bool heightBox = true;

  List _users = [];
  @override
  void initState() {
    getData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: background,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            openDialog();
          },
          tooltip: 'Increment',
          child: const Icon(
            Icons.add,
            color: white,
            size: 35,
          ),
          backgroundColor: primarycolor,
        ),
        body: Stack(children: [
          Column(
            children: [
              supliersheader(context),
              suplierslist(context),
            ],
          )
        ]));
  }

  Future openDialog() => showDialog(
        context: context,
        builder: (context) => Container(
          child: AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: primarycolor)),
            backgroundColor: background,
            title:
                Text('Input data name', style: TextStyle(color: primarycolor)),
            // ignore: avoid_unnecessary_containers
            content: Container(
              height: 324,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      autofocus: true,
                      style: TextStyle(color: white),
                      controller: _namaController,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        hintStyle: TextStyle(color: white.withOpacity(0.5)),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primarycolor),
                        ),
                      ),
                    ),
                    TextField(
                      style: TextStyle(color: white),
                      controller: _alamatController,
                      decoration: InputDecoration(
                        hintText: 'Alamat',
                        hintStyle: TextStyle(color: white.withOpacity(0.5)),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primarycolor),
                        ),
                      ),
                    ),
                    TextField(
                      style: TextStyle(color: white),
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(color: white.withOpacity(0.5)),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primarycolor),
                        ),
                      ),
                    ),
                    TextField(
                      style: TextStyle(color: white),
                      keyboardType: TextInputType.number,
                      controller: _teleponController,
                      decoration: InputDecoration(
                        hintText: 'telepon',
                        hintStyle: TextStyle(
                          color: white.withOpacity(0.5),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primarycolor),
                        ),
                      ),
                    ),
                    TextField(
                      style: TextStyle(color: white),
                      keyboardType: TextInputType.number,
                      controller: _npwpController,
                      decoration: InputDecoration(
                        hintText: 'nomor npwp',
                        hintStyle: TextStyle(
                          color: white.withOpacity(0.5),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primarycolor),
                        ),
                      ),
                    ),
                    TextField(
                      style: TextStyle(color: white),
                      keyboardType: TextInputType.number,
                      controller: _no_ktpController,
                      decoration: InputDecoration(
                        hintText: 'ktp_number',
                        hintStyle: TextStyle(
                          color: white.withOpacity(0.5),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primarycolor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            actions: [
              TextButton(
                child: Text(
                  'CLOSE',
                  style: TextStyle(color: primarycolor),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  _namaController.clear();
                  _alamatController.clear();
                  _emailController.clear();
                  _teleponController.clear();
                  _npwpController.clear();
                  _no_ktpController.clear();
                },
              ),
              TextButton(
                  child: Text(
                    'SUBMIT',
                    style: TextStyle(color: primarycolor),
                  ),
                  onPressed: () async {
                    bool response = await repository.postDataSuppliers(
                      _namaController.text,
                      _alamatController.text,
                      _emailController.text,
                      _teleponController.text,
                      _npwpController.text,
                      _no_ktpController.text,
                    );
                    getData();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Suppliers()),
                    );
                  })
            ],
          ),
        ),
      );

  Widget supliersheader(BuildContext context) {
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
                        Text("Suppliers",
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

  Widget suplierslist(BuildContext context) {
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      child: SingleChildScrollView(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: heightBox ? 50 : 200,
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
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                                        .data_histogram_24_filled,
                                                    color: primarycolor,
                                                    size: 25),
                                                SizedBox(width: 10),
                                                Text("${_user["nama"]}",
                                                    style: TextStyle(
                                                        color: white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold))
                                              ],
                                            ),
                                          ],
                                        )),
                                  )
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
                                                      FluentIcons
                                                          .delete_24_filled,
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
                                                      FluentIcons
                                                          .edit_24_filled,
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
                                                padding:
                                                    EdgeInsets.only(left: 10),
                                                child: Text("${_user["nama"]}",
                                                    style: TextStyle(
                                                        color: primarycolor,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold))),
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
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                            width: 35,
                                                            child: Icon(
                                                                FluentIcons
                                                                    .location_24_filled,
                                                                color:
                                                                    primarycolor)),
                                                        SizedBox(width: 5),
                                                        Text(
                                                            "${_user["alamat"]}",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14)),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Container(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                            width: 35,
                                                            child: Icon(
                                                                FluentIcons
                                                                    .mail_24_filled,
                                                                color:
                                                                    primarycolor)),
                                                        SizedBox(width: 5),
                                                        Text(
                                                            "${_user["email"]}",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14)),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Container(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                            width: 35,
                                                            child: Icon(
                                                                FluentIcons
                                                                    .call_24_filled,
                                                                color:
                                                                    primarycolor)),
                                                        SizedBox(width: 5),
                                                        Text(
                                                            "${_user["telepon"]}",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14)),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Container(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                            width: 35,
                                                            child: Icon(
                                                                FluentIcons
                                                                    .person_accounts_24_filled,
                                                                color:
                                                                    primarycolor)),
                                                        SizedBox(width: 5),
                                                        Text("${_user["npwp"]}",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14)),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Container(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                            width: 35,
                                                            child: Icon(
                                                                FluentIcons
                                                                    .contact_card_24_filled,
                                                                color:
                                                                    primarycolor)),
                                                        SizedBox(width: 5),
                                                        Text(
                                                            "${_user["no_ktp"]}",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14)),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )),
                                  ),
                          ),
                          SizedBox(height: 5),
                        ],
                      )));
                },
                itemCount: _users.length));
  }

  getData() async {
    var _dio = Dio();
    var response =
        await _dio.get("http://174.138.23.211:8282/api/apiSuppliers");
    var user = response.data;
    setState(() {
      _users = user;
    });
  }
}
