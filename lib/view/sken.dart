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
  late String name, description, images;
  late int qty, price;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 40,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Dashboard()),
              );
            },
          ),
          
          actions: [
            IconButton(
              onPressed: null,
              icon: Image.asset(
                "assets/klorofill.png",
              ),
              iconSize: 110,
            )
          ],
        ),
        extendBodyBehindAppBar: true,
      backgroundColor: Color(0xff122333),
      body: Stack(
        children: [
          Expanded(
            flex: 40,
            child: Column(
              children: [
                image(),
                isi(context),

              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget image() {
    return Expanded(
      flex: 15,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(70)),
          color: Color(0xff192a3c),
          image: DecorationImage(
            image: (images != null)
                ? NetworkImage(images)
                : AssetImage('') as ImageProvider,
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
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
      ),
    );
  }

  Widget isi(BuildContext context) {
    return Expanded(
      flex: 25,
      child: Container(
        child: Column(
          children: [
            title(),
            desc(),
          ],
        ),
      ),
    );
  }

  Widget title() {
    return Expanded(
      flex: 5,
      child: Container(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              height: 70,
              width: 250,
              child: Text(
                (name == null) ? "Item Name" : name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: Color(0xff2fac68),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 2,
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget desc() {
    return Expanded(
      flex: 13,
      child: Container(
        padding: EdgeInsets.only(top: 6, left: 20, right: 20, bottom: 20),
        decoration: BoxDecoration(
            color: Color(0xff1e394e),
            borderRadius: BorderRadius.only(topRight: Radius.circular(20))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 110,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                        : description,
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
            Padding(
              padding: EdgeInsets.only(bottom: 15),
            ),
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
            Padding(padding: EdgeInsets.only(top: 34)),
            TextButton(
              onPressed: () async {
                // String codeScanning =
                //     ( BarcodeScanner.scan(
                //     )) as String; //barcode scnner
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
                      MaterialStateProperty.all<Color>(Color(0xff1e394e)),
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
    );
  }
}

