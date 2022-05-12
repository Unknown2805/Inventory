import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:inventory_app/model/repo-category.dart';
import 'package:inventory_app/view/constant.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:inventory_app/view/dashboard.dart';

class Users extends StatefulWidget {
  const Users({Key? key}) : super(key: key);

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  Repository repository = Repository();
  final _namaController = TextEditingController();
  final _roleController = TextEditingController();
  final _emailController = TextEditingController();
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
        
        body: Stack(children: [
          Column(
            children: [
              usersheader(context),
              userslist(context),
            ],
          )
        ]));
  }

  Future openDialog() => showDialog(
        context: context,
        builder: (context) => Container(
          child: AlertDialog(
            backgroundColor: background,
            title:
                Text('Input data name', style: TextStyle(color: primarycolor)),
            // ignore: avoid_unnecessary_containers
            content: Container(
              height: 200,
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
                    controller: _roleController,
                    decoration: InputDecoration(
                      hintText: 'Role',
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
                  _namaController.clear();
                      _roleController.clear();
                      _emailController.clear();
                },
              ),
              TextButton(
                  child: Text(
                    'SUBMIT',
                    style: TextStyle(color: primarycolor),
                  ),
                  onPressed: () async {
                    bool response = await repository.postDataUsers(
                      _namaController.text,
                      _roleController.text,
                      _emailController.text,
                    );
                    getData();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Users()),
                    );
                  })
            ],
          ),
        ),
      );

void submit() {
    Navigator.of(context).pop();
  }


  Widget usersheader(BuildContext context) {
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
              Text("Data",
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

  Widget userslist(BuildContext context) {
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
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            child: Row(children: [
                          Container(
                              alignment: Alignment.center,
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  border: Border.all(
                                      color: primarycolor, width: 2)),
                              child: Icon(FluentIcons.person_20_regular,
                                  color: Colors.white, size: 35)),
                          SizedBox(width: 10),
                          Container(
                              width: 150,
                              height: 50,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Text("${_user["name"]}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                      Text("${_user["email"]}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12))
                                    ]),
                              )),
                          Container(
                            width: 105,
                            height: 50,
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("${_user["role"]}",
                                    style: TextStyle(
                                        color: primarycolor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ])),
                      ]),
                ),
              );
            },
            itemCount: _users.length,
          ));
  }

  getData() async {
    var _dio = Dio();
    var response = await _dio.get("http://174.138.23.211:8282/api/apiUsers");
    var user = response.data;
    setState(() {
      _users = user;
    });
  }
}
