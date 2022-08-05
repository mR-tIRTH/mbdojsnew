import 'package:flutter/material.dart';

class MembersDetails extends StatefulWidget {
  var name, image, fullname, address, vaas;

  MembersDetails(
      {Key key,
      @required this.name,
      this.image,
      this.fullname,
      this.address,
      this.vaas})
      : super(key: key);
  @override
  _MembersDetailsState createState() =>
      _MembersDetailsState(name, image, fullname, address, vaas);
}

class _MembersDetailsState extends State<MembersDetails>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 2, vsync: this);
  }

  var name, image, fullname, address, vaas;
  _MembersDetailsState(
      this.name, this.image, this.fullname, this.address, this.vaas);

  Widget _buildList(var lname) {
    return Container(
      height: 60,
      width: 350,
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: Color((0xFFD6F7FA)), borderRadius: BorderRadius.circular(50)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text("   Name: " + lname,
                  overflow: TextOverflow.visible,
                  style: TextStyle(fontSize: 20, wordSpacing: 2)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          leading: Container(
            child: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.black,
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          centerTitle: true,
          title: Text(
            "Display page",
            style: TextStyle(color: Colors.black),
          ),
          bottom: TabBar(
              indicatorColor: Color(0xDE3A7E99),
              unselectedLabelColor: Colors.black,
              labelColor: Color(0xDE3A7E99),
              controller: tabController,
              tabs: [
                Tab(
                  child: Text("Personal"),
                ),
                Tab(
                  child: Text("General"),
                ),
              ]),
        ),
        body: TabBarView(controller: tabController, children: [
          Container(
            child: ListView(
              children: [
                Container(
                  height: 300,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFD6F7FA),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 250,
                        height: 250,
                        margin: EdgeInsets.only(left: 50),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(image),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 30,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFD6F7FA),
                  ),
                   child:Container(
                        width: 25,
                        height: 25,
                        margin: EdgeInsets.only(left: 10),
                        child: Text("$fullname",style: TextStyle(fontSize: 25),),
                      ),
                ),
                Container(
                  height: 100,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFD6F7FA),

                  ),
                   child:Container(
                        width: 25,
                        height: 25,
                        margin: EdgeInsets.only(left: 10),
                        child: Text("$address",style:TextStyle(fontSize: 25,),),
                      ),
                ),
                Container(
                  height: 30,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFD6F7FA),
                  ),
                   child:Container(
                        width: 25,
                        height: 25,
                        margin: EdgeInsets.only(left: 10),
                        child: Text("$vaas",style: TextStyle(fontSize: 25),),
                      ),
                ),
                
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[],
            ),
          )
        ]));
  }
}
