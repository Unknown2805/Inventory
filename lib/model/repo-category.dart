import 'dart:convert';
import '../view/category.dart';
import 'package:http/http.dart' as http;

class Repository {
  // Category
  Future postDataCategory(String name) async {
    try {
      final response = await http.post(
          Uri.parse('http://174.138.23.211:8282/api/apiCategories'),
          body: {
            "name": name,
          });

      if (response.statusCode == 201) {
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
      final response = await http.put(Uri.parse(
          'http://174.138.23.211:8282/api/apiCategories/' +
              id +
              "?name=" +
              name));
      if (response.statusCode == 200) {
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
      final response = await http.delete(
          Uri.parse('http://174.138.23.211:8282/api/apiCategories/' + id));
      if (response.statusCode == 200) {
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
  Future postDataCustomers(
      String nama, String alamat, String email, String telepon) async {
    try {
      final response = await http.post(
          Uri.parse('http://174.138.23.211:8282/api/apiCustomers'),
          body: {
            "nama": nama,
            "alamat": alamat,
            "email": email,
            "telepon": telepon,
          });

      if (response.statusCode == 201) {
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
  Future postDataSales(
      String nama, String alamat, String email, String telepon) async {
    try {
      final response = await http
          .post(Uri.parse('http://174.138.23.211:8282/api/apiSales'), body: {
        "nama": nama,
        "alamat": alamat,
        "email": email,
        "telepon": telepon,
      });

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
  // Tutup Sales

  // ProductOut
  Future postDataProductOut(
      String nama, String alamat, String email, String telepon) async {
    try {
      final response = await http
          .post(Uri.parse('http://174.138.23.211:8282/api/apiSales'), body: {
        "nama": nama,
        "alamat": alamat,
        "email": email,
        "telepon": telepon,
      });

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
  // Tutup ProductOut

  // Companies
  Future postDataCompanies(String nama_perusahaan, String alamat, String lat, String long, String email) async {
    try {
      final response = await http.post(
          Uri.parse('http://174.138.23.211:8282/api/apiCompanies'), body: {
            "nama": nama_perusahaan,
            "alamat": alamat,
            "lat": lat,
            "long": long,
            "email": email,
          });

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
  // Tutup Companies


  // Suppliers
    Future postDataSuppliers(String nama, String alamat, String email, String telepon, String npwp, String no_ktp) async {
    try {
      final response = await http.post(Uri.parse('http://174.138.23.211:8282/api/apiSuppliers'), body: {
        "nama": nama, 
        "alamat" : alamat,
        "email" : email,
        "telepon" : telepon,
        "npwp" : npwp,
        "no_ktp" : no_ktp,
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
  // Tutup Suppliers

  // Users
    Future postDataUsers(String name, String email, String role,) async {
    try {
      final response = await http.post(Uri.parse('http://174.138.23.211:8282/api/apiUsers'), body: {
        "name": name, 
        "email" : email,
        "role" : role,
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
  // Tutup Users
}
