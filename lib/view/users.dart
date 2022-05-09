import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:inventory_app/view/constant.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Users extends StatefulWidget {
  const Users({ Key? key }) : super(key: key);

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  bool search = true;

  List _users = [];
  @override
  void initState() {
    getData();
    super.initState();
  }
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
    return _users.length == 0 ? RefreshProgressIndicator(color: primarycolor ,backgroundColor: background,) : Expanded(
      child: ListView.builder(itemBuilder: (context, i){
        var _user = _users[i];
        return Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Slidable(
                        
                        endActionPane: ActionPane(
                          motion: StretchMotion(),
                          
                          children: [
                            SlidableAction(
                              
                              backgroundColor: Colors.transparent,
                              
                              icon: FluentIcons.delete_24_filled,
                              foregroundColor: red,
                              onPressed: (i)  {
                                // AwesomeDialog(
                                //   context: context,
                                //   dialogType: DialogType.INFO_REVERSED,
                                //   animType: AnimType.BOTTOMSLIDE,
                                //   title: 'Delete',
                                //   desc: 'data can not be returned',
                                //   btnCancelOnPress: () {},
                                //   btnCancelColor: Colors.blue.shade600,
                                //   btnOkColor: Colors.red.shade600,
                                //   btnOkOnPress: ()  {
                                //     // print(_user["id"]);
                                //     // bool response =
                                //     //     await repository.deleteDataCategory(
                                //     //         _user["id"].toString());
                                //     // getData();
                                //   },
                                // )..show();
                              },
                            ),
                            SlidableAction(
                              backgroundColor: Colors.transparent,
                              // label: 'Edit',
                              icon: FluentIcons.edit_24_filled,
                              foregroundColor: green,
                              onPressed: (i) {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => EditCategory(
                                //               id: _user["id"],
                                //             )));
                              },
                            ),
                          ],
                        ),
                        child:Container(
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
                              Text("${_user["name"]}",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold)),
                              Text("${_user["email"]}",style: TextStyle(color: Colors.white,fontSize: 12))
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
                            Text("${_user["role"]}",style: TextStyle(color: primarycolor,fontSize: 18,fontWeight: FontWeight.bold)),
                          
                          ],
                        ),
                      ),
                    ]
                
                )
              ),),
  
            ]
          ),
        ),
      );
      },
      itemCount: _users.length,
      )
    );
  }
  getData()async{
      var _dio = Dio();
      var response = await _dio.get("http://174.138.23.211:8282/api/apiUsers");
      var user = response.data;
  setState(() {
    _users = user;
    
  });
  }
}