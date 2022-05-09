import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:inventory_app/model/repo-category.dart';
import 'package:inventory_app/view/customers.dart';
import 'package:inventory_app/view/sales.dart';

import '../view/category.dart';
import '';

class AddSales extends StatefulWidget {
  @override
  _AddSalesState createState() => _AddSalesState();
}

class _AddSalesState extends State<AddSales> {
  Repository repository = Repository();
  final _namaController = TextEditingController();
  final _alamatController = TextEditingController();
  final _emailController = TextEditingController();
  final _teleponController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Add blog'),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: _namaController,
              decoration: InputDecoration(hintText: 'Name'),
            ),
            TextField(
              controller: _alamatController,
              decoration: InputDecoration(hintText: 'Alamat'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(hintText: 'Email'),
            ),
            TextField(
              controller: _teleponController,
              decoration: InputDecoration(hintText: 'telepon'),
            ),
            ElevatedButton(
                onPressed: () async {
                  bool response = await repository.postDataSales(
                    _namaController.text,
                    _alamatController.text,
                    _emailController.text,
                    _teleponController.text,
                  );
                
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Sales()),
                  );
                },
                child: Text('Submit'))
          ],
        ),
      ),
    );
  }
}
