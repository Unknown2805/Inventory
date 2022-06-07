// import 'package:flutter/material.dart';
// import 'package:inventory_app/view/login.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class UserDashboard extends StatefulWidget {
//   const UserDashboard({Key? key}) : super(key: key);

//   @override
//   State<UserDashboard> createState() => _UserDashboardState();
// }

// class _UserDashboardState extends State<UserDashboard> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             SharedPreferences prefs = await SharedPreferences.getInstance();
//             //Remove String
//             prefs.remove("username");
//             //Remove bool
//             prefs.remove("password");

//             Navigator.pushAndRemoveUntil(
//               context,
//               MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
//               ModalRoute.withName('/home'),
//             );
//           },
//           child: Text("logout ser"),
//         ),
//       ),
//     );
//   }
// }