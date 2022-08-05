import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Sponsorer extends StatefulWidget {
  @override
  _SponsorerState createState() => _SponsorerState();
}

@override
class _SponsorerState extends State<Sponsorer> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('spons').snapshots(),
      builder: (context, snapshot) {
        return !snapshot.hasData
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot data = snapshot.data.docs[index];
                  String url = data.data()['img'];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          height: 310,
                          margin: EdgeInsets.only(
                              left: 20, top: 20, bottom: 60, right: 20),
                          width: 300,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 5, color: Colors.brown)),
                          child: url == null
                              ? Container(
                                  child: Text("not found"),
                                )
                              : Image.network(
                                  url,
                                  fit: BoxFit.cover,
                                )),
                      Container(
                          child: Center(
                        child: Text("App's Sponsorer",
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w900,
                                fontSize: 20,
                                wordSpacing: 5,
                                color: Colors.black)),
                      )),
                      Container(
                          child: Center(
                        child: Text(data.data()['name'] + " and family",
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w900,
                                fontSize: 20,
                                wordSpacing: 5,
                                color: Colors.black)),
                      )),
                      Container(
                          child: Center(
                        child: Text("2021-2022",
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w900,
                                fontSize: 20,
                                wordSpacing: 5,
                                color: Colors.black)),
                      )),
                    ],
                  );
                },
              );
      },
    );
  }
}
