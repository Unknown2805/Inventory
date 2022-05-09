import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:inventory_app/model/repo-category.dart';
import 'package:inventory_app/view/customers.dart';

import '../view/category.dart';
import '';

class AddCustomers extends StatefulWidget {


  @override
  _AddCustomersState createState() => _AddCustomersState();
}

class _AddCustomersState extends State<AddCustomers> {
  Repository repository = Repository();
  final _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('TAMBAH ktl'),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(hintText: 'Name'
              ),
            ),
             
            ElevatedButton(onPressed: () async {
              bool response = await repository.postDataCategory(_nameController.text, );

              
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Customers()),
              );
              
            }, child: Text('Submit'))
          ],
        ),
      ),
    );
  }

  
}
