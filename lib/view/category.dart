import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'constant.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
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

        floatingActionButton: FloatingActionButton(
          onPressed: () =>
              Navigator.of(context).popAndPushNamed('/add-category'),
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
              categoriesheader(context),
              categorieslist(context),
            ],
          )
        ]));
  }

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
                    Navigator.pop(context);
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
    return Expanded(
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
