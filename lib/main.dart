import 'package:flutter/material.dart';
import 'package:inventory_app/model/add_category.dart';
import 'package:inventory_app/model/add_customers.dart';
import 'package:inventory_app/model/add_sales.dart';
import 'package:inventory_app/view/category.dart';
import 'package:inventory_app/view/constant.dart';
import 'package:inventory_app/view/customers.dart';
import 'package:inventory_app/view/sales.dart';
import 'package:inventory_app/view/users.dart';
import 'view/dashboard.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: background,
      systemNavigationBarIconBrightness: Brightness.light));
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
      checkerboardOffscreenLayers: false,
      title: 'Flutter Demo',
      routes: {
        '/users': (context) => Users(),
        '/customers': (context) => Customers(),
        '/add-category': (context) => AddCategory(),
        '/add-customers': (context) => AddCustomers(),
        '/add-sales': (context) => AddSales(),
        
      },
      home: const Dashboard(),
    );
  }
}
