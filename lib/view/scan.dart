// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:inventory_app/view/constant.dart';
// import 'package:inventory_app/helper/apihelper.dart';
// import 'package:fluentui_system_icons/fluentui_system_icons.dart';

// import './dashboard.dart';

// class ScanPage extends StatefulWidget {
//   @override
//   _ScanPageState createState() => _ScanPageState();
// }

// class _ScanPageState extends State<ScanPage> {
//   String qrCodeResult = "Barcode Scanner";
//   String? name, description, images;
//   int? qty, price;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//           toolbarHeight: 40,
//           title: Text("Detail"),
//           centerTitle: true,
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           leading: IconButton(
//               icon:
//                   Icon(FluentIcons.arrow_reply_24_filled, color: Colors.white),
//               onPressed: () {
//                 Navigator.pop(context);
//               })),
//       extendBodyBehindAppBar: true,
//       backgroundColor: background,
//       body: Stack(
//         children: [
//           SingleChildScrollView(
//             child: Column(
//               children: [
//                 image(),
//                 desc(context),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget image() {
//     return SafeArea(
//       child: Container(
//         margin: EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(30),
//           color: Color(0xff192a3c),
//           image: DecorationImage(
//             image: (images != null)
//                 ? NetworkImage(images!)
//                 : AssetImage('assets/example1.jpg') as ImageProvider,
//             fit: BoxFit.fill,
//           ),
//         ),
//         height: MediaQuery.of(context).size.height * 0.35,
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(30),
//             color: boxColor.withOpacity(0.5),
//           ),
//           child: Center(
//             child: (images != null)
//                 ? Text("")
//                 : Text(
//                     "Image Your Product",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 26,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget desc(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           //description
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     (name == null) ? "Item Name" : name!,
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 22,
//                         fontWeight: FontWeight.w500),
//                   ),
//                   Container(
//                     alignment: Alignment.centerRight,
//                     width: 140,
//                     child: Text(
//                       (qty == null) ? "0" : qty.toString(),
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w500,
//                         color: primarycolor,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 15),
//               Container(color: primarycolor, height: 2),
//               SizedBox(height: 25),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("Description",
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.white,
//                         fontWeight: FontWeight.w500,
//                       )),
//                   Container(
//                     alignment: Alignment.centerRight,
//                     width: 140,
//                     child: Text(
//                       (price == null) ? "Rp.0" : "Rp.${price.toString()}",
//                       style: TextStyle(
//                           color: primarycolor,
//                           fontSize: 18,
//                           fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 10),
//               Container(
//                 padding: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(color: primarycolor),
//                 ),
//                 height: 170,
//                 width: 320,
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         (description == null)
//                             ? "Detail item akan tertera pada bagian ini disarankan sedetail mungkin pada item yang di input tentunya"
//                             : description!,
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.white,
//                           fontWeight: FontWeight.w300,
//                         ),
//                         textAlign: TextAlign.left,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 25),
//           //scan button
//           Container(
//             height: 50,
//             width: 180,
//             child: TextButton(
//               onPressed: () async {
//                 // String codeScanning =
//                 //     ( BarcodeScanner.scan(
//                 //     )) as String; //barcode scnnerflutte
//                 // setState(() {
//                 //   qrCodeResult = codeScanning;
//                 // });
//                 try {
//                   String codeSanner =
//                       (await BarcodeScanner.scan()); //barcode scnner
//                   var request = await ApiHelper.getData(codeSanner);

//                   if (request == null) {
//                     setState(() {
//                       qrCodeResult = "Data Not Found\n" + codeSanner;
//                     });
//                   } else {
//                     setState(() {
//                       qrCodeResult = request.toString() + "\n" + codeSanner;
//                       name = request["nama"];
//                       qty = request["qty"];
//                       price = request["harga"];
//                       description = request["description"];
//                       images = request["image"];
//                     });
//                     print(request["nama"]);
//                   }

//                   // String codeSanner =
//                   //     await BarcodeScanner.scan(); //barcode scnner
//                   // var request = await ApiHelper.getData(codeSanner);
//                   // setState(() {
//                   //   qrCodeResult = request.toString();
//                   // });
//                 } catch (e) {
//                   setState(() {
//                     qrCodeResult = "Data Not Found";
//                   });
//                 }
//               },
//               style: ButtonStyle(
//                   padding:
//                       MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
//                   backgroundColor:
//                       MaterialStateProperty.all<Color>(primarycolor),
//                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                       RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15.0),
//                   ))),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     FluentIcons.barcode_scanner_24_filled,
//                     color: background,
//                     size: 30,
//                   ),
//                   SizedBox(
//                     width: 5,
//                   ),
//                   Text(
//                     "Open Scanner",
//                     style: TextStyle(
//                         color: background,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: 25),
//         ],
//       ),
//     );
//   }
// }
