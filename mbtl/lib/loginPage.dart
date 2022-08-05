import 'package:flutter/material.dart';
import 'package:mbtl/dashboardPage.dart';
import 'package:toast/toast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controller = new TextEditingController();
  TextEditingController controller2 = new TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validate() {
    if (formkey.currentState.validate()) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Dashboardpage(),
          ));
    } else {
      print("not validated");
    }
  }

  String validatepass(value) {
    if (value.isEmpty) {
      return 'Required*';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 35.0, right: 35.0, top: 65.0),
            child: Image.asset('assets/2.png'),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            height: 400,
            width: 50,
            child: Center(
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 50, left: 60, right: 60),
                      child: TextFormField(
                        controller: controller,
                        autovalidate: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'User',
                        ),
                        validator: validatepass,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 40, left: 60, right: 60),
                      child: TextFormField(
                        controller: controller2,
                        autovalidate: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password'),
                        validator: validatepass,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 250),
                      child: FloatingActionButton(
                          onPressed: validate,
                          backgroundColor: Colors.grey,
                          child: Icon(Icons.arrow_forward_ios)),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Created By",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Tirthesh Dilip Nahar",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
