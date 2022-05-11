import 'package:flutter/material.dart';
import 'constant.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProductsIn extends StatefulWidget {
  const ProductsIn({ Key? key }) : super(key: key);

  @override
  State<ProductsIn> createState() => _ProductsInState();
}

class _ProductsInState extends State<ProductsIn> {
  bool search = true ;
  bool heightBox = true;
  
  File? image;

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
     backgroundColor: background,

      body: Stack(
        children:[
          Column(
            
            children: [
              productsinheader(context),
              productsinlist(context),
                  
          ],)
        ]
      )
    );
  }
  Widget productsinheader(BuildContext context){
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.center,
            height: 90,
            child: 
                search ?
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                   
                    IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(FluentIcons.arrow_reply_24_filled,color: Colors.white)),
    
                    Text("Products In",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),


                    
                    IconButton(onPressed: (){
                      setState(() {
                        this.search = !this.search;
                      });
                    }, icon: const Icon(Icons.search_outlined,color: Colors.white)),
                    
                ])
                 :
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     
                     
                      Container(
                          padding: EdgeInsets.only(left: 10),
                          height: 35,
                          width: 260,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              color: white),
                          child: TextField(
                            style: TextStyle(color: Colors.black, fontSize: 15),
                            
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Looking for something?',
                                hintStyle: TextStyle(color: Colors.grey),
                                
                          )),
              
            
          ),
          SizedBox(width: 2),
                      IconButton(
                        onPressed: (){
                          setState(() {
                             this.search = !this.search;
                          });
                        }, icon: const Icon(FluentIcons.dismiss_24_regular,color: white,size: 25)),
                    ],
                  ),
                ),
                ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 46,
                padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: boxColor,
                    border: Border.all(color: primarycolor, width: 1, )
                  ),
                child: TextButton(
                  style: ButtonStyle(
  overlayColor: MaterialStateProperty.all(Colors.transparent),
 ),
                  onPressed: (){
                    setState(() {
                      this.heightBox = !this.heightBox;
                    });
                  },
                  child: !this.heightBox 
                  ? 
                  Text("list",style: TextStyle(color: primarycolor,fontSize: 16))
                  : 
                  Text("detail",style: TextStyle(color: primarycolor,fontSize: 16)),
                  ),
              )
            ],
          )
            )
        ],
      ),
    );
  }

  Widget productsinlist(BuildContext context){
    return Expanded(
      child: Container(
   
        padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
        child: SingleChildScrollView(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                height: heightBox ? 50 : 180,
                child: 
                heightBox
                ? 
                Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(10),
               
                      decoration: BoxDecoration(
                        color: boxColor,
                        borderRadius: BorderRadius.circular(10),
                        
                      ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                         Icon(FluentIcons.arrow_circle_up_24_regular,color: primarycolor,size: 25),
                        SizedBox(width: 10),
                        Text("Sprite",style: TextStyle(color: white,fontSize: 16,fontWeight: FontWeight.bold ))
                      ],
                    ),   
                    Text("belum di proses",style: TextStyle(color: white,fontSize: 16,fontWeight: FontWeight.w100,fontStyle: FontStyle.italic ))          
                  ],
                )
              )
                :
                Container(
                  width: 330,
                  
                  padding: EdgeInsets.all(12),
                  
                  decoration: BoxDecoration(
                    color: boxColor,
                    borderRadius: BorderRadius.circular(10)
                    ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
        
                      Container(
                        padding:EdgeInsets.only(left:5),
                        child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                         Icon(FluentIcons.arrow_circle_up_24_regular,color: primarycolor,size: 25),
                        SizedBox(width: 10),
                        Text("Sprite",style: TextStyle(color: white,fontSize: 16,fontWeight: FontWeight.bold ))
                      ],
                    ),   
                    Text("belum di proses",style: TextStyle(color: white,fontSize: 16,fontWeight: FontWeight.w100,fontStyle: FontStyle.italic )),
                    // SizedBox(width: 20),
                  ],
                )
                      ),
                      SizedBox(height: 10,),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                  width: 35,
                                  child: Icon(FluentIcons.data_histogram_24_filled,color: primarycolor)),
                                  SizedBox(width:5),
                                  Text("Supplier 1",style: TextStyle(color: Colors.white,fontSize: 14)),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [                 
                                  Container(
                                  width: 35,
                                  child: Icon(FluentIcons.calendar_month_24_filled,color: primarycolor)),
                                  SizedBox(width:5),
                                  Text("30-02-2021",style: TextStyle(color: Colors.white,fontSize: 14)),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                  width: 35,
                                  child: Icon(FluentIcons.cube_24_filled,color: primarycolor)),
                                  SizedBox(width:5),
                                  Text("247",style: TextStyle(color: Colors.white,fontSize: 14)),
                                ],
                              ),
                            ),
                            
                            SizedBox(height: 5),
                            
                          ],
                        ),
                      ),
                      SizedBox(
                              width: 280, 
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 65,
                                    height: 30,
                                    margin: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: green,
                                    ),
                                    child: TextButton(
                                      onPressed: (){},
                                      child: Text("edit",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.normal),)
                                    )
                                  ),
                                  Container(
                                    width: 65,
                                    height: 30,
                                    margin: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: red,
                                    ),
                                    child: TextButton(
                                      onPressed: (){},
                                      child: Text("delete",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.normal),)
                                    )
                                  ),
                                ],
                              ),
                            ),
                  ],)
                ),
              ),
              SizedBox(height: 15),     
            ],
          ) 
        )
      )

    
    );
  }
}