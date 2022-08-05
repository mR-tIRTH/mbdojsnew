import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:toast/toast.dart';
import 'package:transparent_image/transparent_image.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Events')
            .orderBy('dateinserted')
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
                      data.data()['description'],
                      data.data()['dateinserted'],
                    );
                  },
                );
        },
      ),
    );
  }

  _buildlayout(String image, String des, String date) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        height: 350,
        width: 250,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(0xFFACF8D8),

          // image:
          //     DecorationImage(image: NetworkImage(image), fit: BoxFit.contain),
        ),
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin:
                    EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                child: GestureDetector(
                  child: Image.network(
                    image,
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return DetailScreen(image: image);
                    }));
                  },
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 20, top: 300),
                child: Text(
                  "Description : " + des,
                  style: TextStyle(fontSize: 15),
                )),
            Container(
                margin: EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  "Date : " + date,
                  style: TextStyle(fontSize: 15),
                )),
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  var image;
  DetailScreen({this.image});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Container(
            height: 750,
            child: Center(
              child: Image.network(
                image,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
                icon: Icon(Icons.arrow_downward),
                color: Colors.black,
                iconSize: 30,
                onPressed: () async {
                  final status = await Permission.storage.request();
                  if (status.isGranted) {
                    final externaldir = await getExternalStorageDirectory();

                    FlutterDownloader.enqueue(
                      url: image,
                      savedDir: externaldir.path,
                      fileName: 'download',
                      showNotification: true,
                      openFileFromNotification: true,
                    );
                    Toast.show("Downloaded", context,
                        duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
                  } else {
                    print("denied");
                  }
                }),
          ),
        ],
      ),
    );
  }
}
