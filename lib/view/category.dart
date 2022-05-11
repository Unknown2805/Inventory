import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:inventory_app/model/repo-category.dart';
import 'package:inventory_app/view/dashboard.dart';
import 'constant.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  Repository repository = Repository();
  final _nameController = TextEditingController();
  bool search = true;

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

        // tombol add data
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

        // Tutup tombol add data

        body: Stack(children: [
          Column(
            children: [
              categoriesheader(context),
              categorieslist(context),
            ],
          )
        ]));
  }

  Future openDialog() => showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Container(
          child: AlertDialog(
            backgroundColor: background,
            title:
                Text('Input data name', style: TextStyle(color: primarycolor)),
            // ignore: avoid_unnecessary_containers
            content: Container(
              height: 80,
              child: Column(
                children: [
                  TextField(
                    autofocus: true,
                    style: TextStyle(color: white),
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'Name',
                      hintStyle: TextStyle(color: white.withOpacity(0.5)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: primarycolor),
                      ),
                    ),
                  ),
                ],
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
                  _nameController.clear();
                },
              ),
              TextButton(
                child: Text(
                  'SUBMIT',
                  style: TextStyle(color: primarycolor),
                ),
                onPressed: () async {
                  bool response = await repository.postDataCategory(
                    _nameController.text,
                  );
                  getData();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Categories()),
                  );
                },
              ),
            ],
          ),
        ),
      );

  Widget categoriesheader(BuildContext context) {
    return SafeArea(
        child: Container(
      padding: EdgeInsets.all(15),
      alignment: Alignment.center,
      height: 90,
      child: search
          ? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => Dashboard()),
                        (Route<dynamic> route) => false);
                  },
                  icon: const Icon(FluentIcons.arrow_reply_24_filled,
                      color: Colors.white)),
              Text("Categories",
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
                  icon: const Icon(Icons.search_outlined, color: Colors.white)),
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
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: white),
                    child: TextField(
                        style: TextStyle(color: Colors.black, fontSize: 15),
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
    ));
  }

  Widget categorieslist(BuildContext context) {
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
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: SingleChildScrollView(
                        child: Column(children: [
                      Slidable(
                          endActionPane: ActionPane(
                            motion: StretchMotion(),
                            children: [
                              SlidableAction(
                                backgroundColor: Colors.transparent,
                                icon: FluentIcons.delete_24_filled,
                                foregroundColor: red,
                                onPressed: (i) {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.INFO,
                                    animType: AnimType.BOTTOMSLIDE,
                                    title: 'Delete',
                                    desc:
                                        "data can't be returned if it's been deleted",
                                    btnCancelOnPress: () {},
                                    btnOkOnPress: () {},
                                  )..show();
                                },
                              ),
                              SlidableAction(
                                backgroundColor: Colors.transparent,
                                // label: 'Edit',
                                icon: FluentIcons.edit_24_filled,
                                foregroundColor: green,
                                onPressed: (i) {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.INFO,
                                    animType: AnimType.BOTTOMSLIDE,
                                    title: 'Edit',
                                    desc: 'change data here!',
                                    btnCancelOnPress: () {},
                                    btnOkOnPress: () {},
                                  )..show();
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.category_rounded,
                                      color: Color(0xffa9def9), size: 25),
                                  SizedBox(width: 10),
                                  Text("${_user["name"]}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold))
                                ],
                              ))),
                      SizedBox(height: 6)
                    ])));
              },
              itemCount: _users.length,
            ),
          );
  }

  getData() async {
    var _dio = Dio();
    var response =
        await _dio.get("http://174.138.23.211:8282/api/apiCategories");
    var user = response.data;
    setState(() {
      _users = user;
    });
  }
}
