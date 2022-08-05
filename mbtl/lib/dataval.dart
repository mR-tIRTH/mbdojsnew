import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';

class Dataval extends StatefulWidget {
  var value;
  Dataval({Key key, @required this.value}) : super(key: key);

  @override
  _DatavalState createState() => _DatavalState(value);
}

class _DatavalState extends State<Dataval> {
  var value;

  _DatavalState(this.value);
  TextEditingController controller = new TextEditingController();
  TextEditingController controller1 = new TextEditingController();
  TextEditingController controller2 = new TextEditingController();
  TextEditingController controller3 = new TextEditingController();
  TextEditingController controller4 = new TextEditingController();
  TextEditingController controller6 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Text(
              "Personal Details",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: TextFormField(
                controller: controller6,
                decoration: InputDecoration(
                  labelText: "Short Name",
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: 'Full Head name',
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: TextFormField(
                controller: controller1,
                decoration: InputDecoration(
                  labelText: 'Permanent Address',
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: TextFormField(
                controller: controller2,
                decoration: InputDecoration(
                  labelText: 'Vaas',
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: TextFormField(
                controller: controller3,
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: TextFormField(
                controller: controller4,
                decoration: InputDecoration(
                  labelText: 'Office Address',
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    child: Text("Submit"),
                    onPressed: () {
                      Toast.show("Data Submitted", context,
                          duration: Toast.LENGTH_LONG, gravity: Toast.TOP);
                      FirebaseFirestore.instance
                          .collection('Commitee')
                          .doc()
                          .set({
                        'name': controller6.text,
                        'Full_name': controller.text,
                        'address': controller1.text,
                        'vaas': controller2.text,
                        'number': controller3.text,
                        'officeaddress': controller4.text,
                        'url': value,
                      });
                    }),
                ElevatedButton(
                    child: Text("Exit"),
                    onPressed: () {
                      SystemNavigator.pop();
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
