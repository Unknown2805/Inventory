import 'dart:convert';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:inventory_app/view/constant.dart';
import 'package:inventory_app/helper/apihelper.dart';

import './dashboard.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  String qrCodeResult = "Barcode Scanner";
  String? name, description, images;
  int? qty, price;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: Colors.transparent,
        elevation: 0,
        
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: background,
      body: Stack(
        children: [
          Column(
            children: [
              image(),
              desc(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget image() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(70)),
        color: Color(0xff192a3c),
        image: DecorationImage(
          image: (images != null)
              ? NetworkImage(images!)
              : AssetImage('assets/example1.jpg') as ImageProvider,
          fit: BoxFit.fill,
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.38,
      child: Center(
        child: (images != null)
            ? Text("")
            : Text(
                "Image Your Product",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }


  Widget desc(BuildContext context) {
    return Expanded(  
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,    
            children:[
              Container(
                
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                        Text(
                    (name == null) ? "Item Name" : name!,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                    Text("Description",
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                    Padding(padding: EdgeInsets.only(bottom: 14)),
                    Text(
                      (description == null)
                          ? "Detail item akan tertera pada bagian ini disarankan sedetail mungkin pada item yang di input tentunya"
                          : description!,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              SizedBox(height:10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    (price == null) ? "Rp.0" : "Rp.${price.toString()}",
                    style: TextStyle(
                        color: Color(0xff2fac68),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(padding: EdgeInsets.only(right: 140)),
                  Text(
                    "Quantity",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(right: 20)),
                  Text(
                    (qty == null) ? "0" : qty.toString(),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height:10),
              TextButton(
                onPressed: () async {
                  // String codeScanning =
                  //     ( BarcodeScanner.scan(
                  //     )) as String; //barcode scnnerflutte
                  // setState(() {
                  //   qrCodeResult = codeScanning;
                  // });
                  try {
                    String codeSanner =
                        (await BarcodeScanner.scan()) as String; //barcode scnner
                    var request = await ApiHelper.getData(codeSanner);
        
                    if (request == null) {
                      setState(() {
                        qrCodeResult = "Data Not Found\n" + codeSanner;
                      });
                    } else {
                      setState(() {
                        qrCodeResult = request.toString() + "\n" + codeSanner;
                        name = request["nama"];
                        qty = request["qty"];
                        price = request["harga"];
                        description = request["description"];
                        images = request["image"];
                      });
                      print(request["nama"]);
                    }
        
                    // String codeSanner =
                    //     await BarcodeScanner.scan(); //barcode scnner
                    // var request = await ApiHelper.getData(codeSanner);
                    // setState(() {
                    //   qrCodeResult = request.toString();
                    // });
                  } catch (e) {
                    setState(() {
                      qrCodeResult = "Data Not Found";
                    });
                  }
                },
                style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(background),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(color: Color(0xff2fac68))))),
                child: Text(
                  "Open Scanner",
                  style: TextStyle(
                      color: Color(0xff2fac68),
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
