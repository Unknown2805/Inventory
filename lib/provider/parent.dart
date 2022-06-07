// import 'dart:convert';
// import 'dart:developer';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// //ParentClass
// class ParentInf {
//   int id;
//   String email;
//   String name;
//   String created_at;
//   String registration;
//   String avatar;
//   ParentInf({
//     id,
//     email,
//     name,
//     created_at,
//     registration,
//     avatar,
//   });
// }

// class Parent with ChangeNotifier {
//   ParentInf _inf;

//   ParentInf getParentInf() {
//     return _inf;
//   }

//   void setParentInf(ParentInf inf) {
//     _inf = inf;
//     print(_inf);
//     notifyListeners();
//   }

//   Future loginParentAndGetInf(String user, String pass) async {
//     var response;
//     var datauser;
//     var dataid;
//     try {
//       response = await http
//           .post(Uri.parse("http://174.138.23.211:8282/api/login"), body: {
//         "email": user.trim(),
//         "password": pass.trim(),
//       });
//       if (response.statusCode == 200) {
//         datauser = await json.decode(response.body);
//         dataid = json.decode(response.body);
//         // print(response.body);
//         log(response.body);
//         // log(dataid['data']['id'].toString());
//         insertInf(datauser);
//         if (datauser['data']['role'] == "user") {
//           return "user";
//         } else {
//           return "master";
//         }
//         // return true;
//       }
//     } catch (e) {
//       print(e);
//     }

//     return false;
//   }

//   insertInf(dynamic datauser) {
//     ParentInf parentInf = ParentInf(
//       id: datauser['data']['id'],
//       name: datauser['data']['name'],
//       email: datauser['data']['email'],
//     );

//     setParentInf(parentInf);
//   }

//   logOut() {
//     _inf = new ParentInf();
//     notifyListeners();
//     print(_inf.id);
//   }
// }