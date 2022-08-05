import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mbtl/Details/member_details.dart';
import 'package:url_launcher/url_launcher.dart' as urlLauncher;

final Callservice _service = locator<Callservice>();

class Callservice {
  void call(var number) => urlLauncher.launch("tel:$number");
}

GetIt locator = GetIt();
void set() {
  locator.registerSingleton(Callservice());
}

class Members extends StatefulWidget {
  @override
  _MembersState createState() => _MembersState();
}

class _MembersState extends State<Members> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('members')
          .orderBy('name')
          .snapshots(),
      builder: (context, snapshot) {
        return !snapshot.hasData
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot data = snapshot.data.docs[index];
                  String url = data.data()['url'];
                  return _buildlayout(
                    data.data()['url'],
                    data.data()['name'],
                    data.data()['number'],
                    context,
                    data.data()['Full_name'],
                    data.data()['Sr_no'],
                    data.data()['address'],
                    data.data()['vaas'],
                  );
                },
              );
      },
    );
  }
}

_buildlayout(String image, String name, var number, BuildContext context,
    String fullname, String srno, String address, String vaas) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MembersDetails(
                  name: name,
                  image: image,
                  fullname: fullname,
                  address: address,
                  vaas: vaas)));
    },
    child: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        height: 150,
        width: 200,
        margin: EdgeInsets.only(left: 1, right: 1, top: 15),
        decoration: BoxDecoration(
            color: Color(0xFFACF8D8), borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: NetworkImage(image))),
            ),
            Container(
                margin: EdgeInsets.only(top: 15, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.green[900]),
                    ),
                    SizedBox(
                      height: 05,
                    ),
                    Text(
                      "Olli no : " + srno,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.green[900]),
                    ),
                    SizedBox(
                      height: 05,
                    ),
                    Text(
                      number,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.green[900]),
                    ),
                    SizedBox(
                      height: 05,
                    ),
                    Center(
                      child: Container(
                        height: 40,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green[300],
                        ),
                        child: IconButton(
                            icon: Icon(Icons.call),
                            onPressed: () {
                              _service.call(number);
                            }),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    ),
  );
}
