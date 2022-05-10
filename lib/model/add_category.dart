import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:inventory_app/model/repo-category.dart';

import '../view/category.dart';
import '';

class AddCategory extends StatefulWidget {
  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  Repository repository = Repository();
  final _nameController = TextEditingController();
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
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Input data name'),
            ),
            ElevatedButton(
                onPressed: () async {
                  bool response = await repository.postDataCategory(
                    _nameController.text,
                  );

                  if(response) {
                    Navigator.of(context).popAndPushNamed('/Categories');
                  }else
                  print('Post data gagal');
                },
                child: Text('Submit'))
          ],
        ),
      ),
    );
  }
}
