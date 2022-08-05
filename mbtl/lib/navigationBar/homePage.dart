import 'package:flutter/material.dart';
import 'package:mbtl/tabsview/commitee.dart';
import 'package:mbtl/tabsview/member.dart';
import 'package:mbtl/tabsview/sponsorer.dart';
import 'package:toast/toast.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(),
                child: Container(
                  height: 60,
                  width: 320,
                  margin: EdgeInsets.only(left: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: TabBar(
                    indicatorColor: Colors.green[900],
                    isScrollable: true,
                    unselectedLabelColor: Colors.black,
                    labelColor: Colors.green[900],
                    indicatorSize: TabBarIndicatorSize.label,
                    controller: tabController,
                    tabs: <Widget>[
                      Tab(
                        child: Text(
                          "Sponorer",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Commite",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Member",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 550,
            width: 360,
            child: TabBarView(controller: tabController, children: [
              new Sponsorer(),
              new Commitee(),
              new Members(),
            ]),
          ),
        ],
      ),
    );
  }
}
