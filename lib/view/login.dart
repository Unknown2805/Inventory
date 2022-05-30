import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inventory_app/provider/parent.dart';
import 'package:inventory_app/view/dashboard.dart';
import 'package:inventory_app/view/userDashboard.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // the key for the form
  TextEditingController user =
      new TextEditingController(); // the controller for the usename that user will put in the text field
  TextEditingController pass =
      new TextEditingController(); // the controller for the password that user will put in the text field

  String usern = "";
  String passwd = "";
  bool sharedpref = false;
  bool state = false;

  @override
  void initState() {
    checkSFstring();
    super.initState();
  }

  // login function
  saveSFstring(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
    prefs.setString('password', password);

    print(
        "Data email dan password sudah di simpan yaitu => ${prefs.getString('email')}");
  }

  checkSFstring() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool email = prefs.containsKey('email');
    bool password = prefs.containsKey('password');

    if (email == true && password == true) {
      showLoadingProgress(context);

      setState(() {
        usern = prefs.getString('email');
        passwd = prefs.getString('password');
        sharedpref = true;
      });
      if (state == true) {
        showLoadingProgress(context);
      }
      Provider.of<Parent>(context, listen: false)
          .loginParentAndGetInf(usern.toString(), passwd.toString())
          .then((state) {
        // pass username and password that user entered
        if (state == "user") {
          // if the function returned true
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const UserDashboard()),
            ModalRoute.withName('/home'),
          );
          //Navigator.of(context).pushNamed(BottomNavScreen.routeName); // go to the Main page for parent
        } else if (state == "master") {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const Dashboard()),
            ModalRoute.withName('/home'),
          );
        } else {
          Navigator.pop(context);
          setState(() {
            sharedpref = false;
          });
        }
      });
      print(
          "Data email dan password sudah ada di sharedpreference yaitu => ${usern.toString()}");
    } else {
      print("No Data sharedpreference bro");
    }
  }

  showLoadingProgress(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => Center(
                // Aligns the container to center
                child: Container(
              // A simplified version of dialog.
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              width: 100.0,
              height: 70.0,
              // child: SpinKitWave(
              //   color: Colors.black.withOpacity(0.5),
              //   size: 25.0,
              // ),
            )));
  }

  _login() async {
    saveSFstring(user.text, pass.text);
    setState(() {
      state = true;
    });
    if (_formKey.currentState.validate()) {
      // check if all the conditionsthe we put on validators are right
      if (state) {
        showLoadingProgress(context); // show CircularProgressIndicator
      }
      // if the radio button on parent then login using parent provider

      if (sharedpref == false) {
        Provider.of<Parent>(context, listen: false)
            .loginParentAndGetInf(user.text, pass.text)
            .then((state) {
          // pass username and password that user entered

          if (state == "user") {
            setState(() {
              state = false;
            });
            // if the function returned true
            // Navigator.of(context)
            //     .pushReplacementNamed(DashboardMenu.routeName);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => UserDashboard()),
              ModalRoute.withName('/home'),
            );
            //Navigator.of(context).pushNamed(BottomNavScreen.routeName); // go to the Main page for parent
          } else if (state == "master") {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (BuildContext context) => Dashboard()),
              ModalRoute.withName('/home'),
            );
          } else {
            setState(() {
              state = false;
            });
          }
        });
      }
    }
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            height: height,
            width: width,
            child: Stack(
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                      ),

                      SizedBox(
                        height: 50,
                      ),

                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          children: [
                            Form(
                              key: _formKey,
                              child: Column(
                                children: <Widget>[
                                  Column(
                                    children: [
                                      TextFormField(
                                        controller: user,
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                        decoration: InputDecoration(
                                            // contentPadding:
                                            //     EdgeInsets.only(top: 0),
                                            // floatingLabelBehavior:
                                            //     FloatingLabelBehavior.auto,
                                            hintText: "Email",
                                            hintStyle: TextStyle(
                                                fontFamily: "Montserrat",
                                                fontSize: 15,
                                                color: Colors.black),
                                            // label: Text(
                                            //   "Email",
                                            //   style: TextStyle(
                                            //     color:
                                            //         Color.fromRGBO(14, 69, 84, 1),
                                            //     fontFamily: "Montserrat",
                                            //   ),
                                            // ),
                                            prefixIcon: Container(
                                              width: 0,
                                              alignment: Alignment(-0.10, 0.0),
                                              child: Icon(
                                                FluentIcons.mail_24_regular,
                                                size: 25,
                                                color: Colors.black,
                                              ),
                                            ),
                                            border: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                              color: Colors.black,
                                              width: 1,
                                            )),
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                              color: Colors.black,
                                              width: 1,
                                            )),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                              color: Colors.black,
                                              width: 1,
                                            ))),
                                        keyboardType: TextInputType.text,
                                        validator: (value) {
                                          if (value.length < 10) {
                                            return 'Please enter a valid email address.';
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Column(
                                    children: [
                                      TextFormField(
                                        style: TextStyle(
                                          color: Colors.black,
                                          // fontFamily: "Montserrat",
                                        ),
                                        controller: pass,
                                        obscureText: _isObscure,
                                        decoration: InputDecoration(
                                            hintText: "Password",
                                            hintStyle: TextStyle(
                                                fontFamily: "Montserrat",
                                                fontSize: 15,
                                                color: Colors.black),
                                            prefixIcon: Container(
                                              width: 0,
                                              alignment: Alignment(-0.10, 0.0),
                                              child: Icon(
                                                FluentIcons
                                                    .lock_closed_24_regular,
                                                size: 25,
                                                color: Colors.black,
                                              ),
                                            ),
                                            border: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                              color: Colors.black,
                                              width: 1,
                                            )),
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                              color: Colors.black,
                                              width: 1,
                                            )),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                              color: Colors.black,
                                              width: 1,
                                            ))),
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        validator: (value) {
                                          if (value.length < 1) {
                                            return 'Please enter a password.';
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Center(
                              child: Container(
                                  height: 45.0,
                                  width: width,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      _login();
                                    },
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            5), // <-- Radius
                                      ),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   height: 32,
                      // ),
                      Container(
                        height: 250,
                      )
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
