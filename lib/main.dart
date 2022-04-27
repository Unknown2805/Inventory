import 'package:flutter/material.dart';
import 'package:inventory_app/view/customers.dart';
import 'package:inventory_app/view/users.dart';
import 'view/dashboard.dart';
import 'package:flutter/services.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      checkerboardOffscreenLayers: false ,
      title: 'Flutter Demo',
      routes: {
        '/users': (context) => Users(),
        '/customers' : (context) => Customers(),
      },
      home: const Dashboard(),
    );
  }
}

