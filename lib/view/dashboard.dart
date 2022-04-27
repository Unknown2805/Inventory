import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:inventory_app/view/company.dart';
import 'package:inventory_app/view/products.dart';
import 'package:inventory_app/view/productsin.dart';
import 'constant.dart';
//page file
import './supliers.dart';
import 'users.dart';
import './customers.dart';
import './category.dart';
import './sales.dart';
import './productsout.dart';

 class Dashboard extends StatefulWidget {
   const Dashboard({ Key? key }) : super(key: key);
 
   @override
   State<Dashboard> createState() => _DashboardState();
 }
 
 class _DashboardState extends State<Dashboard> {
   @override
   Widget build(BuildContext context) {
     
     return Scaffold(
       backgroundColor: background,

floatingActionButton: FloatingActionButton(
          
          elevation: 50,
          autofocus: true,
          onPressed: () {
            
          },
          child: Icon(Icons.qr_code_rounded,size: 40),
          backgroundColor: primarycolor,
          
        ),
         floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
         
      

      body: Stack(
        children:[
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  dashboardheader(context),
                  menu(context),
                      
              ],),
            ),
          )
        ]
      )
     );
     
   }

  Widget dashboardheader(BuildContext context){
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 200,
            child: Text("Welcome",style: TextStyle(fontSize: 28,fontWeight: FontWeight.w100,color: white))),
          SizedBox(height: 5),
          Container(
            width: 200,
            child: TextButton(
              style: ButtonStyle(
  overlayColor: MaterialStateProperty.all(Colors.transparent),
 ),
              onPressed: (){},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Color((0xffa9def9)))
                    ),
                    child: Icon(FluentIcons.person_20_filled,color: Color(0xffa9def9),size: 30,)
                  ),
                  SizedBox(width: 8),
                  Text("Master",style: TextStyle(fontSize: 28,color: white)),
                ],
              ),
            ),
          )
        ],
      )
    );
  }

  Widget menu(BuildContext context){
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        
        children: [
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: boxColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(
                      blurRadius: 2,
                    )]
                  ),

                child: TextButton(
                  style: ButtonStyle(
  overlayColor: MaterialStateProperty.all(Colors.transparent),
 ),
                  onPressed: (){
                    Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProductsIn()),
                        );
                  },              
                  child:Container(
                    alignment: Alignment.center,
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FluentIcons.arrow_circle_down_24_regular,color:  Color(0xffa9def9),size: 30),
                        SizedBox(height: 5,),
                        Text("120",style: TextStyle(color: Color(0xffa9def9),fontSize: 36,fontWeight: FontWeight.bold),),
                        SizedBox(height: 5),
                        Text("PRODUCT IN",style: TextStyle(color: Color(0xffa9def9),fontSize: 14),)
                      ],
                ),
                  )),
              ),
            SizedBox(width: 20),
                Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: boxColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [BoxShadow(
                            blurRadius: 2,
                          )]
                        ),

                      child: TextButton(
                        style: ButtonStyle(
  overlayColor: MaterialStateProperty.all(Colors.transparent),
 ),
                        onPressed: (){
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProductsOut()),
                        );
                        },              
                        child:Container(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(FluentIcons.arrow_circle_up_24_regular,color:  Color(0xffa9def9),size: 30),
                              SizedBox(height: 5,),
                              Text("120",style: TextStyle(color: Color(0xffa9def9),fontSize: 36,fontWeight: FontWeight.bold),),
                              SizedBox(height: 5),
                              Text("PRODUCT OUT",style: TextStyle(color: Color(0xffa9def9),fontSize: 14,),)
                            ],
                      ),
                        )),
                    ),                   
         ],),
            SizedBox(height: 14),
                  Container(
                  padding: EdgeInsets.all(10),
                      height: 70,
                      decoration: BoxDecoration(
                        color: boxColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [BoxShadow(
                          blurRadius: 2,
                        )]
                      ),

                    child: TextButton(
                      style: ButtonStyle(
  overlayColor: MaterialStateProperty.all(Colors.transparent),
 ),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Customers()),
                        );
                      },
                      child:Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          
                            Text("CUSTOMERS",style: TextStyle(color: white,fontSize: 18,fontWeight: FontWeight.bold),),
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(FluentIcons.people_24_filled,color:Color(0xffa9def9),size: 35),
                                SizedBox(width: 20,),
                                Container(
                                  width:60,
                                  child: Text("120",style: TextStyle(color: Color(0xffa9def9),fontSize: 28,fontWeight: FontWeight.bold),)),
                              ],
                            ),
                          
                          ],
                    ),
                      )),
                  ),
            SizedBox(height: 14),
                  Container(
                  padding: EdgeInsets.all(10),
                      height: 70,
                      decoration: BoxDecoration(
                        color: boxColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [BoxShadow(
                          blurRadius: 2,
                        )]
                      ),

                    child: TextButton(
                      style: ButtonStyle(
  overlayColor: MaterialStateProperty.all(Colors.transparent),
 ),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Sales()),
                        );
                      },       
                      child:Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          
                            Text("SALES",style: TextStyle(color: white,fontSize: 18,fontWeight: FontWeight.bold),),
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(FluentIcons.shopping_bag_24_filled,color: primarycolor,size: 35),
                                SizedBox(width: 20,),
                                Container(
                                  width:60,
                                  child: Text("120",style: TextStyle(color: Color(0xffa9def9),fontSize: 28,fontWeight: FontWeight.bold),)),
                              ],
                            ),
                          
                          ],
                    ),
                      )),
                  ),
            SizedBox(height: 14),
                  Container(
                  padding: EdgeInsets.all(10),
                      height: 70,
                      decoration: BoxDecoration(
                        color: boxColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [BoxShadow(
                          blurRadius: 2,
                        )]
                      ),

                    child: TextButton(
                      style: ButtonStyle(
  overlayColor: MaterialStateProperty.all(Colors.transparent),
 ),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Company()),
                        );
                      },       
                      child:Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          
                            Text("COMPANY",style: TextStyle(color: white,fontSize: 18,fontWeight: FontWeight.bold),),
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(FluentIcons.building_24_filled,color:Color(0xffa9def9),size: 35),
                                SizedBox(width: 20,),

                                Container(
                                  width: 60,
                                  child: Text("120",style: TextStyle(color: Color(0xffa9def9),fontSize: 28,fontWeight: FontWeight.bold),)),
                              ],
                            ),
                          
                          ],
                    ),
                      )),
                  ),   
            SizedBox(height: 14),
                  Container(
                  padding: EdgeInsets.all(10),
                      height: 70,
                      decoration: BoxDecoration(
                        color: boxColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [BoxShadow(
                          blurRadius: 2,
                        )]
                      ),

                    child: TextButton(
                      style: ButtonStyle(
  overlayColor: MaterialStateProperty.all(Colors.transparent),
 ),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Categories()),
                        );
                      },      
                      child:Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          
                            Text("CATEGORIES",style: TextStyle(color: white,fontSize: 18,fontWeight: FontWeight.bold),),
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(FluentIcons.list_24_regular,color:Color(0xffa9def9),size: 35),
                                SizedBox(width: 20,),
                                Container(
                                  width:60,
                                  child: Text("120",style: TextStyle(color: Color(0xffa9def9),fontSize: 28,fontWeight: FontWeight.bold),)),
                              ],
                            ),
                          
                          ],
                    ),
                      )),
                  ),
            SizedBox(height: 14),
                  Container(
                  padding: EdgeInsets.all(10),
                      height: 70,
                      decoration: BoxDecoration(
                        color: boxColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [BoxShadow(
                          blurRadius: 2,
                        )]
                      ),

                    child: TextButton(
                      style: ButtonStyle(
  overlayColor: MaterialStateProperty.all(Colors.transparent),
 ),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Suppliers()),
                        );
                      },   
                      child:Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          
                            Text("SUPLIERS",style: TextStyle(color: white,fontSize: 18,fontWeight: FontWeight.bold),),
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(FluentIcons.data_histogram_24_filled,color:Color(0xffa9def9),size: 38),
                                SizedBox(width: 20,),
                                Container(
                                  width:60,
                                  child: Text("120",style: TextStyle(color: Color(0xffa9def9),fontSize: 28,fontWeight: FontWeight.bold),)),
                              ],
                            ),
                          
                          ],
                    ),
                      )),
                  ),
            SizedBox(height: 14),       
                  Container(
                  padding: EdgeInsets.all(10),
                      height: 70,
                      decoration: BoxDecoration(
                        color: boxColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [BoxShadow(
                          blurRadius: 2,
                        )]
                      ),

                    child: TextButton(
                      style: ButtonStyle(
  overlayColor: MaterialStateProperty.all(Colors.transparent),
 ),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Products()),
                        );
                      },     
                      child:Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          
                            Text("PRODUCT",style: TextStyle(color: white,fontSize: 18,fontWeight: FontWeight.bold),),
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(FluentIcons.cube_24_filled,color:Color(0xffa9def9),size: 35),
                                SizedBox(width: 20,),
                                Container(
                                  width:60,
                                  child: Text("120",style: TextStyle(color: Color(0xffa9def9),fontSize: 28,fontWeight: FontWeight.bold),)),
                              ],
                            ),
                          
                          ],
                    ),
                      )),
                  ),
            SizedBox(height: 14),
                  Container(
                  padding: EdgeInsets.all(10),
                      height: 70,
                      decoration: BoxDecoration(
                        color: boxColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [BoxShadow(
                          blurRadius: 2,
                        )]
                      ),

                    child: TextButton(
                      style: ButtonStyle(
  overlayColor: MaterialStateProperty.all(Colors.transparent),
 ),
                      onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Users()),
                        );
                    },              
              

                      child:Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          
                            Text("USERS",style: TextStyle(color: white,fontSize: 18,fontWeight: FontWeight.bold),),
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(FluentIcons.person_24_filled,color:Color(0xffa9def9),size: 35),
                                SizedBox(width: 20,),
                                Container(
                                  width:60,
                                  child: Text("120",style: TextStyle(color: Color(0xffa9def9),fontSize: 28,fontWeight: FontWeight.bold),)),
                              ],
                            ),
                          
                          ],
                    ),
                      )),
                  ),
          
        ],
      )
    );
  }
 }