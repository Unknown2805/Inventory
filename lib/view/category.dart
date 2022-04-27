import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'constant.dart';

class Categories extends StatefulWidget {
  const Categories({ Key? key }) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  bool search = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
     backgroundColor: background,

      body: Stack(
        children:[
          Column(
            
            children: [
              categoriesheader(context),
              categorieslist(context),
                  
          ],)
        ]
      )
    );
  }
  Widget categoriesheader(BuildContext context){
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(15),
        alignment: Alignment.center,
        height: 90,
        child: 
            search ?
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
               
                IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(FluentIcons.arrow_reply_24_filled,color: Colors.white)),
    
                Text("Categories",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),


                
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
            )
    );
  }

  Widget categorieslist(BuildContext context){
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(25),
        child:SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(10),
                      height: 50,
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
                        Icon(Icons.category,color:Color(0xffa9def9),size: 25),
                        SizedBox(width: 10),
                        Text("Elektronik",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold ))
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.red,
                      ),
                      child: TextButton(
                        onPressed: (){},
                        child: Text("delete",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.normal),)
                      )
                    ),
                  
                  ],
                )
              ),
              SizedBox(height: 6),
              
            ]
          )
        )
      )
    ,);
  }
}