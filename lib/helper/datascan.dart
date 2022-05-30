import 'package:flutter/material.dart';

// class DataScan {
//   int status;
//   dynamic data;

//   DataScan(this.status, this.data);
// }

class DataScan {
  int status;
  String description, nama, images;
  int qty;
  int harga;
  DataScan(
      {@required this.status,
      @required this.description,
      @required this.qty,
      @required this.nama,
      @required this.images,
      @required this.harga});

  @override
  String toString() {
    return 'Name Item: $nama\n Qty: $qty\n Description: $description\n';
  }

  factory DataScan.fromJson(Map<String, dynamic> json) {
    return DataScan(
        status: json["status"],
        description: json["description"],
        qty: json['qty'],
        nama: json['nama'],
        images: json['image'],
        harga: json['harga']);
  }
}
