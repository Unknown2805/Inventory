import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../helper/datascan.dart';

class ApiHelper {
  static Future getData(String prodcode) async {
    try {
      final response = await http
          .post(Uri.parse('https://la-att.intek.co.id/api/scan/data'), body: {
        "product_code": prodcode,
      });
      if (response.statusCode == 200) {
        // if every things are right
        //DataScan map = await json.decode(response.body);
        Map<String, dynamic> data = await json.decode(response.body);
        return data;
        //return DataScan.fromJson(await json.decode(response.body));
      } else {
        return "notfound";
      }
    } catch (e) {
      print(e);
    }
  }
}