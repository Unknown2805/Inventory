import 'dart:convert';
import '../view/category.dart';
import 'package:http/http.dart' as http;

class Repository {

  // Category
  Future postDataCategory(String name) async {
    try {
      final response = await http.post(Uri.parse('http://174.138.23.211:8282/api/apiCategories'), body: {
        "name": name, 
      });

      if(response.statusCode == 201) {
        return true;
      } else { 
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

   Future putDataCategory(String name, String id) async {
    try {
      final response = await http.put(Uri.parse('http://174.138.23.211:8282/api/apiCategories/'+id+"?name="+name));
      if(response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future deleteDataCategory(String id) async {
    var data;
    try {
      final response = await  http.delete(Uri.parse('http://174.138.23.211:8282/api/apiCategories/'+id));
      if(response.statusCode == 200 ) {
        data = await jsonDecode(response.body);
        return true;
      } else 
        return false;
    } catch (e) {
      print(e.toString());
    }
  }
  // Tutup Category

  // Customers
    Future postDataCustomers(String nama, String alamat, String email, String telepon) async {
    try {
      final response = await http.post(Uri.parse('http://174.138.23.211:8282/api/apiCustomers'), body: {
        "nama": nama, 
        "alamat" : alamat,
        "email" : email,
        "telepon" : telepon,
      });

      if(response.statusCode == 201) {
        return true;
      } else { 
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // Tutup Customers


  // Sales

    Future postDataSales(String nama, String alamat, String email, String telepon) async {
    try {
      final response = await http.post(Uri.parse('http://174.138.23.211:8282/api/apiSales'), body: {
        "nama": nama, 
        "alamat" : alamat,
        "email" : email,
        "telepon" : telepon,
      });

      if(response.statusCode == 201) {
        return true;
      } else { 
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // Tutup Sales
  
}