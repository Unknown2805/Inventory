import 'package:flutter/material.dart';
import 'package:inventory_app/view/constant.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'dashboard.dart';
class Users extends StatefulWidget {
  const Users({ Key? key }) : super(key: key);

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
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
              usersheader(context),
              userslist(context),
                  
          ],)
        ]
      )
    );
  }

  Widget usersheader(BuildContext context){
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
    
                Text("Data",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),


                
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


  Widget userslist(BuildContext context){
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).popAndPushNamed('/customers'),
                child: Container(
                  child: Row(
                          
                    children: [
                        Container(
                        alignment: Alignment.center,
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: primarycolor,width: 2)
                        ),
                        child: Icon(FluentIcons.person_20_regular,color: Colors.white,size: 35)),
                        SizedBox(width: 10),
                        Container(
                          width: 150,
                          height: 50,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                Text("Master",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold)),
                                Text("Master24434@gmail.com",style: TextStyle(color: Colors.white,fontSize: 12))
                              ]
                            ),
                          )
                        ),
                        Container(
                          width: 105,
                          height: 50,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Master",style: TextStyle(color: primarycolor,fontSize: 18,fontWeight: FontWeight.bold)),
                            
                            ],
                          ),
                        ),
                      ]
                  
                  )
                ),
              ),
            SizedBox(height: 10),

            GestureDetector(
                onTap: () => Navigator.of(context).popAndPushNamed('/customers'),
                child: Container(
                  child: Row(
                          
                    children: [
                        Container(
                        alignment: Alignment.center,
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: primarycolor,width: 2)
                        ),
                        child: Icon(FluentIcons.person_20_regular,color: Colors.white,size: 35)),
                        SizedBox(width: 10),
                        Container(
                          width: 150,
                          height: 50,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                Text("Master",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold)),
                                Text("Master24434@gmail.com",style: TextStyle(color: Colors.white,fontSize: 12))
                              ]
                            ),
                          )
                        ),
                        Container(
                          width: 105,
                          height: 50,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Master",style: TextStyle(color: primarycolor,fontSize: 18,fontWeight: FontWeight.bold)),
                            
                            ],
                          ),
                        ),
                      ]
                  
                  )
                ),
              ),
            SizedBox(height: 10),

            GestureDetector(
                onTap: () => Navigator.of(context).popAndPushNamed('/customers'),
                child: Container(
                  child: Row(
                          
                    children: [
                        Container(
                        alignment: Alignment.center,
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: primarycolor,width: 2)
                        ),
                        child: Icon(FluentIcons.person_20_regular,color: Colors.white,size: 35)),
                        SizedBox(width: 10),
                        Container(
                          width: 150,
                          height: 50,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                Text("Master",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold)),
                                Text("Master24434@gmail.com",style: TextStyle(color: Colors.white,fontSize: 12))
                              ]
                            ),
                          )
                        ),
                        Container(
                          width: 105,
                          height: 50,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Master",style: TextStyle(color: primarycolor,fontSize: 18,fontWeight: FontWeight.bold)),
                            
                            ],
                          ),
                        ),
                      ]
                  
                  )
                ),
              ),
            SizedBox(height: 10),

            GestureDetector(
                onTap: () => Navigator.of(context).popAndPushNamed('/customers'),
                child: Container(
                  child: Row(
                          
                    children: [
                        Container(
                        alignment: Alignment.center,
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: primarycolor,width: 2)
                        ),
                        child: Icon(FluentIcons.person_20_regular,color: Colors.white,size: 35)),
                        SizedBox(width: 10),
                        Container(
                          width: 150,
                          height: 50,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                Text("Master",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold)),
                                Text("Master24434@gmail.com",style: TextStyle(color: Colors.white,fontSize: 12))
                              ]
                            ),
                          )
                        ),
                        Container(
                          width: 105,
                          height: 50,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Master",style: TextStyle(color: primarycolor,fontSize: 18,fontWeight: FontWeight.bold)),
                            
                            ],
                          ),
                        ),
                      ]
                  
                  )
                ),
              ),
            SizedBox(height: 10),

            GestureDetector(
                onTap: () => Navigator.of(context).popAndPushNamed('/customers'),
                child: Container(
                  child: Row(
                          
                    children: [
                        Container(
                        alignment: Alignment.center,
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: primarycolor,width: 2)
                        ),
                        child: Icon(FluentIcons.person_20_regular,color: Colors.white,size: 35)),
                        SizedBox(width: 10),
                        Container(
                          width: 150,
                          height: 50,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                Text("Master",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold)),
                                Text("Master24434@gmail.com",style: TextStyle(color: Colors.white,fontSize: 12))
                              ]
                            ),
                          )
                        ),
                        Container(
                          width: 105,
                          height: 50,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Master",style: TextStyle(color: primarycolor,fontSize: 18,fontWeight: FontWeight.bold)),
                            
                            ],
                          ),
                        ),
                      ]
                  
                  )
                ),
              ),
            SizedBox(height: 10),

            GestureDetector(
                onTap: () => Navigator.of(context).popAndPushNamed('/customers'),
                child: Container(
                  child: Row(
                          
                    children: [
                        Container(
                        alignment: Alignment.center,
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: primarycolor,width: 2)
                        ),
                        child: Icon(FluentIcons.person_20_regular,color: Colors.white,size: 35)),
                        SizedBox(width: 10),
                        Container(
                          width: 150,
                          height: 50,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                Text("Master",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold)),
                                Text("Master24434@gmail.com",style: TextStyle(color: Colors.white,fontSize: 12))
                              ]
                            ),
                          )
                        ),
                        Container(
                          width: 105,
                          height: 50,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Master",style: TextStyle(color: primarycolor,fontSize: 18,fontWeight: FontWeight.bold)),
                            
                            ],
                          ),
                        ),
                      ]
                  
                  )
                ),
              ),
            SizedBox(height: 10),

            GestureDetector(
                onTap: () => Navigator.of(context).popAndPushNamed('/customers'),
                child: Container(
                  child: Row(
                          
                    children: [
                        Container(
                        alignment: Alignment.center,
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: primarycolor,width: 2)
                        ),
                        child: Icon(FluentIcons.person_20_regular,color: Colors.white,size: 35)),
                        SizedBox(width: 10),
                        Container(
                          width: 150,
                          height: 50,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                Text("Master",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold)),
                                Text("Master24434@gmail.com",style: TextStyle(color: Colors.white,fontSize: 12))
                              ]
                            ),
                          )
                        ),
                        Container(
                          width: 105,
                          height: 50,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Master",style: TextStyle(color: primarycolor,fontSize: 18,fontWeight: FontWeight.bold)),
                            
                            ],
                          ),
                        ),
                      ]
                  
                  )
                ),
              ),
            SizedBox(height: 10),

            GestureDetector(
                onTap: () => Navigator.of(context).popAndPushNamed('/customers'),
                child: Container(
                  child: Row(
                          
                    children: [
                        Container(
                        alignment: Alignment.center,
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: primarycolor,width: 2)
                        ),
                        child: Icon(FluentIcons.person_20_regular,color: Colors.white,size: 35)),
                        SizedBox(width: 10),
                        Container(
                          width: 150,
                          height: 50,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                Text("Master",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold)),
                                Text("Master24434@gmail.com",style: TextStyle(color: Colors.white,fontSize: 12))
                              ]
                            ),
                          )
                        ),
                        Container(
                          width: 105,
                          height: 50,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Master",style: TextStyle(color: primarycolor,fontSize: 18,fontWeight: FontWeight.bold)),
                            
                            ],
                          ),
                        ),
                      ]
                  
                  )
                ),
              ),
            SizedBox(height: 10),

            GestureDetector(
                onTap: () => Navigator.of(context).popAndPushNamed('/customers'),
                child: Container(
                  child: Row(
                          
                    children: [
                        Container(
                        alignment: Alignment.center,
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: primarycolor,width: 2)
                        ),
                        child: Icon(FluentIcons.person_20_regular,color: Colors.white,size: 35)),
                        SizedBox(width: 10),
                        Container(
                          width: 150,
                          height: 50,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                Text("Master",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold)),
                                Text("Master24434@gmail.com",style: TextStyle(color: Colors.white,fontSize: 12))
                              ]
                            ),
                          )
                        ),
                        Container(
                          width: 105,
                          height: 50,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Master",style: TextStyle(color: primarycolor,fontSize: 18,fontWeight: FontWeight.bold)),
                            
                            ],
                          ),
                        ),
                      ]
                  
                  )
                ),
              ),
            SizedBox(height: 10),
            
            
            ]
          ),
        ),
      ),
    );
  }
}